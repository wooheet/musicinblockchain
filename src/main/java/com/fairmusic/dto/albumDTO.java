package com.fairmusic.dto;

import java.sql.Date;

public class albumDTO {


	private String album_code;
	private String album_title;
	private String artist_code;
	private String album_image;
	private String album_date;
	private String album_dc;
	private String album_detail;
	private String album_alive;
	
	
	public albumDTO(){}
	
	public albumDTO(String album_code, String album_title, String artist_code,
			String album_image, String album_date, String album_dc,String album_detail,String album_alive) {
		super();
		this.album_code = album_code;
		this.album_title = album_title;
		this.artist_code = artist_code;
		this.album_image = album_image;
		this.album_date = album_date;
		this.album_dc = album_dc;
		this.album_detail= album_detail;
		this.album_alive = album_alive;
	}

	public String getAlbum_code() {
		return album_code;
	}

	public void setAlbum_code(String album_code) {
		this.album_code = album_code;
	}

	public String getAlbum_title() {
		return album_title;
	}

	public void setAlbum_title(String album_title) {
		this.album_title = album_title;
	}

	public String getArtist_code() {
		return artist_code;
	}

	public void setArtist_code(String artist_code) {
		this.artist_code = artist_code;
	}

	public String getAlbum_image() {
		return album_image;
	}

	public void setAlbum_image(String album_image) {
		this.album_image = album_image;
	}

	public String getAlbum_date() {
		return album_date;
	}

	public void setAlbum_date(String album_date) {
		this.album_date = album_date;
	}

	public String getAlbum_dc() {
		return album_dc;
	}

	public void setAlbum_dc(String album_dc) {
		this.album_dc = album_dc;
	}

	
	public String getAlbum_detail() {
		return album_detail;
	}

	public void setAlbum_detail(String album_detail) {
		this.album_detail = album_detail;
	}

	
	public String getAlbum_alive() {
		return album_alive;
	}

	public void setAlbum_alive(String album_alive) {
		this.album_alive = album_alive;
	}

	@Override
	public String toString() {
		return "albumDTO [album_code=" + album_code + ", album_title="
				+ album_title + ", artist_code=" + artist_code
				+ ", album_image=" + album_image + ", album_date=" + album_date
				+ ", album_dc=" + album_dc + ", album_detail=" + album_detail
				+ ", album_alive=" + album_alive + "]";
	}



}
