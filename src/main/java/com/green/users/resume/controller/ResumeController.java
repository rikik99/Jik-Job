package com.green.users.resume.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.green.bookmark.domain.ComBookVo;
import com.green.bookmark.mapper.BookmarkMapper;
import com.green.company.domain.CompanyVo;
import com.green.notification.domain.NotificationVo;
import com.green.notification.mapper.NotificationMapper;
import com.green.users.apply.domain.ApplyVo;
import com.green.users.apply.mapper.ApplyMapper;
import com.green.users.domain.UserVo;
import com.green.users.post.domain.PostVo;
import com.green.users.post.mapper.PostMapper;
import com.green.users.resume.domain.ResumeVo;
import com.green.users.resume.mapper.ResumeMapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/Resume")
public class ResumeController {
	
	@Autowired
	private ResumeMapper resumeMapper;
	
	@Autowired
	private BookmarkMapper bookmarkMapper;
	
	@Autowired
	private ApplyMapper applyMapper;
	
	@Autowired
	private PostMapper postMapper;
	@Autowired
	private NotificationMapper notificationMapper;

	@RequestMapping("/List")
	public ModelAndView resumelist( ResumeVo resumeVo, String com_id ) {
		
		List<ResumeVo> resumeList = resumeMapper.KmakeResumeList( resumeVo, com_id );
		log.info("==============Resume/List==================");
		log.info("resumeList : {}", resumeList);
		log.info("==============Resume/List==================");
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("resumeList", resumeList);
		mv.setViewName("company/resumeList");
		return mv;
		
	}
	
	@RequestMapping("/View")
	public ModelAndView view( 
			ResumeVo resumeVo,
			UserVo userVo,
			ComBookVo comBookVo,
			@RequestParam(value="com_id") String com_id,
			@RequestParam(value="re_num") int re_num
			) {
		
		List<ResumeVo> resumeViewList = resumeMapper.KmakeResumeView( userVo, re_num );
		
		List<ComBookVo> getbookList = bookmarkMapper.getComBook( com_id, re_num );
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("resumeViewList", resumeViewList);
		mv.addObject("getbookList", getbookList);
		mv.addObject("re_num", re_num);
		mv.setViewName("company/resumeListGoView");
		return mv;
		
	}
	
	@GetMapping("/getRating")
	@ResponseBody
	public Integer getRating(
    		@RequestParam("user_id") String user_id,
    		@RequestParam("com_id") String com_id,
    		@RequestParam("rating") int rating
    		) {
		
		Integer getrating = resumeMapper.KgetRating(user_id, com_id, rating);
        
        return getrating != null ? rating : -1;
    }
	
	@PostMapping("/ratings/add")
	@ResponseBody
	public String addRating(
	    	@RequestParam("com_id") String com_id,
	    	@RequestParam("user_id") String user_id,
	    	@RequestParam("rating") int rating
	    	) {
			
		Integer ratings = resumeMapper.KgetRating(user_id, com_id, rating);
		log.info("========Company/ratings/add=========");
		log.info("ratings : {}", ratings);
		log.info("====================================");
		
		if (ratings != null) {
			resumeMapper.KupdateRating(com_id, user_id, rating);
	    } else {
	    	resumeMapper.KaddRating(com_id, user_id, rating);
	    }
			
		//companyMapper.KaddRating(com_id, user_id, rating);
			
	    return "Rating added successfully!";
	        
	}

	@RequestMapping("/GoRecommend")
	public ModelAndView gorecommend( 
			@RequestParam("re_num") int re_num,
			PostVo postVo,
			ResumeVo resumeVo,
			HttpServletRequest request
			) {
		
		HttpSession session = request.getSession();
		
		CompanyVo sessionCUser = (CompanyVo) session.getAttribute("clogin");
	    if(sessionCUser == null) {
	        return new ModelAndView("redirect:/LoginForm");
	    }
	    
	    ResumeVo vo = resumeMapper.KgetResumeInfo( resumeVo );
		
		List<PostVo> postList = postMapper.KgetpostList( sessionCUser );
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo", vo);
		mv.addObject("postList", postList);
		mv.addObject("re_num", re_num);
		mv.setViewName("company/postChoice");
		return mv;
		
	}
	@RequestMapping("/Recommend")
	public ModelAndView recommend( 
	        ApplyVo applyVo,
	        NotificationVo notificationVo,
	        @RequestParam(value="re_num") int re_num
	        ) {
	    
	    applyMapper.KinsertPostOffer(applyVo);
	    
	    List<UserVo> userInfo = notificationMapper.KgetUserInfo(re_num);
	    
	    String userId = userInfo.get(0).getUser_id();
	    System.out.println("==============================" + userId);
	    
	    notificationVo.setUser_id(userId);
	    
	    System.out.println("==============================" + userInfo);
	    
	    notificationMapper.insertNotification(notificationVo);
	    
	    ModelAndView mv = new ModelAndView();
	    mv.setViewName("company/resumeSuccess");
	    return mv;
	}


}
