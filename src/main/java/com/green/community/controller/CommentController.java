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
import com.green.community.mapper.CommunityMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/Api")
public class CommentController {
   
   @Autowired
   private CommunityMapper communityMapper;
   
   
   //'http://localhost:9090/Api/Comment/{ccomu_bno}/commentGet'
   @GetMapping("/Comment/{ccomu_bno}/commentGet")
   public List<CommunityVo> commentGet (
         @PathVariable int ccomu_bno,
         @RequestBody CommunityVo communityVo
         ){
      
      // 댓글 목록 조회 
      List<CommunityVo> commentList = communityMapper.getCBoardCommentList(communityVo);
      
      return commentList;
   }
   
   // RESTful API로 댓글 생성 처리
   // http://localhost:9090/Api/Comment/1/comments
   @PostMapping("/Comment/{ccomu_bno}/commentCreate")
   public List<CommunityVo> commentCreate(
         @PathVariable int ccomu_bno,
            @RequestBody CommunityVo communityVo
         ) {
      
      // 댓글 생성
      communityMapper.insertComment(communityVo);
      
       // 댓글 목록 조회 
      List<CommunityVo> commentList = communityMapper.getCBoardCommentList(communityVo);
      
      return commentList;
   }
   
   // 'http://localhost:9090//Api/Comment/{ccomu_bno}/{ccomm_id}/Delete'
      @PostMapping("/Comment/{ccomu_bno}/{ccomm_id}/commentDelete")
      public List<CommunityVo> deleteCreate(
            @PathVariable int ccomu_bno,
            @PathVariable int ccomm_id,
            @RequestBody CommunityVo communityVo
            ) {
         
         // 댓글 생성
         communityMapper.deleteComment(communityVo);
         
          // 댓글 목록 조회 
         List<CommunityVo> commentList = communityMapper.getCBoardCommentList(communityVo);
         
         return commentList;
      }
            
      @GetMapping("/Comment/{ccomu_bno}/{ccomm_id}/commentLike")
      public Integer checkcommentLike (
            @PathVariable int ccomm_id,
            @PathVariable int ccomu_bno,
            CommunityVo communityVo
            )   {
         
         // 현재 좋아요 상태 확인
          int isLiked = communityMapper.isCommentLiked(communityVo);
          log.info("===========checkcommentLike============");
          log.info("isLiked : {}", isLiked);
          log.info("===========checkcommentLike============");
   
          return isLiked;
      }

      @PostMapping("/Comment/{ccomu_bno}/{ccomm_id}/commentLike")
      public ResponseEntity<CommentLikeResponse> updatecommentLike (
            //@PathVariable int ccomm_id,
            @PathVariable int ccomu_bno,
            @RequestParam(required = false, defaultValue = "0") int ccomm_id,
            CommunityVo communityVo
            )   {
         
         // 현재 좋아요 상태 확인
         int isLiked = communityMapper.isCommentLiked(communityVo);
         log.info("===========updatecommentLike============");
          log.info("isLiked : {}", isLiked);
          log.info("===========updatecommentLike============");
         
         if (isLiked != 0) {
            // 이미 좋아요가 되어 있다면 좋아요 취소
            communityMapper.removeCommentLike(communityVo);
            communityMapper.decrementLikeCount(communityVo);
            return ResponseEntity.ok()
                  .body(new CommentLikeResponse("좋아요가 취소되었습니다", false, ccomm_id));
         } else {
            // 좋아요가 되어 있지 않다면 좋아요 추가
            communityMapper.addCommentLike(communityVo);
            communityMapper.incrementLikeCount(communityVo);
            return ResponseEntity.ok()
                  .body(new CommentLikeResponse("좋아요가 추가되었습니다", true, ccomm_id));
         }
      }
}