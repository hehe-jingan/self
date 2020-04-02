///**
// * @Copyright:Copyright (c) 1991 - 2018
// * @Company: Macroview
// */
//package com.education.controller;
//
//import java.io.File;
//import java.io.IOException;
//import java.util.UUID;
//
//import javax.servlet.http.HttpServletRequest;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.multipart.MultipartFile;
//import org.springframework.web.servlet.ModelAndView;
//
//import com.alibaba.fastjson.JSONObject;
//import com.education.pojo.User;
//import com.education.service.UserService;
//import com.education.utils.CommandMethods;
//
///**
// * @author joy_zheng
// * @since: v1.0
// */
//@Controller
//@RequestMapping(value = "/user")
//public class UserController {
//
//	@Autowired
//	private UserService userService;
//
//
//
//	// 主页
//	@RequestMapping(value = "/index", method = RequestMethod.GET)
//	public ModelAndView showHome() {
//		ModelAndView mv = new ModelAndView("user/index");
//
//		return mv;
//	}
//
//	// 修改密码
//	@RequestMapping(value = "/changePass", method = RequestMethod.POST)
//	@ResponseBody
//	public JSONObject changePass(HttpServletRequest request, String newPass, String oldPass) {
//		JSONObject jsonObject = new JSONObject();
//
//		String msg = "error";
//		User user = CommandMethods.checkLogin(request);
//		if (user == null) {
//			msg = "用户未登录！";
//		}
//		else {
//			msg = userService.changePass(user, newPass, oldPass, request);
//		}
//		jsonObject.put("msg", msg);
//
//		return jsonObject;
//	}
//
//	// 修改密码页面
//	@RequestMapping(value = "/changePass", method = RequestMethod.GET)
//	public ModelAndView showChangePass(HttpServletRequest request) {
//		ModelAndView mv = new ModelAndView("user/forgetPass");
//		return mv;
//	}
//
//	// 个人信息页面
//	@RequestMapping(value = "/userInfo", method = RequestMethod.GET)
//	public ModelAndView showUserInfo(HttpServletRequest request) {
//		ModelAndView mv = new ModelAndView("user/userInfo");
//		User user = CommandMethods.checkLogin(request);
//		if (user == null) {
//			return mv;
//		}
//		mv.addObject("user", user);
//		return mv;
//	}
//
//	// 上传图片
//	@RequestMapping(value = "/upload/{type}", method = RequestMethod.POST)
//	@ResponseBody
//	public JSONObject uploadFile(MultipartFile file, @PathVariable String type) throws IllegalStateException, IOException {
//		JSONObject jsonObject = new JSONObject();
//
//		String saveFilePath = "E:\\file\\tomcat\\book\\bookImage\\" + type;
//		String msg = "图片错误，请重新上传！";
//		String oldFileName = file.getOriginalFilename(); // 获取上传文件1的原名
//
//		String fileName = "";
//		// 上传图片
//		if (file != null && oldFileName != null && oldFileName.length() > 0) {
//			// 新的图片名称
//			String newFileName = UUID.randomUUID() + oldFileName.substring(oldFileName.lastIndexOf("."));
//			// 新图片
//			File newFile = new File(saveFilePath + "\\" + newFileName);
//			// 将内存中的数据写入磁盘
//			file.transferTo(newFile);
//			// 将新图片名称返回到前端
//			fileName = newFileName;
//			msg = "success";
//		}
//
//		jsonObject.put("msg", msg);
//		jsonObject.put("filename", fileName);
//		return jsonObject;
//	}
//
//}
