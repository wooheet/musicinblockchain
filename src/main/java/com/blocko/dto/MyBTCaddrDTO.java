package com.blocko.dto;

public class MyBTCaddrDTO {
	String artist;
	String mypk;
	String mybtcaddr;
	public MyBTCaddrDTO(){}
	
	public MyBTCaddrDTO(String mypk, String mybtcaddr) {
		super();
		this.mypk = mypk;
		this.mybtcaddr = mybtcaddr;
	}

	public MyBTCaddrDTO(String artist, String mypk, String mybtcaddr) {
		super();
		this.artist = artist;
		this.mypk = mypk;
		this.mybtcaddr = mybtcaddr;
	}
	@Override
	public String toString() {
		return "MyBTCaddr [artist=" + artist + ", mypk=" + mypk
				+ ", mybtcaddr=" + mybtcaddr + "]";
	}
	public String getArtist() {
		return artist;
	}
	public void setArtist(String artist) {
		this.artist = artist;
	}
	public String getMypk() {
		return mypk;
	}
	public void setMypk(String mypk) {
		this.mypk = mypk;
	}
	public String getMybtcaddr() {
		return mybtcaddr;
	}
	public void setMybtcaddr(String mybtcaddr) {
		this.mybtcaddr = mybtcaddr;
	}
	
}
