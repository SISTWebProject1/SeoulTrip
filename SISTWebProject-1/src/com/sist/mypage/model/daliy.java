package com.sist.mypage.model;

import java.util.Date;
import java.util.List;
import java.util.StringTokenizer;
import java.text.SimpleDateFormat;
import javax.servlet.http.HttpServletRequest;


public class daliy {

//	public List<Integer> date_method(){
//	  	 Date date=new Date();
//	     SimpleDateFormat sdf=new SimpleDateFormat("yyyy-M-d");// 08 09 
//	     String today=sdf.format(date); 
//	     
//	     StringTokenizer st=new StringTokenizer(today,"-");
//	     
//	     String strYear=st.nextToken();
//	     String strMonth=st.nextToken();
//	     String strDay=st.nextToken();
//	     
////	     String sy=request.getParameter("year");
////	     if(sy==null)
////	    	 sy=strYear;
////	     String sm=request.getParameter("month");
////	     if(sm==null)
////	    	 sm=strMonth;
//	     
////	     
////	     int year=Integer.parseInt(sy);
////	     int month=Integer.parseInt(sm);
////	     int day=Integer.parseInt(strDay);
//	     
//	     // 1일자의 요일 
//	     // 1년도 1월 1일 ~ 2019년 12월 31 ==> 총날수 
//	     int total=(year-1)*365
//	              +(year-1)/4
//	              -(year-1)/100
//	              +(year-1)/400;
//	     
//	     // 2020년 2월 29 ==> 전달 
//	     int[] lastDay={31,28,31,30,31,30,
//	    		        31,31,30,31,30,31};
//	     if((year%4==0 && year%100!=0)||(year%400==0))
//	    	  lastDay[1]=29;
//	     else
//	    	 lastDay[1]=28;
//	     
//	     for(int i=0;i<month-1;i++)
//	     {
//	    	 total+=lastDay[i];
//	     }
//	     
//	     total++;
//	     
//	     int week=total%7; // 1일자의 요일 구하기 완료 
//	     
//	     String[] strWeek={"일","월","화","수","목","금","토"};     
//	}
	
}
