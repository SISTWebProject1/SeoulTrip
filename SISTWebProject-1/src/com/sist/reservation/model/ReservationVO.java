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
public class ReservationVO {
    private String rname;
    private String openhour;
    private String rphoto;
    private String link;
    private int mapX;
    private int mapY;
    private int addr1;
    private int addr2;
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
	public int getMapX() {
		return mapX;
	}
	public void setMapX(int mapX) {
		this.mapX = mapX;
	}
	public int getMapY() {
		return mapY;
	}
	public void setMapY(int mapY) {
		this.mapY = mapY;
	}
	public int getAddr1() {
		return addr1;
	}
	public void setAddr1(int addr1) {
		this.addr1 = addr1;
	}
	public int getAddr2() {
		return addr2;
	}
	public void setAddr2(int addr2) {
		this.addr2 = addr2;
	}
    
    
}
