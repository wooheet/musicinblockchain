package com.fairmusic.dto;

public class MessageDTO {
	String dm_code;
	String artist_code;
	String receiver_code;
	String dm_content;
	String dm_pass_date;
	String dm_read_state;
	String DM_Content;
	String artist_email;
	String artist_image;
	
	
	
	

	public MessageDTO(String dm_code, String artist_email, String artist_image) {
		super();
		this.dm_code = dm_code;
		this.artist_email = artist_email;
		this.artist_image = artist_image;
	}


	public MessageDTO(String dm_content, String artist_email, String artist_image, String dm_code){
		super();
		this.dm_content = dm_content;
		this.artist_email = artist_email;
		this.artist_image = artist_image;
		this.dm_code = dm_code;
	}


	public String getDM_Content() {
		return DM_Content;
	}



	public void setDM_Content(String dM_Content) {
		DM_Content = dM_Content;
	}



	public String getArtist_email() {
		return artist_email;
	}



	public void setArtist_email(String artist_email) {
		this.artist_email = artist_email;
	}



	public String getArtist_image() {
		return artist_image;
	}



	public void setArtist_image(String artist_image) {
		this.artist_image = artist_image;
	}



	public MessageDTO(String dM_CODE, String artist_code, String receiver_code,
			String dm_content, String dm_read_state) {
		super();
		this.dm_code = dM_CODE;
		this.artist_code = artist_code;
		this.receiver_code = receiver_code;
		this.dm_content = dm_content;
		this.dm_read_state = dm_read_state;
	}

	
	
	public MessageDTO(String dM_CODE, String artist_code, String receiver_code,
			String dm_content, String dm_pass_date, String dm_read_state) {
		super();
		this.dm_code  = dM_CODE;
		this.artist_code = artist_code;
		this.receiver_code = receiver_code;
		this.dm_content = dm_content;
		this.dm_pass_date = dm_pass_date;
		this.dm_read_state = dm_read_state;
	}



	public String getDM_CODE() {
		return dm_code;
	}
	public void setDM_CODE(String dM_CODE) {
		dm_code = dM_CODE;
	}
	public String getArtist_code() {
		return artist_code;
	}
	public void setArtist_code(String artist_code) {
		this.artist_code = artist_code;
	}
	public String getReceiver_code() {
		return receiver_code;
	}
	public void setReceiver_code(String receiver_code) {
		this.receiver_code = receiver_code;
	}
	public String getDm_content() {
		return dm_content;
	}
	public void setDm_content(String dm_content) {
		this.dm_content = dm_content;
	}
	public String getDm_pass_date() {
		return dm_pass_date;
	}
	public void setDm_pass_date(String dm_pass_date) {
		this.dm_pass_date = dm_pass_date;
	}


	public String getDm_read_state() {
		return dm_read_state;
	}


	public void setDm_read_state(String dm_read_state) {
		this.dm_read_state = dm_read_state;
	}

	
	
}
