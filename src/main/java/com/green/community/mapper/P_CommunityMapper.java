package com.green.community.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.community.domain.CommunityVo;

@Mapper
public interface P_CommunityMapper {

	List<CommunityVo> getPBoardPagingList(CommunityVo communityVo);

	void insertBoard(CommunityVo communityVo);

	CommunityVo getcommunityVo(CommunityVo communityVo);

	void incHit(CommunityVo communityVo);

	List<CommunityVo> getPBoardCommentList(CommunityVo communityVo);

	void insertComment(CommunityVo communityVo);
	 
    int isCommentLiked(CommunityVo communityVo);
    
    void incrementLikeCount(CommunityVo communityVo);
   
    void decrementLikeCount(CommunityVo communityVo);
  
    void addCommentLike(CommunityVo communityVo);
   
    void removeCommentLike(CommunityVo communityVo);

	List<CommunityVo> getMycommunityVo(CommunityVo communityVo);

	void updateBoard(CommunityVo communityVo);

	void deleteBoard(CommunityVo communityVo);

	int count(CommunityVo communityVo);

	

}
