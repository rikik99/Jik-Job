package com.green.comratings.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class ComRatingVo {
	private String rating_id;
	private String com_id;
	private String user_id;
	private String rating;
	
	private String po_image;
}
