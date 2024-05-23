package com.green.notification.domain;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class NotificationVo {

	private int no_id;
    private String user_id;
    private String com_id;
    private int isRead;
    private Timestamp createdAt;
	
    private int re_num;
    private int po_num;
    
}
