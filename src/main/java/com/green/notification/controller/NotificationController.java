package com.green.notification.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.green.notification.mapper.NotificationMapper;
import com.green.notification.service.NotificationService;

import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/notifications")
public class NotificationController {

	@Autowired
    private NotificationService notificationService;
	
	@Autowired
	private NotificationMapper notificationMapper;

    @GetMapping("/hasUnread")
    public ResponseEntity<Integer> hasUnreadNotifications( HttpServletRequest request ) {
    	
    	String user_id  = (String) request.getParameter("user_id");
    	
    	// 사용자 ID가 없는 경우 401 Unauthorized 반환
    	if (user_id == null) {
            return new ResponseEntity<>(HttpStatus.UNAUTHORIZED);
        }
    	log.info("=========notifications/hasUnread=========");
    	log.info("user_id : {}", user_id);
    	log.info("=========notifications/hasUnread=========");

    	Integer hasUnread  = notificationService.hasUnreadNotifications(user_id);
    	log.info("=========notifications/hasUnread=========");
    	log.info("hasUnread : {}", hasUnread);
    	log.info("=========notifications/hasUnread=========");
        
        return new ResponseEntity<>(hasUnread, HttpStatus.OK);
        
    }
    
    @PostMapping("/hasRead")
    public ResponseEntity<Integer> hasReadNotifications( 
    		@RequestParam("user_id") String user_id,
    		@RequestParam("re_num") int re_num,
    		@RequestParam("po_num") int po_num
    		) {
    	
    	// 사용자 ID가 없는 경우 401 Unauthorized 반환
    	if (user_id == null) {
            return new ResponseEntity<>(HttpStatus.UNAUTHORIZED);
        }
    	
    	System.out.println( "===========================================user_id: " + user_id );
    	System.out.println( "===========================================re_num: " + re_num );
    	System.out.println( "===========================================po_num: " + po_num );
    	
    	Integer hasRead  = notificationService.hasReadNotifications(user_id);
    	log.info("=========notifications/hasRead=========");
    	log.info("hasRead : {}", hasRead);
    	log.info("=========notifications/hasRead=========");
    	
    	notificationMapper.deleteNotification( user_id, re_num, po_num );
    	
        return new ResponseEntity<>(hasRead, HttpStatus.OK);
        
    }
	
}
