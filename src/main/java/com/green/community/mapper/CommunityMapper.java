package com.green.community.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.community.domain.CommunityVo;

@Mapper
public interface CommunityMapper {

	List<CommunityVo> getCBoardPagingList(CommunityVo communityVo, int nowpage, int pageSize);

	void insertBoard(CommunityVo communityVo);

	CommunityVo getcommunityVo(CommunityVo communityVo);

	void incHit(CommunityVo communityVo);

	List<CommunityVo> getCBoardCommentList(CommunityVo communityVo);

	void insertComment(CommunityVo communityVo);
	 
    int isCommentLiked(CommunityVo communityVo);
    
    void incrementLikeCount(CommunityVo communityVo);
   
    void decrementLikeCount(CommunityVo communityVo);
  
    void addCommentLike(CommunityVo communityVo);
   
    void removeCommentLike(CommunityVo communityVo);

	List<CommunityVo> getMycommunityVo(CommunityVo communityVo);

	void updateBoard(CommunityVo communityVo);

	void deleteBoard(CommunityVo communityVo);

	List<CommunityVo> getCBoardPagingList(CommunityVo communityVo);

	void deleteComment(CommunityVo communityVo);

	

}
