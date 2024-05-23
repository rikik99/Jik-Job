 package com.green.community.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.green.community.domain.CommunityVo;
import com.green.community.mapper.CommunityMapper;



@Controller
@RequestMapping("/Community")
public class CommunityController {
	
	@Autowired
	private CommunityMapper communityMapper;
	@RequestMapping("/ComuHome")
	public ModelAndView comuList(CommunityVo communityVo) throws JsonProcessingException {
		
		CommunityVo  vo =  communityMapper.getcommunityVo( communityVo );
	    // 게시물 정보 가져오기
	    List<CommunityVo> list = communityMapper.getCBoardPagingList(communityVo);
	    
        
        
		ModelAndView mv = new ModelAndView();
		mv.addObject("communityList",list);
		mv.addObject("vo", vo);
		
		mv.setViewName("community/comuHome");
		return mv;		
	}
	
	@RequestMapping("/WriteForm")
	public ModelAndView writeForm(CommunityVo communityVo) {
		
		
		String com_id = communityVo.getCom_id();
		
		ModelAndView  mv  =  new ModelAndView();
		
		mv.addObject("com_id", com_id);
		
		mv.setViewName("community/write");
		
		return mv;	
	}
	
	@RequestMapping("/Write")
	public ModelAndView write(CommunityVo communityVo) {
		
		communityMapper.insertBoard(communityVo);
		CommunityVo  vo =  communityMapper.getcommunityVo( communityVo );
		String com_id = communityVo.getCom_id();
		
		ModelAndView mv = new ModelAndView()	;
		mv.addObject("vo", vo);
		mv.addObject("com_id", com_id);
		mv.setViewName("redirect:/Community/ComuHome");
		return mv;
	}
	
	@RequestMapping("/View")
	public ModelAndView view (CommunityVo communityVo) {

		// 조회수 증가 ( 현재 BNO의 HIT = HIT + 1 )
		communityMapper.incHit( communityVo );
		
		// bno 로 조회한 게시글 정보
		CommunityVo  vo =  communityMapper.getcommunityVo( communityVo );
		
		// bno 로 조회한 댓글들 정보
		List<CommunityVo> commentList = communityMapper.getCBoardCommentList(communityVo);
	
		// vo.content 안의 \n(엔터) 를 '<br>' 로 변경한다
		String content = vo.getCcomu_content();
		if (content != null ) {
			content  =	content.replace("\n", "<br>");
			vo.setCcomu_content(content);
		}
		
		System.out.println(vo);
		System.out.println(commentList);
		ModelAndView  mv  =  new ModelAndView();
		mv.addObject("vo", vo);
		mv.addObject("commentList", commentList);
		mv.setViewName("community/view");

		return mv;
	}
	@RequestMapping("/MyListView")
	public ModelAndView myListView (CommunityVo communityVo) {

		// 조회수 증가 ( 현재 BNO의 HIT = HIT + 1 )
		communityMapper.incHit( communityVo );
		
		// bno 로 조회한 게시글 정보
		CommunityVo  vo =  communityMapper.getcommunityVo( communityVo );
		
		// bno 로 조회한 댓글들 정보
		List<CommunityVo> commentList = communityMapper.getCBoardCommentList(communityVo);
	
		// vo.content 안의 \n(엔터) 를 '<br>' 로 변경한다
		String content = vo.getCcomu_content();
		if (content != null ) {
			content  =	content.replace("\n", "<br>");
			vo.setCcomu_content(content);
		}
		
		System.out.println(vo);
		System.out.println(commentList);
		ModelAndView  mv  =  new ModelAndView();
		mv.addObject("vo", vo);
		mv.addObject("commentList", commentList);
		mv.setViewName("community/myListView");

		return mv;
	}
	@RequestMapping("/MyList")
	public ModelAndView myList (CommunityVo communityVo) {

	
		List<CommunityVo> communityList = communityMapper.getMycommunityVo(communityVo);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("communityList",communityList);
		mv.setViewName("community/myList");
		return mv;	
	}
	@RequestMapping("/UpdateForm")
	public ModelAndView updateForm (CommunityVo communityVo) {

		CommunityVo  vo =  communityMapper.getcommunityVo( communityVo );
		String com_id = communityVo.getCom_id();
		int ccomu_bno = communityVo.getCcomu_bno();
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo",vo);
		mv.addObject("com_id",com_id);
		mv.addObject("ccomu_bno",ccomu_bno);
		mv.setViewName("/community/update");
		return mv;	
	}
	
	@RequestMapping("/Update")
	public  ModelAndView  update( CommunityVo communityVo) {
		
		// 수정
		communityMapper.updateBoard( communityVo );
		
		String com_id = communityVo.getCom_id();
		int ccomu_bno = communityVo.getCcomu_bno();
		
		ModelAndView mv = new ModelAndView()	;
		mv.addObject("com_id",com_id);
		mv.addObject("ccomu_bno",ccomu_bno);
		mv.setViewName("redirect:/Community/ComuHome");
		return mv;
	}
	
	@PostMapping("/Delete")
	@ResponseBody
	public  ResponseEntity<String>  delete(@RequestBody CommunityVo communityVo ) {
	
		try {
            // 삭제 작업 수행
            communityMapper.deleteBoard(communityVo);
            
            return ResponseEntity.ok("삭제되었습니다.");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("삭제 중 오류가 발생했습니다.");
        }
	}
	
}
