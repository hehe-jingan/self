/**
 * @Copyright:Copyright (c) 1991 - 2018
 * @Company: Macroview
 */
package com.education.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.education.pojo.User;
import com.education.service.BookContentService;
import com.education.service.BookService;
import com.education.service.BorrowService;
import com.education.service.MessageService;
import com.education.service.UserService;
import com.education.utils.CommandMethods;

/**
 * @author joy_zheng
 * @since: v1.0
 */
@Controller
@RequestMapping(value = "/user")
public class UserController {

	@Autowired
	private UserService userService;

	@Autowired
	private MessageService messageService;

	@Autowired
	private BookService bookService;

	@Autowired
	private BorrowService borrowSerice;
	
	@Autowired
	private BookContentService bookContentService;

	// 获取所有续借图书
		@RequestMapping(value = "/allOnlineBook", method = RequestMethod.GET)
		public ModelAndView showAllOnlineBook(HttpServletRequest request) {
			ModelAndView mv = new ModelAndView("user/allOnlineList");
			List<HashMap<String, Object>> lists = borrowSerice.getAllBorrowBook(request,"预借中");
			mv.addObject("borrowList", lists);

			return mv;
		}
	
	//在线续借
	@RequestMapping(value="/reNewBook",method= RequestMethod.POST)
	@ResponseBody
	public JSONObject reNewBook(HttpServletRequest request,Integer borrowId){
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("msg", borrowSerice.reNewBook(borrowId));
		return jsonObject;
	}
	
	// 获取所有续借图书
	@RequestMapping(value = "/allReNewBook", method = RequestMethod.GET)
	public ModelAndView showAllReNewBook(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("user/allReNewList");
		List<HashMap<String, Object>> lists = borrowSerice.getAllBorrowBook(request,"续借中");
		mv.addObject("borrowList", lists);

		return mv;
	}

	// 获取所有租借图书
	@RequestMapping(value = "/allBorrowBook", method = RequestMethod.GET)
	public ModelAndView showAllBorrowBook(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("user/allBorrowList");

		List<HashMap<String, Object>> lists = borrowSerice.getAllBorrowBook(request,"租借中");
		mv.addObject("borrowList", lists);

		return mv;
	}

	// 在线预借
	@RequestMapping(value = "/preBorrowBook", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject preBorrowBook(HttpServletRequest request, Integer bookId) {
		JSONObject jsonObject = new JSONObject();

		User user = null;
		if (request.getSession().getAttribute("user") == null) {
			jsonObject.put("msg", "用户未登录！！");
			return jsonObject;
		}
		user = (User) request.getSession().getAttribute("user");
		jsonObject.put("msg", borrowSerice.preBorrowBook(bookId, user.getCertno()));
		return jsonObject;
	}
	
	//书籍评论删除
		@RequestMapping(value="/deleteBookContent",method=RequestMethod.POST)
		@ResponseBody
		public JSONObject deleteBookContent(Integer bookContentId){
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("msg", bookContentService.deleteContent(bookContentId));
			return jsonObject;
		}
	
	
	//书籍评论
	@RequestMapping(value="/addBookContent",method=RequestMethod.POST)
	@ResponseBody
	public JSONObject addBookContent(Integer userId,Integer bookId,String val){
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("msg", bookContentService.addContent(bookId, userId, val));
		return jsonObject;
	}
	

	// 书籍详情页面
	@RequestMapping(value = "/bookDetail/{bookId}", method = RequestMethod.GET)
	public ModelAndView showOnline(@PathVariable Integer bookId) {
		ModelAndView mv = new ModelAndView("user/bookDetail");
		mv.addObject("bookContentList",bookContentService.getAllBookContent());
		mv.addObject("book", bookService.getBookById(bookId));
		return mv;
	}

	// 书籍管理页面
	@RequestMapping(value = "/bookList", method = RequestMethod.GET)
	public ModelAndView showAllBook() {
		ModelAndView mv = new ModelAndView("user/bookList");
		mv.addObject("bookList", bookService.getAllBook());
		return mv;
	}

	// 获取通知数量
	@RequestMapping(value = "/getMessageCount", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject getMessageCount(Integer userId) {
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("msg", "success");
		jsonObject.put("data", messageService.countMessage(userId, "用户"));

		return jsonObject;
	}

	// 主页
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView showHome() {
		ModelAndView mv = new ModelAndView("user/index");

		return mv;
	}

	// 修改密码
	@RequestMapping(value = "/changePass", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject changePass(HttpServletRequest request, String newPass, String oldPass) {
		JSONObject jsonObject = new JSONObject();

		String msg = "error";
		User user = CommandMethods.checkLogin(request);
		if (user == null) {
			msg = "用户未登录！";
		}
		else {
			msg = userService.changePass(user, newPass, oldPass, request);
		}
		jsonObject.put("msg", msg);

		return jsonObject;
	}

	// 修改密码页面
	@RequestMapping(value = "/changePass", method = RequestMethod.GET)
	public ModelAndView showChangePass(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("user/forgetPass");
		return mv;
	}

	// 个人信息页面
	@RequestMapping(value = "/userInfo", method = RequestMethod.GET)
	public ModelAndView showUserInfo(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("user/userInfo");
		User user = CommandMethods.checkLogin(request);
		if (user == null) {
			return mv;
		}
		mv.addObject("user", user);
		return mv;
	}

	// 上传图片
	@RequestMapping(value = "/upload/{type}", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject uploadFile(MultipartFile file, @PathVariable String type) throws IllegalStateException, IOException {
		JSONObject jsonObject = new JSONObject();

		String saveFilePath = "E:\\file\\tomcat\\book\\bookImage\\" + type;
		String msg = "图片错误，请重新上传！";
		String oldFileName = file.getOriginalFilename(); // 获取上传文件1的原名

		String fileName = "";
		// 上传图片
		if (file != null && oldFileName != null && oldFileName.length() > 0) {
			// 新的图片名称
			String newFileName = UUID.randomUUID() + oldFileName.substring(oldFileName.lastIndexOf("."));
			// 新图片
			File newFile = new File(saveFilePath + "\\" + newFileName);
			// 将内存中的数据写入磁盘
			file.transferTo(newFile);
			// 将新图片名称返回到前端
			fileName = newFileName;
			msg = "success";
		}

		jsonObject.put("msg", msg);
		jsonObject.put("filename", fileName);
		return jsonObject;
	}

}
