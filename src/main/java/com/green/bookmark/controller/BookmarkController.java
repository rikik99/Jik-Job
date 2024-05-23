package com.green.bookmark.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.green.bookmark.domain.ComBookVo;
import com.green.bookmark.domain.UserBookVo;
import com.green.bookmark.mapper.BookmarkMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class BookmarkController {
	
    @Autowired
    private BookmarkMapper bookmarkMapper;
      
    @GetMapping("/checkUserBook")
    public List<UserBookVo> checkUserBook(
    		@RequestParam(value="user_id") String user_id,
    		@RequestParam(value="po_num") int po_num
    		) {
    	
    	List<UserBookVo> getCheckBook = bookmarkMapper.getUserBook(user_id, po_num);
    	log.info("=========================================================");
    	log.info("getCheckBook : {}", getCheckBook);
    	log.info("=========================================================");
    	
    	int checkUBNO = bookmarkMapper.checkUBNO(user_id, po_num);
    	log.info("=========================================================");
    	log.info("checkUBNO : {}", checkUBNO);
    	log.info("=========================================================");
    	
    	System.out.println("==============================user_id: " + user_id);
    	System.out.println("==============================po_num: " + po_num);
    	
    	return getCheckBook;
        
    }
    
    
    @PostMapping("/addUserBook")
    public List<UserBookVo> addBookmark(
    		@RequestParam("user_id") String user_id,
    		@RequestParam("po_num") int po_num
    		) {
        
    	bookmarkMapper.insertUserbook(user_id, po_num);
        
    	return bookmarkMapper.getUserBook(user_id, po_num);
    }

    @PostMapping("/removeUserBook")
    public List<UserBookVo> removeBookmark(
    		@RequestParam("user_id") String user_id,
    		@RequestParam("po_num") int po_num
    		) {
    	
    	bookmarkMapper.deleteUserbook(user_id, po_num);
        
        return bookmarkMapper.getUserBook(user_id, po_num);
    }
    
    @GetMapping("/checkComBook")
    public List<ComBookVo> checkComBook( 
    		@RequestParam("com_id") String com_id,
    		@RequestParam("re_num") int re_num
    		) {
    	
    	List<ComBookVo> getCheckBook = bookmarkMapper.getComBook( com_id, re_num );
    	log.info("=================checkComBook====================");
    	log.info("getCheckBook : {}", getCheckBook);
    	log.info("=================checkComBook====================");
    	
    	return getCheckBook;
    	
    }
    
    @PostMapping("/addComBook")
    public List<ComBookVo> addComBook( @RequestBody Map<String, Object> payload ) {
    			
    	String com_id = (String) payload.get("com_id");
    	int re_num = (Integer) payload.get("re_num");
    	
    	System.out.println("==================com_id: " + com_id);
    	System.out.println("==================re_num: " + re_num);
    	
    	bookmarkMapper.insertComBook( com_id, re_num );
    	
    	return bookmarkMapper.getComBook( com_id, re_num );
    	
    }
    
    @PostMapping("/removeComBook")
    public List<ComBookVo> removeComBook( @RequestBody Map<String, Object> payload ) {
        
    	String com_id = (String) payload.get("com_id");
    	int re_num = (Integer) payload.get("re_num");
    	
    	System.out.println("==================com_id: " + com_id);
    	System.out.println("==================re_num: " + re_num);

    	bookmarkMapper.deleteComBook( com_id, re_num );
        
        return bookmarkMapper.getComBook( com_id, re_num );
    }
    

}
