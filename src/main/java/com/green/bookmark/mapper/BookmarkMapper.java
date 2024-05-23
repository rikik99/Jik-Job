package com.green.bookmark.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.bookmark.domain.ComBookVo;
import com.green.bookmark.domain.UserBookVo;

@Mapper
public interface BookmarkMapper {

	List<UserBookVo> getUserBook(String user_id, int po_num);

	int checkUBNO(String user_id, int po_num);

	void insertUserbook(String user_id, int po_num);

	void deleteUserbook(String user_id, int po_num);

	List<ComBookVo> getComBook(String com_id, int re_num);

	void insertComBook(String com_id, int re_num);

	void deleteComBook(String com_id, int re_num);
    
}