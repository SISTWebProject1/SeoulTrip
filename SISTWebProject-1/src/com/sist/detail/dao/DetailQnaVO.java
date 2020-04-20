package com.sist.detail.dao;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DetailQnaVO {
	private String memberid;
	private int seq;
	private int no;
	private String title;
	private int pwd;
	private String content;
	private int type;
}
