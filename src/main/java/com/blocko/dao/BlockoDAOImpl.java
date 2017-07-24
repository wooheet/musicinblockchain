package com.blocko.dao;


import static com.fairmusic.fw.BlockoQuery.*;
import static com.fairmusic.fw.DBUtil.close;
import static com.fairmusic.fw.DBUtil.getConnection;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.blocko.dto.BitcoinAdressDTO;
import com.blocko.dto.MusicStampDTO;
import com.blocko.dto.MyBTCaddrDTO;



public class BlockoDAOImpl implements BlockoDAO {

	@Override
	public int insert(MusicStampDTO stamp) {
		Connection con = null;
		PreparedStatement ptmt = null;
		int result= 0;
		try {
			con = getConnection();
			ptmt = con.prepareStatement(STAMP_INSERT);
			ptmt.setString(1, stamp.getId());
			ptmt.setString(2, stamp.getMusicName());
			ptmt.setString(3, stamp.getMusicHash());
			ptmt.setString(4, stamp.getStampId());
			//ptmt.setString(5, stamp.getTxId());
			//ptmt.setString(6, stamp.getTimestamp());
			result = ptmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(null, ptmt, con);
		}
		return result;
	}
	@Override
	public int delete(String artist_code){
		Connection con = null;
		PreparedStatement ptmt = null;
		int result= 0;
		try {
			con = getConnection();
			ptmt = con.prepareStatement(MYBTC_DELETE);
			ptmt.setString(1, artist_code);
			result = ptmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(null, ptmt, con);
		}
		return result;
	}

	@Override
	public int bitcoinAdressInsert(BitcoinAdressDTO bitcoinAdress) {
		System.out.println(bitcoinAdress);
		Connection con = null;
		PreparedStatement ptmt = null;
		int result= 0;
		try {
			con = getConnection();
			ptmt = con.prepareStatement(BITCOINADDR_INSERT);
			/*ptmt.setString(1, bitcoinAdress.getId());
			ptmt.setString(2, bitcoinAdress.getBitcoinAdress1());
			ptmt.setString(3, bitcoinAdress.getPrivatekey1());
			ptmt.setString(4, bitcoinAdress.getBitcoinAdress2());
			ptmt.setString(5, bitcoinAdress.getPrivatekey2());
			ptmt.setString(6, bitcoinAdress.getBitcoinAdress3());
			ptmt.setString(7, bitcoinAdress.getPrivatekey3());
			ptmt.setString(8, bitcoinAdress.getRighterName1());
			ptmt.setLong(9, bitcoinAdress.getRighterVal1());
			ptmt.setString(10, bitcoinAdress.getRighterName2());
			ptmt.setLong(11, bitcoinAdress.getRighterVal2());
			ptmt.setString(12, bitcoinAdress.getRighterName3());
			ptmt.setLong(13, bitcoinAdress.getRighterVal3());*/
			ptmt.setString(1, bitcoinAdress.getAudio_code());
			ptmt.setString(2, bitcoinAdress.getBitcoinAdress());
			ptmt.setString(3, bitcoinAdress.getPrivatekey());
			ptmt.setString(4, bitcoinAdress.getRighterName());
			//int data=(int)bitcoinAdress.getRighterVal();
			ptmt.setDouble(5, bitcoinAdress.getRighterVal());
			result = ptmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(null, ptmt, con);
		}
		return result;
	}

	@Override
	public ArrayList<BitcoinAdressDTO> bitcoinAdressSelect(String audio_code) {
		ArrayList<BitcoinAdressDTO> bitcoinaddr = new ArrayList<BitcoinAdressDTO>();
		Connection con = null;
		PreparedStatement ptmt = null;
		ResultSet rs = null;
		BitcoinAdressDTO bitaddr = null;
		try {
			con = getConnection();
			ptmt = con.prepareStatement(BITCOINADDR_SELECT);
			ptmt.setString(1,audio_code);
			rs = ptmt.executeQuery();
			while(rs.next()){
				bitaddr =new BitcoinAdressDTO(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getDouble(5));
				bitcoinaddr.add(bitaddr);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rs, ptmt, con);
		}
		return bitcoinaddr;
		}

	@Override
	public MusicStampDTO StampSelect(String id, String MusicName) {
		Connection con = null;
		PreparedStatement ptmt = null;
		ResultSet rs = null;
		MusicStampDTO Stamp = null;
		try {
			con = getConnection();
			ptmt = con.prepareStatement(STAMP_SELECT);
			ptmt.setString(1,id);
			ptmt.setString(2,MusicName);
			rs = ptmt.executeQuery();
			while(rs.next()){
				Stamp =new MusicStampDTO(rs.getString(1),rs.getString(2),
						rs.getString(3),rs.getString(4));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rs, ptmt, con);
		}
		System.out.println("com/blocko.daoimpl ¿¡¼­ ½ºÅÆÇÁ °¡²¿¿À´ÂÁß ½ºÅÆÇÁ : "+Stamp);
		return Stamp;
		}


	@Override
	public int mybtcaddr(MyBTCaddrDTO myaddr) {
		Connection con = null;
		PreparedStatement ptmt = null;
		int result= 0;
		try {
			con = getConnection();
			ptmt = con.prepareStatement(MYBTC_INSERT);
			ptmt.setString(1, myaddr.getArtist());
			ptmt.setString(2, myaddr.getMypk());
			ptmt.setString(3, myaddr.getMybtcaddr());
			result = ptmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(null, ptmt, con);
		}
		return result;
	}

	@Override
	public MyBTCaddrDTO read(String artist) {
		Connection con = null;
		PreparedStatement ptmt = null;
		ResultSet rs = null;
		MyBTCaddrDTO addr = null;
		try {
			con = getConnection();
			ptmt = con.prepareStatement(MYBTC_SELECT);
			ptmt.setString(1,artist);
			rs = ptmt.executeQuery();
			if(rs.next()){
				addr = new MyBTCaddrDTO(rs.getString(1),rs.getString(2),rs.getString(3));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(null, ptmt, con);
		}
		return addr;
	}
}
