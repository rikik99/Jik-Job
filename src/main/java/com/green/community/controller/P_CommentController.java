package com.green.community.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.green.community.domain.CommunityVo;
import com.green.community.mapper.P_CommunityMapper;

@RestController
@RequestMapping("/ApiUsers")
public class P_CommentController {
	
	@Autowired
	private P_CommunityMapper p_communityMapper;
	
	// RESTful API로 댓글 생성 처리
	// http://localhost:9090/Api/Comment/1/comments
	@PostMapping("/Comment/{ucomu_bno}/commentCreate")
	public List<CommunityVo> commentCreate(
			@PathVariable int ucomu_bno,
				@RequestBody CommunityVo communityVo
			) {
		
		// 댓글 생성
		p_communityMapper.insertComment(communityVo);
		
	    // 댓글 목록 조회 
		List<CommunityVo> commentList = p_communityMapper.getPBoardCommentList(communityVo);
		
		return commentList;
	}
	
	@GetMapping("/Comment/{ucomu_bno}/{ucomm_id}/commentLike")
	public Integer checkcommentLike (
			@PathVariable int ucomm_id,
			@PathVariable int ucomu_bno,
			CommunityVo communityVo
			)	{
		
		// 현재 좋아요 상태 확인
	    int isLiked = p_communityMapper.isCommentLiked(communityVo);

	    return isLiked;
	}

	@PostMapping("/Comment/{ucomu_bno}/{ucomm_id}/commentLike")
	public ResponseEntity<CommentLikeResponse> updatecommentLike (
			//@PathVariable int ccomm_id,
			@PathVariable int ucomu_bno,
			@RequestParam(required = false, defaultValue = "0") int ucomm_id,
			CommunityVo communityVo
			)	{
		
		// 현재 좋아요 상태 확인
		int isLiked = p_communityMapper.isCommentLiked(communityVo);
		
		if (isLiked != 0) {
			// 이미 좋아요가 되어 있다면 좋아요 취소
			p_communityMapper.removeCommentLike(communityVo);
			p_communityMapper.decrementLikeCount(communityVo);
			return ResponseEntity.ok()
					.body(new CommentLikeResponse("좋아요가 취소되었습니다", false, ucomm_id));
		} else {
			// 좋아요가 되어 있지 않다면 좋아요 추가
			p_communityMapper.addCommentLike(communityVo);
			p_communityMapper.incrementLikeCount(communityVo);
			return ResponseEntity.ok()
					.body(new CommentLikeResponse("좋아요가 추가되었습니다", true, ucomm_id));
		}
	}
}
