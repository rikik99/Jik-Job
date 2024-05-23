package com.green.notification.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.notification.domain.NotificationVo;
import com.green.users.domain.UserVo;

@Mapper
public interface NotificationMapper {
	    
	List<UserVo> KgetUserInfo(int re_num);

	List<NotificationVo> getUnreadNotificationsByUserId(String user_id);
	
	void insertNotification(NotificationVo notificationVo);

	List<NotificationVo> getReadNotificationsByUserId(String user_id);

	void deleteNotification(String user_id, int re_num, int po_num);
	
}
