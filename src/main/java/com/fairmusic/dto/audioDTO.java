package com.fairmusic.dto;



import java.sql.Date;

import oracle.sql.DATE;

public class audioDTO {
	
	private String audio_code;
	private String audio_file;
	private String audio_image;
	private String audio_movie;
	private String audio_title;
	private String artist_code;
	private String audio_jenre;
	private String audio_detail;
	private String album_code;
	private String audio_date;
	private String audio_copyrighter;
	private String audio_price;
	private String audio_alive;
	



	public audioDTO(){
		
	}




	public audioDTO(String audio_code, String audio_file, String audio_image,
			String audio_movie, String audio_title, String artist_code,
			String audio_jenre, String audio_detail, String album_code,
			String audio_date, String audio_copyrighter, String audio_price,String audio_alive) {
		super();
		this.audio_code = audio_code;
		this.audio_file = audio_file;
		this.audio_image = audio_image;
		this.audio_movie = audio_movie;
		this.audio_title = audio_title;
		this.artist_code = artist_code;
		this.audio_jenre = audio_jenre;
		this.audio_detail = audio_detail;
		this.album_code = album_code;
		this.audio_date = audio_date;
		this.audio_copyrighter = audio_copyrighter;
		this.audio_price = audio_price;
		this.audio_alive = audio_alive;
	}




	public String getAudio_code() {
		return audio_code;
	}




	public void setAudio_code(String audio_code) {
		this.audio_code = audio_code;
	}




	public String getAudio_file() {
		return audio_file;
	}




	public void setAudio_file(String audio_file) {
		this.audio_file = audio_file;
	}




	public String getAudio_image() {
		return audio_image;
	}




	public void setAudio_image(String audio_image) {
		this.audio_image = audio_image;
	}




	public String getAudio_movie() {
		return audio_movie;
	}




	public void setAudio_movie(String audio_movie) {
		this.audio_movie = audio_movie;
	}




	public String getAudio_title() {
		return audio_title;
	}




	public void setAudio_title(String audio_title) {
		this.audio_title = audio_title;
	}




	public String getArtist_code() {
		return artist_code;
	}




	public void setArtist_code(String artist_code) {
		this.artist_code = artist_code;
	}




	public String getAudio_jenre() {
		return audio_jenre;
	}




	public void setAudio_jenre(String audio_jenre) {
		this.audio_jenre = audio_jenre;
	}




	public String getAudio_detail() {
		return audio_detail;
	}




	public void setAudio_detail(String audio_detail) {
		this.audio_detail = audio_detail;
	}




	public String getAlbum_code() {
		return album_code;
	}




	public void setAlbum_code(String album_code) {
		this.album_code = album_code;
	}




	public String getAudio_date() {
		return audio_date;
	}




	public void setAudio_date(String audio_date) {
		this.audio_date = audio_date;
	}




	public String getAudio_copyrighter() {
		return audio_copyrighter;
	}




	public void setAudio_copyrighter(String audio_copyrighter) {
		this.audio_copyrighter = audio_copyrighter;
	}




	public String getAudio_price() {
		return audio_price;
	}




	public void setAudio_price(String audio_price) {
		this.audio_price = audio_price;
	}




	public String getAudio_alive() {
		return audio_alive;
	}




	public void setAudio_alive(String audio_alive) {
		this.audio_alive = audio_alive;
	}




	@Override
	public String toString() {
		return "audioDTO [audio_code=" + audio_code + ", audio_file="
				+ audio_file + ", audio_image=" + audio_image
				+ ", audio_movie=" + audio_movie + ", audio_title="
				+ audio_title + ", artist_code=" + artist_code
				+ ", audio_jenre=" + audio_jenre + ", audio_detail="
				+ audio_detail + ", album_code=" + album_code + ", audio_date="
				+ audio_date + ", audio_copyrighter=" + audio_copyrighter
				+ ", audio_price=" + audio_price + ", audio_alive="
				+ audio_alive + "]";
	}



	
}
