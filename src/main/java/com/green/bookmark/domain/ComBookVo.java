package com.green.bookmark.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ComBookVo {

	private int cb_num;
	private int cb_boolean;
	
	private String user_id;
	
	private int re_num;
	private String com_id;
	
}
