package com.education.service;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.education.dao.BookMapper;
import com.education.pojo.Book;
import com.education.pojo.BookExample;
import com.education.pojo.BookExample.Criteria;


@Service
public class BookService {

	@Autowired
	private BookMapper dao;

	// 书籍入库
	public String editBook(MultipartFile image, Book book) throws IllegalStateException, IOException {

		BookExample example = new BookExample();
		Criteria criteria = example.createCriteria();
		criteria.andNameEqualTo(book.getName());
		criteria.andAuthorEqualTo(book.getAuthor());
		criteria.andPublishEqualTo(book.getPublish());
		List<Book> lists = dao.selectByExample(example);

		if (lists.size() >= 1) {
			if (lists.size() == 1) {
				if (lists.get(0).getId() != book.getId()) {
					return "已存在与该书相同书名、作者、出版社的图书，请重新输入！！！";
				}
			} else {
				return "已存在与该书相同书名、作者、出版社的图书，请重新输入！！！";
			}

		}
		if (image != null) {
			String saveImagePath = "E:\\file\\tomcat\\book\\bookImage";
			String oldFileName = image.getOriginalFilename(); // 获取上传文件1的原名
			String fileName = "";
			// 上传图片
			if (image != null && oldFileName != null && oldFileName.length() > 0) {
				// 新的图片名称
				String newFileName = UUID.randomUUID() + oldFileName.substring(oldFileName.lastIndexOf("."));
				// 新图片
				File newFile = new File(saveImagePath + "\\" + newFileName);
				// 将内存中的数据写入磁盘
				image.transferTo(newFile);
				// 将新图片名称返回到前端
				fileName = newFileName;
			}
			book.setPicurl(fileName);
		}

		int result = dao.updateByPrimaryKeySelective(book);

		return result == 1 ? "SUCCESS" : "未知错误，请刷新充重试！！";
	}

	// 通过Id获取书籍
	public Book getBookById(Integer bookId) {
		return dao.selectByPrimaryKey(bookId);
	}

	// 获取所有书籍
	public List<Book> getCanBorrowBook() {
		BookExample example = new BookExample();
		Criteria criteria = example.createCriteria();
		criteria.andTotalcountGreaterThan(0);
		List<Book> lists = dao.selectByExample(example);
		return lists;
	}

	// 获取所有书籍
	public List<Book> getAllHotBook() {
		BookExample example = new BookExample();
		example.setOrderByClause("borrowCount desc");
		List<Book> lists = dao.selectByExample(example);
		return lists;
	}

	// 获取所有书籍
	public List<Book> getAllBook() {
		BookExample example = new BookExample();
		List<Book> lists = dao.selectByExample(example);
		return lists;
	}

	// 书籍入库
	public String addBook(MultipartFile image, MultipartFile doc, Book book) throws IllegalStateException, IOException {

		BookExample example = new BookExample();
		Criteria criteria = example.createCriteria();
		criteria.andNameEqualTo(book.getName());
		criteria.andAuthorEqualTo(book.getAuthor());
		criteria.andPublishEqualTo(book.getPublish());
		int count = dao.countByExample(example);
		if (count > 1) {
			return "已存在与该书相同书名、作者、出版社的图书，请重新输入！！！";
		}

		String saveImagePath = "E:\\file\\tomcat\\book\\bookImage";
		String saveDocPath = "E:\\file\\tomcat\\book\\bookDoc";
		if (image == null) {
			return "图片不存在，请重新上传！";
		}

		String oldFileName = image.getOriginalFilename(); // 获取上传文件1的原名
		String fileName = "";
		// 上传图片
		if (image != null && oldFileName != null && oldFileName.length() > 0) {
			// 新的图片名称
			String newFileName = UUID.randomUUID() + oldFileName.substring(oldFileName.lastIndexOf("."));
			// 新图片
			File newFile = new File(saveImagePath + "\\" + newFileName);
			// 将内存中的数据写入磁盘
			image.transferTo(newFile);
			// 将新图片名称返回到前端
			fileName = newFileName;
		}
		book.setPicurl(fileName);

		if (doc != null) {
			oldFileName = doc.getOriginalFilename(); // 获取上传文件1的原名
			fileName = "";
			// 上传电子版
			if (doc != null && oldFileName != null && oldFileName.length() > 0) {
				// 新的图片名称
				String newFileName = UUID.randomUUID() + oldFileName.substring(oldFileName.lastIndexOf("."));
				// 新图片
				File newFile = new File(saveDocPath + "\\" + newFileName);
				// 将内存中的数据写入磁盘
				doc.transferTo(newFile);
				// 将新图片名称返回到前端
				fileName = newFileName;
			}
			book.setDocurl(fileName);
		}

		book.setInputdate(new Date());
		book.setStatus("已入库");

		int result = dao.insertSelective(book);

		return result == 1 ? "SUCCESS" : "未知错误，请刷新充重试！！";
	}

}
