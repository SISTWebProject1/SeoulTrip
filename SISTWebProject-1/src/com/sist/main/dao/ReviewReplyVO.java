package com.sist.main.dao;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReviewReplyVO {
	
	private int no;
	private int reviewNo;
	private String memberId;
	private Date regdate;
	private int group_id;
	private int group_step;
	private int group_tab;
	private int root;
	private int depth;
	private String msg;

}
