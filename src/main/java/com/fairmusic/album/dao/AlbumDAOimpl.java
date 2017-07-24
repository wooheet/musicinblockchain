package com.fairmusic.album.dao;

import static com.fairmusic.fw.AlbumQuery.*;
import static com.fairmusic.fw.AudioQuery.select_audio;
import static com.fairmusic.fw.DBUtil.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.fairmusic.dto.albumDTO;
import com.fairmusic.dto.audioDTO;
import com.fairmusic.fw.DBUtil;

public class AlbumDAOimpl implements AlbumDAO{

	@Override
	public int createAlbum(albumDTO album) {
		Connection con = null;
		PreparedStatement ptmt = null;
		int result= 0;
		try {
			
			con = getConnection();
			ptmt = con.prepareStatement(albuminsert);
			ptmt.setString(1, album.getAlbum_code());
			ptmt.setString(2, album.getAlbum_title());
			ptmt.setString(3, album.getArtist_code());
			ptmt.setString(4, album.getAlbum_image());
			ptmt.setString(5, album.getAlbum_dc());
			ptmt.setString(6, album.getAlbum_detail());
			ptmt.setString(7, album.getAlbum_alive());
			
			result = ptmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(null, ptmt, con);
		}
		return result;
	}

	@Override
	public ArrayList<albumDTO> myAlbumList(String artist_code) {
		ArrayList<albumDTO> dtolist = new ArrayList<albumDTO>();
		albumDTO dto = null;
		Connection con = null;
		PreparedStatement ptmt = null;
		ResultSet rs = null;

		try {
			con = DBUtil.getConnection();
			ptmt = con.prepareStatement(select_albumlist);
			ptmt.setString(1, artist_code);

			rs = ptmt.executeQuery();
			while (rs.next()) {
				dto = new albumDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),rs.getString(6), rs.getString(7),rs.getString(8));
				dtolist.add(dto);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			DBUtil.close(rs, ptmt, con);
		}
		return dtolist;
	}

	@Override
	public albumDTO getAlbumDTO(String album_code) {
		albumDTO dto = null;
		Connection con = null;
		PreparedStatement ptmt = null;
		ResultSet rs = null;

		try {
			con = DBUtil.getConnection();
			ptmt = con.prepareStatement(select_album);
			ptmt.setString(1, album_code);

			rs = ptmt.executeQuery();
			if (rs.next()) {
				dto = new albumDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6),rs.getString(7),rs.getString(8));
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			DBUtil.close(rs, ptmt, con);
		}
		return dto;
	}

}
