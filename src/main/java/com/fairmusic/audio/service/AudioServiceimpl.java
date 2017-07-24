package com.fairmusic.audio.service;

import java.util.ArrayList;

import com.fairmusic.audio.dao.AudioDAO;
import com.fairmusic.audio.dao.AudioDAOimpl;
import com.fairmusic.dto.audioDTO;
import com.fairmusic.dto.audiobuyDTO;

public class AudioServiceimpl implements AudioService{

	@Override
	public int createAudio(audioDTO audio) {
		AudioDAO dao = new AudioDAOimpl();
		int result = dao.createAudio(audio);
		return result;
	}

	@Override
	public audioDTO selectAudio(String audio_code) {
		audioDTO dto = null;
		AudioDAO dao = new AudioDAOimpl();
		dto = dao.selectAudio(audio_code);
		return dto;
	}

	@Override
	public ArrayList<audioDTO> myAudioList(String artist_code) {
		AudioDAO dao = new AudioDAOimpl();
		ArrayList<audioDTO> dtolist = dao.myAudioList(artist_code);
		return dtolist;
	}

	@Override
	public int audioDelete(String audio_code) {
		AudioDAO dao = new AudioDAOimpl();
		int result = dao.audioDelete(audio_code);
		return result;
	}

	@Override
	public ArrayList<audiobuyDTO> havingAudio(String artist_code) {
		AudioDAO dao = new AudioDAOimpl();
		ArrayList<audiobuyDTO> dtolist = dao.havingAudio(artist_code);
		return dtolist;
	}

	@Override
	public int audiopurchase(String artist_code, String audio_code) {
		AudioDAO dao = new AudioDAOimpl();
		System.out.println("서비스단에선 오디오코드 "+ audio_code);
		int result = dao.audiopurchase(artist_code, audio_code);
		return result;
	}

	@Override
	public ArrayList<audioDTO> select10audio(String state) {
		AudioDAO dao = new AudioDAOimpl();
		ArrayList<audioDTO> dtolist = dao.select10audio(state);
		return dtolist;
	}

}
