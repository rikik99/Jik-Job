package com.green.company.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.green.company.applyed.domain.ApplyedVo;
import com.green.company.applyed.mapper.ApplyedMapper;
import com.green.company.domain.CompanyVo;
import com.green.company.mapper.CompanyMapper;
import com.green.users.apply.domain.ApplyVo;
import com.green.users.domain.UserVo;
import com.green.users.post.domain.PostVo;
import com.green.users.post.mapper.PostMapper;
import com.green.users.resume.domain.ResumeVo;
import com.green.users.resume.mapper.ResumeMapper;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/Company")
public class CompanyController {
	@Autowired
	private PostMapper postMapper;
	@Autowired
	private CompanyMapper companyMapper;
	
	@Autowired
	private ApplyedMapper applyedMapper;
	
	@Autowired
	private ResumeMapper resumeMapper;
	
	@RequestMapping("/Chome")
	public   ModelAndView   uhome() {		
		ModelAndView   mv  =  new ModelAndView();
		List<PostVo> postList = postMapper.LuserMainPostList();
		mv.addObject("postList", postList);
		mv.setViewName("company/chome");
		return mv;
	}
	@RequestMapping("/List")
	public ModelAndView list( PostVo postVo ) {
        List<PostVo> postList = postMapper.LgetPostList(postVo);
        ModelAndView   mv  =  new ModelAndView();
        mv.addObject("postList", postList);
        mv.setViewName("company/postList");
        return mv;
	}
	
	@RequestMapping("/CInfo")
	   public  ModelAndView  cInfo(CompanyVo companyVo, PostVo postVo) {
        PostVo pVo = postMapper.KgetPost(postVo);
		CompanyVo po = companyMapper.LgetCom( companyVo );
		ModelAndView   mv  =  new ModelAndView();
		mv.addObject("po", po);
        mv.addObject("pVo", pVo);
		mv.setViewName("company/cinfo");
		return         mv;
	   }
	@RequestMapping("/PostForm")
	public  ModelAndView  PostsForm ( PostVo postVo  ) {
		List<PostVo> postComList = postMapper.LComPostList( postVo );
		ModelAndView   mv   =  new  ModelAndView();
		mv.addObject("postList", postComList);
		mv.setViewName("company/postForm");
		return mv;
	}

	@RequestMapping("/PostMake")
	public  ModelAndView  SavePostForm ( CompanyVo companyVo  ) {
		CompanyVo vo  =  companyMapper.LgetCompany( companyVo );
		ModelAndView   mv   =  new  ModelAndView();
		mv.addObject("vo", vo);
		mv.setViewName("company/postMake");
		return mv;
	}
	
	@RequestMapping("/SavePost")
	public  ModelAndView  PostMake(PostVo postVo){
		postMapper.LinsertComPost( postVo );		
		ModelAndView   mv   =  new  ModelAndView();
		String com_id = postVo.getCom_id();
		mv.setViewName("redirect:/Company/PostForm?com_id=" + com_id);
		return   mv;
	}
	@RequestMapping("/PostDelete")
	   public  ModelAndView  deleteResume(PostVo postVo){
	      postMapper.LPostDelete( postVo );      
	      ModelAndView   mv   =  new  ModelAndView();
	      String com_id = postVo.getCom_id();
	      mv.setViewName("redirect:/Company/PostForm?com_id=" + com_id);
	      return   mv;
	   }
	@RequestMapping("/PostView")
	public  ModelAndView  PostView ( PostVo postVo, CompanyVo companyVo  ) {
		CompanyVo uvo  =  companyMapper.LgetComView( companyVo );
		PostVo rvo  =  postMapper.LgetPost( postVo );
		ModelAndView   mv   =  new  ModelAndView();
		mv.addObject("uvo", uvo);
		mv.addObject("rvo", rvo);
		mv.setViewName("company/postView");
		return mv;
	}
	@RequestMapping("/SupportedList")
	public ModelAndView supportedList(ApplyedVo applyedVo) {
		List<ApplyedVo> applyedList = applyedMapper.getApplyedList(applyedVo);
		ModelAndView mv = new ModelAndView();
		mv.addObject("applyedList", applyedList);
		mv.setViewName("company/supportedList");
		return mv;
	}
	@RequestMapping("/PostUpdate")
	public  ModelAndView  updateResume ( PostVo postVo  ) {   
		postMapper.LPostUpdate( postVo );
		ModelAndView   mv   =  new  ModelAndView();
		String user_id = postVo.getCom_id();
		mv.setViewName("redirect:/Company/PostForm?com_id="+ user_id);
		return mv;
	}
	@RequestMapping("/CInfoedit")
	public ModelAndView CInfoEdit(CompanyVo companyVo) {
		CompanyVo vo = companyMapper.Pgeteditcompany(companyVo);
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo", vo);
		mv.setViewName("company/cinfoedit");
		return mv;

	}
	@RequestMapping("/CInfoUpdate")
	public ModelAndView PupdateCInfo(CompanyVo companyVo) {
		companyMapper.PupdateCInfo(companyVo);
		ModelAndView mv = new ModelAndView();
		String com_id = companyVo.getCom_id();
		mv.setViewName("redirect:/Company/CInfo?com_id=" + com_id);
		return mv;
	}
	@RequestMapping("/CInfoDelete")
	public ModelAndView CInfoDelete(CompanyVo companyVo, HttpServletRequest request) {
		companyMapper.PCInfoDelete(companyVo);
		// 세션무효화
		request.getSession().invalidate();

		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/");
		return mv;
	}

