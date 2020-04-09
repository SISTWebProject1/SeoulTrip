package com.sist.detail.dao;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DetailReviewVO {
	private int reviewno;
	private int type;
	private int no;
	private String memberid;
	private String title;
	private Date regdate;
	private Date expdate;
	private int likecount;
	private int groupid;
	private int groupstep;
	private int root;
	private int depth;
	private String content;
	private int grade;
}
