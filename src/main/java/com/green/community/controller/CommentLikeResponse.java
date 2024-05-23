package com.green.community.controller;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor

public class CommentLikeResponse {
    private String message;
    private boolean isLiked;
    private int ccomm_id;
   
   
   public CommentLikeResponse(String message, boolean isLiked, int ccomm_id) {
       this.message = message;
       this.isLiked = isLiked;
       this.ccomm_id = ccomm_id;
   }

}