	// 기업회원-받은 이력서 관리-result 값 확인
	@GetMapping("/checkstatus")
	@ResponseBody
	public List<ApplyedVo> checkstatus(
			@RequestParam(value="user_id") String user_id,
			@RequestParam(value="re_num") int re_num,
			@RequestParam(value="result") int result,
			@RequestParam(value="com_id") String com_id,
			@RequestParam(value="ap_id") int ap_id,
			@RequestParam(value="po_num") int po_num,
			ApplyedVo applyedVo
			) {
		
		//List<UserBookVo> getCheckBook = bookmarkMapper.getUserBook(user_id, po_num);
		//List<ApplyedVo> applyedList = applyedMapper.getApplyedList(applyedVo);
		List<ApplyedVo> applyedList = applyedMapper.KgetCheckApplyedList(ap_id, user_id, re_num, result, com_id, po_num);
		return applyedList;
		
	}
	
	// 기업회원-받은 이력서 관리-result 값 업뎃
	@PostMapping("/decision")
    @ResponseBody
    public List<ApplyedVo> resultUpdate(
    		@RequestParam("user_id") String user_id,
    		@RequestParam("re_num") int re_num,
            @RequestParam("result") int result,
            @RequestParam("com_id") String com_id,
            @RequestParam("po_num") int po_num,
            @RequestParam("ap_id") int ap_id,
            ApplyedVo applyedVo) {
		
		
        // 대기, 합격, 불합격 처리
		applyedMapper.KupdateStatus(re_num, result, po_num);
		
        return applyedMapper.KgetCheckApplyedList(ap_id, user_id, re_num, result, com_id, po_num);
    }
	
	//----------------------------------------------------------------------------------------------
	
	// 기업정보 - 모달 (사용X)
	@RequestMapping("/CompanyInfo")
	public ModelAndView companyinfo( CompanyVo companyVo ) {
		
		List<CompanyVo> companyinfoList = companyMapper.KgetCompanyInfoList( companyVo );		
		ModelAndView mv = new ModelAndView();
		mv.addObject("companyinfoList", companyinfoList);
		mv.setViewName("company/companyinfo");
		return mv;
		
	}
	
	// 구직자-기업평점 조회
	@GetMapping("/getRating")
    @ResponseBody
    public Integer getRating(
    		@RequestParam("user_id") String user_id,
    		@RequestParam("com_id") String com_id,
    		@RequestParam("rating") int rating
    		) {
		
		Integer getrating = companyMapper.KgetRating(user_id, com_id, rating);
        
        return getrating != null ? rating : -1;
    }
	
	// 구직자-기업평점(COMRATINGS TABLE)
	@PostMapping("/ratings/add")
	@ResponseBody
	public String addRating(
	    	@RequestParam("com_id") String com_id,
	    	@RequestParam("user_id") String user_id,
	    	@RequestParam("rating") int rating
	    	) {
			
		Integer ratings = companyMapper.KgetRating(user_id, com_id, rating);
		if (ratings != null) {
	        companyMapper.KupdateRating(com_id, user_id, rating);
	    } else {
	       	companyMapper.KaddRating(com_id, user_id, rating);
	    }
			
		//companyMapper.KaddRating(com_id, user_id, rating);
			
	    return "Rating added successfully!";
	        
	}
	// 기업-구직자 스크랩 리스트
	@RequestMapping("/ComBookmarkList")
	public ModelAndView combookmarklist( ResumeVo resumeVo, String com_id ) {
			
		List<ResumeVo> resumeBookList = resumeMapper.KgetResumeBookList( resumeVo, com_id );
			
		ModelAndView mv = new ModelAndView();
		mv.addObject("resumeBookList", resumeBookList);
		mv.setViewName("company/combookmarkList");
		return mv;
			
	}
	
	//--------------------------------------------------------------------------------------------------
	
	// 기업-구직자 면접 제안 리스트
	@RequestMapping("/COffer")
	public ModelAndView support( 
			ResumeVo resumeVo,
			ApplyVo applyVo,
			CompanyVo companyVo,
			PostVo postVo,
			@RequestParam("com_id") String com_id
			) {
				
		List<ResumeVo> offerList = resumeMapper.KgetOfferList( resumeVo, applyVo, companyVo, postVo, com_id );
		ModelAndView mv = new ModelAndView();
		mv.addObject("offerList", offerList);
		mv.setViewName("company/coffer");
		return mv;
		
	}
	
}
