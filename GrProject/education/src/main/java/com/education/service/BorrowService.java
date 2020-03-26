package com.education.service;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.education.dao.BookMapper;
import com.education.dao.BorrowMapper;
import com.education.pojo.Book;
import com.education.pojo.Borrow;
import com.education.pojo.BorrowExample;
import com.education.pojo.BorrowExample.Criteria;
import com.education.pojo.User;


@Service
public class BorrowService {

	@Autowired
	private BorrowMapper dao;
	
	@Autowired
	private BookMapper bookDao;
	
	//还书
	public String returnBook(Integer borrowId) {
		
		Borrow borrow = dao.selectByPrimaryKey(borrowId);
		if(borrow==null) {
			return "找不到该图书，情刷新重试！！";
		}
		
		borrow.setRealdate(new Date());
		borrow.setStatus("已归还");
		int result = dao.updateByPrimaryKeySelective(borrow);
		if(result==1) {
			Book book = bookDao.selectByPrimaryKey(borrow.getBookid());
			book.setTotalcount(book.getTotalcount()+1);
			result = bookDao.updateByPrimaryKeySelective(book);
		}
		
		return result==1?"SUCCESS":"还书失败，请刷新重试！！";
		
	}

	//获取所有已借阅书籍
	public List<HashMap<String, Object>> getAllBorrowBook(HttpServletRequest request,String type){
		User user = null;
		if(request!=null) {
			if(request.getSession().getAttribute("user")!=null){
				user = (User)request.getSession().getAttribute("user");
				return dao.getAllBorrow(type, user.getId());
			}
		}
			return dao.getAllBorrow(type,null);
		
		
	}
	
	//续借书籍
	public String reNewBook(Integer borrowId){
		
		Borrow borrow = dao.selectByPrimaryKey(borrowId);
		if(borrow == null){
			return "暂无改图书信息，请刷新重试！！！";
		}
		Date returnDate = borrow.getReturndate();
		Calendar cal = Calendar.getInstance();
		cal.setTime(returnDate);
		cal.set(Calendar.DAY_OF_MONTH, 15);
		borrow.setReturndate(cal.getTime());
		borrow.setStatus("续借中");
		
		
		int result = dao.updateByPrimaryKeySelective(borrow);
		
		return result==1?"SUCCESS":"续借书籍失败，请刷新重试！！";
	}
	
	
	//预借书籍
	public String preBorrowBook(Integer bookId,String certNo) {
		
		Book book = bookDao.selectByPrimaryKey(bookId);
		if(book.getTotalcount()==0) {
			return "该图书库存为零，请预借其他书籍";
		}
		
		
		
		BorrowExample example = new BorrowExample();
		Criteria criteria = example.createCriteria();
		criteria.andBookidEqualTo(bookId);
		criteria.andCertnoEqualTo(certNo);
		criteria.andStatusNotEqualTo("已归还");
		criteria.andStatusNotEqualTo("取消预约");
		int count = dao.countByExample(example);
		if(count >= 1) {
			return "你已经预借或借阅本书，请勿重复预借！！！";
		}
		
		BorrowExample example1 = new BorrowExample();
		Criteria criteria1 = example1.createCriteria();
		criteria1.andCertnoEqualTo(certNo);
		criteria1.andStatusNotEqualTo("已归还");
		criteria1.andStatusNotEqualTo("取消预约");
		count = dao.countByExample(example1);
		if (count >= 3) {
			return "您已借阅或预借了三本图书!请归还后再借阅！！";
		}
		
		
		Borrow borrow = new Borrow();
		borrow.setCertno(certNo);
		borrow.setBookid(bookId);
		
		borrow.setStatus("预借中");
		int result = dao.insert(borrow);
		if(result==1) {
			book.setTotalcount(book.getTotalcount()-1);
			result = bookDao.updateByPrimaryKeySelective(book);
		}else {
			return "预借失败，请刷新重试！！";
		}
		return result == 1?"SUCCESS":"未知错误，请刷新重试！！！";
		
		
	}
	
	// 借阅书籍
	public String borrowBook(String certNo, Integer days, Integer bookId) {
		Book book = bookDao.selectByPrimaryKey(bookId);
		BorrowExample example = new BorrowExample();
		Criteria criteria = example.createCriteria();
		criteria.andCertnoEqualTo(certNo);
		criteria.andBookidEqualTo(bookId);
		criteria.andStatusNotEqualTo("已归还");
		criteria.andStatusNotEqualTo("取消预约");
		int result = dao.countByExample(example);
		if (result >= 1) {
			List<Borrow> list = dao.selectByExample(example);
			if(result==1&&list.get(0).getStatus().equals("预借中")) {
				Borrow borrow = list.get(0);
				borrow.setStatus("租借中");
				Date nowDate = new Date();
				borrow.setBorrowdate(nowDate);
				Calendar calendar = Calendar.getInstance();
				calendar.add(Calendar.DAY_OF_MONTH, days);
				borrow.setReturndate(calendar.getTime());
				result = dao.updateByPrimaryKeySelective(borrow);
				if(result==1) {
					book.setBorrowcount(book.getBorrowcount()+1);
					result = bookDao.updateByPrimaryKeySelective(book);
				}else {
					return "借阅失败，请刷新重试！！";
				}
				
				return result == 1?"SUCCESS":"未知错误，请刷新重试！！！";
			}
			
			return "您已借阅或已预借了该图书!";
		}
		
		
		if(book.getTotalcount()==0) {
			return "图书库存不足，请选择其他图书！！！";
		}
		
		BorrowExample example1 = new BorrowExample();
		Criteria criteria1 = example1.createCriteria();
		criteria1.andCertnoEqualTo(certNo);
		criteria1.andStatusNotEqualTo("已归还");
		criteria1.andStatusNotEqualTo("取消预约");
		result = dao.countByExample(example1);
		if (result >= 3) {
			return "您已借阅或预借了三本图书!请归还后再借阅！！";
		}
		Date nowDate = new Date();
		Borrow borrow = new Borrow();
		borrow.setBorrowdate(nowDate);
		borrow.setCertno(certNo);
		borrow.setBookid(bookId);
		
		Calendar calendar = Calendar.getInstance();
		calendar.add(Calendar.DAY_OF_MONTH, days);
		borrow.setReturndate(calendar.getTime());
		borrow.setStatus("租借中");
		result = dao.insert(borrow);
		book.setTotalcount(book.getTotalcount()-1);
		book.setBorrowcount(book.getBorrowcount()+1);
		bookDao.updateByPrimaryKeySelective(book);
		return result == 1?"SUCCESS":"未知错误，请刷新重试！！！";
	}

}
