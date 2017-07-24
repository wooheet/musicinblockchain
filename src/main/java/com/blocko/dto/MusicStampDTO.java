package com.blocko.dto;

import java.util.Date;

public class MusicStampDTO {
	String id;
	String musicName;
	String musicHash;
	String stampId;
	
	public MusicStampDTO(){}

	public MusicStampDTO(String id, String musicName, String musicHash,
			String stampId) {
		super();
		this.id = id;
		this.musicName = musicName;
		this.musicHash = musicHash;
		this.stampId = stampId;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getMusicName() {
		return musicName;
	}

	public void setMusicName(String musicName) {
		this.musicName = musicName;
	}

	public String getMusicHash() {
		return musicHash;
	}

	public void setMusicHash(String musicHash) {
		this.musicHash = musicHash;
	}

	public String getStampId() {
		return stampId;
	}

	public void setStampId(String stampId) {
		this.stampId = stampId;
	}
	
	
}
