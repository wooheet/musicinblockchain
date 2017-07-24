package com.fairmusic.album.service;

import java.util.ArrayList;

import com.fairmusic.album.dao.AlbumDAO;
import com.fairmusic.album.dao.AlbumDAOimpl;
import com.fairmusic.dto.albumDTO;

public class AlbumServiceimpl implements AlbumService{

	@Override
	public int createAlbum(albumDTO album) {
		
		AlbumDAO dao = new AlbumDAOimpl();
			int result = dao.createAlbum(album);
			return result;
	}

	@Override
	public ArrayList<albumDTO> myAlbumList(String artist_code) {
		AlbumDAO dao = new AlbumDAOimpl();
		ArrayList<albumDTO> dtolist = dao.myAlbumList(artist_code);
		return dtolist;
	}

	@Override
	public albumDTO getAlbumDTO(String album_code) {
		AlbumDAO dao = new AlbumDAOimpl();
		albumDTO dto = dao.getAlbumDTO(album_code);
		return dto;
	}

	

}
