package com.fairmusic.dto;

public class artistDTO {
	String artist_code;
	String artist_email;
	String artist_pass;
	String artist_name;
	String artist_image;
	String artist_self_introduction;
	String artist_alive;
	
	
	public artistDTO(String artist_code, String artist_email,
			String artist_pass, String artist_name, String artist_image,
			String artist_self_introduction, String artist_alive) {
		super();
		this.artist_code = artist_code;
		this.artist_email = artist_email;
		this.artist_pass = artist_pass;
		this.artist_name = artist_name;
		this.artist_image = artist_image;
		this.artist_self_introduction = artist_self_introduction;
		this.artist_alive = artist_alive;
	}


	public String getArtist_code() {
		return artist_code;
	}


	public void setArtist_code(String artist_code) {
		this.artist_code = artist_code;
	}


	public String getArtist_email() {
		return artist_email;
	}


	public void setArtist_email(String artist_email) {
		this.artist_email = artist_email;
	}


	public String getArtist_pass() {
		return artist_pass;
	}


	public void setArtist_pass(String artist_pass) {
		this.artist_pass = artist_pass;
	}


	public String getArtist_name() {
		return artist_name;
	}


	public void setArtist_name(String artist_name) {
		this.artist_name = artist_name;
	}


	public String getArtist_image() {
		return artist_image;
	}


	public void setArtist_image(String artist_image) {
		this.artist_image = artist_image;
	}



	public String getArtist_self_introduction() {
		return artist_self_introduction;
	}


	public void setArtist_self_introduction(String artist_self_introduction) {
		this.artist_self_introduction = artist_self_introduction;
	}


	public String getArtist_alive() {
		return artist_alive;
	}


	public void setArtist_alive(String artist_alive) {
		this.artist_alive = artist_alive;
	}


	@Override
	public String toString() {
		return "artistDTO [artist_code=" + artist_code + ", artist_email="
				+ artist_email + ", artist_pass=" + artist_pass
				+ ", artist_name=" + artist_name + ", artist_image="
				+ artist_image + ", artist_self_introduction="
				+ artist_self_introduction + ", artist_alive=" + artist_alive
				+ "]";
	}




	
}
