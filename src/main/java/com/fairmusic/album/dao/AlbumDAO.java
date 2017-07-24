package com.fairmusic.album.dao;

import java.util.ArrayList;

import com.fairmusic.dto.albumDTO;

public interface AlbumDAO{
	public int createAlbum(albumDTO album);
	public ArrayList<albumDTO> myAlbumList(String artist_code);
	public albumDTO getAlbumDTO(String album_code);
}
