package com.fairmusic.dto;

public class audiobuyDTO {
	
	private String artist_code;
	private String audio_code;
	
	public audiobuyDTO(){
		
	}

	
	
	
	public audiobuyDTO(String artist_code, String audio_code) {
		super();
		this.artist_code = artist_code;
		this.audio_code = audio_code;
	}




	public String getArtist_code() {
		return artist_code;
	}




	public void setArtist_code(String artist_code) {
		this.artist_code = artist_code;
	}




	public String getAudio_code() {
		return audio_code;
	}




	public void setAudio_code(String audio_code) {
		this.audio_code = audio_code;
	}




	@Override
	public String toString() {
		return "audiobuyDTO [artist_code=" + artist_code + ", audio_code="
				+ audio_code + "]";
	}
	

}
