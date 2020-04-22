package com.sist.main.dao;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class HomeItemVO {
	
	private int type;
	private int no;
	private String name;
	private String photo;
	private int grade;
	private int reviewCnt;
	private List<HashTagVO> hashtags;

}
