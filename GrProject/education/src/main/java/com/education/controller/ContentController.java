package com.education.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.education.service.ContentService;

@Controller
@RequestMapping(value="/content")
public class ContentController {
	
	
	@Autowired
	private ContentService contentService;
	
	
	//删除留言
	@RequestMapping(value="/deleteContent",method=RequestMethod.POST)
	@ResponseBody
	public JSONObject deleteContent(Integer contentId){
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("msg", contentService.deleteContent(contentId));
		return jsonObject;
	}
	
	//留言详情
	@RequestMapping(value="/contentDetail/{contentId}",method=RequestMethod.GET)
	public ModelAndView showContentDetail(@PathVariable Integer contentId){
		ModelAndView mv = new ModelAndView("admin/contentDetail");
		mv.addObject("content", contentService.getContentById(contentId));
		return mv;
	}
	
	//所有留言页面
	@RequestMapping(value="/contentList",method=RequestMethod.GET)
	public ModelAndView showContentlist(){
		ModelAndView mv = new ModelAndView("admin/contentList");
		mv.addObject("contentList", contentService.getAllContent());
		return mv;
	}
	
	//留言
	@RequestMapping(value="/addContent",method=RequestMethod.POST)
	@ResponseBody
	public JSONObject addContent(String title,String name,String mail,String message){
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("msg", contentService.addMessage(name, mail, title, message));
		return jsonObject;
	}
	

}
