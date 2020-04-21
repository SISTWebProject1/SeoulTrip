package com.sist.reservation.model;

/*
NO       NOT NULL NUMBER         
RNAME    NOT NULL VARCHAR2(4000) 
OPENHOUR          VARCHAR2(100)  
RPHOTO            VARCHAR2(100)  
INFO              CLOB           
TEL               VARCHAR2(20)   
LINK              VARCHAR2(100)  
MAPX              NUMBER         
MAPY              NUMBER         
ADDR1             VARCHAR2(100)  
ADDR2             VARCHAR2(100)  
RANK              NUMBER         
PRICE             VARCHAR2(100)  
MENU              VARCHAR2(100)  
RESCHECK          VARCHAR2(1)    
GRADE             NUMBER         
POST              VARCHAR2(20)   
 */
public class RestaurantVO {
	private int no;
    private String rname;
    private String openhour;
    private String rphoto;
    private String link;
    private Double mapX;
    private Double mapY;
    private String tel;
    private String addr1;
    private String addr2;
    private String post;
    private String price;
    
        
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public String getOpenhour() {
		return openhour;
	}
	public void setOpenhour(String openhour) {
		this.openhour = openhour;
	}
	public String getRphoto() {
		return rphoto;
	}
	public void setRphoto(String rphoto) {
		this.rphoto = rphoto;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public Double getMapX() {
		return mapX;
	}
	public void setMapX(Double mapX) {
		this.mapX = mapX;
	}
	public Double getMapY() {
		return mapY;
	}
	public void setMapY(Double mapY) {
		this.mapY = mapY;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
    
    
	
    
    
}
