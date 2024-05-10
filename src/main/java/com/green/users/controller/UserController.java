package com.green.users.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.green.users.domain.UserVo;
import com.green.users.mapper.UserMapper;
import com.green.users.resume.domain.ResumeVo;
import com.green.users.resume.mapper.ResumeMapper;

@Controller
@RequestMapping("/Users")
public class UserController {

	@Autowired
	private ResumeMapper resumeMapper;
	@Autowired
	private UserMapper userMapper;
	@RequestMapping("/Info")
	   public  ModelAndView  Info(UserVo userVo) {
		UserVo vo = userMapper.Pgetuser( userVo );
		ModelAndView   mv  =  new ModelAndView();
		mv.addObject("vo", vo);
		mv.setViewName("user/info");
		return         mv;
	   }

	

	
	@RequestMapping("/ResumeForm")
	public  ModelAndView  ResumeForm ( ResumeVo resumeVo  ) {
		List<ResumeVo> resumeList = resumeMapper.LgetResumeList( resumeVo );
		ModelAndView   mv   =  new  ModelAndView();
		mv.addObject("resumeList", resumeList);
		mv.setViewName("user/resumeForm");
		return mv;
	}
	@RequestMapping("/ResumeMake")
	public  ModelAndView  SaveResumeForm ( UserVo userVo  ) {
		
		UserVo vo  =  userMapper.LgetUser( userVo );
		ModelAndView   mv   =  new  ModelAndView();
		mv.addObject("vo", vo);
		mv.setViewName("user/resumeMake");
		return mv;
	}
	@RequestMapping("/SaveResume")
	public  ModelAndView  saveResume ( ResumeVo resumeVo ) {
		
		resumeMapper.LinsertResume( resumeVo );
		
		String user_id = resumeVo.getUser_id();
		
		ModelAndView   mv   =  new  ModelAndView();
		mv.setViewName("redirect:/Users/ResumeForm?user_id="+ user_id);
		return mv;
	}

	@RequestMapping("/Infoedit")
	   public  ModelAndView  InfoEdit(UserVo userVo) {
		UserVo vo = userMapper.Pgetedituser( userVo );
		ModelAndView   mv  =  new ModelAndView();
		mv.addObject("vo", vo);
		mv.setViewName("user/infoedit");
		return mv;
	
	}
	@RequestMapping("/InfoUpdate")
	public  ModelAndView  infoUpdate(UserVo userVo) {
		userMapper.PupdateInfo(userVo);
		ModelAndView   mv  =  new ModelAndView();
		String User=userVo.getUser();
		mv.setViewName("user/infoedit");
		return mv;
	}
	
}
