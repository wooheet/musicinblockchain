package com.fairmusic.audio.dao;

import java.util.ArrayList;

import com.fairmusic.dto.audioDTO;
import com.fairmusic.dto.audiobuyDTO;

public interface AudioDAO {
	public int createAudio(audioDTO audio);
	public audioDTO selectAudio(String audio_code);
	public ArrayList<audioDTO> myAudioList(String artist_code);
	public int audioDelete(String audio_code);
	public ArrayList<audiobuyDTO> havingAudio(String artist_code);
	public int audiopurchase(String artist_code,String audio_code);
	public ArrayList<audioDTO> select10audio(String state);
}
