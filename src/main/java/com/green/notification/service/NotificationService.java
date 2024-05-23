package com.green.notification.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.notification.domain.NotificationVo;
import com.green.notification.mapper.NotificationMapper;

@Service
public class NotificationService {

	@Autowired
    private NotificationMapper notificationMapper;

	// 개인-알림 생성 메서드
    public void createNotification(String user_id) {
        NotificationVo notificationVo = new NotificationVo();
        notificationVo.setUser_id(user_id);
        notificationVo.setIsRead(0); // 새 알림은 읽지 않은 상태로 초기화
        notificationMapper.insertNotification(notificationVo);
    }

    // 읽지 않은 알림 확인 메서드
	public Integer hasUnreadNotifications(String user_id) {
	
		List<NotificationVo> notifications = notificationMapper.getUnreadNotificationsByUserId(user_id);
	
		return notifications.isEmpty() ? 0 : 1;
	
	}

	public Integer hasReadNotifications(String user_id) {

		List<NotificationVo> notifications = notificationMapper.getReadNotificationsByUserId(user_id);
		
		return notifications.isEmpty() ? 0 : 1;
		
	}
	
}
