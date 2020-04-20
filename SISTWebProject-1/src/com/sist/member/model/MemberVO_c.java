package com.sist.member.model;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;


@Setter
@Getter
public class MemberVO_c {

	private String memberid;
	private String pwd;
	private String name;
	private String photo;
	private String email;
	private String birth;
	private String gender;
	private String addr1;
	private String addr2;
	private String tel;
	private Date regdate;
	private String selfinfo;
	private int grade;
	private String coverPhoto;
	private String msg;
}
