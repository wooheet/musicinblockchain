package com.fairmusic.message.dao;

import static com.fairmusic.fw.DBUtil.close;
import static com.fairmusic.fw.DBUtil.getConnection;
import static com.fairmusic.fw.MessageQuery.Message_Read;
import static com.fairmusic.fw.MessageQuery.Message_Read_state;
import static com.fairmusic.fw.MessageQuery.Message_Read_stateUpdate;
import static com.fairmusic.fw.MessageQuery.Message_Select;
import static com.fairmusic.fw.MessageQuery.Message_Send;
import static com.fairmusic.fw.MessageQuery.NewMessage;
import static com.fairmusic.fw.MessageQuery.Send_Message_Select;
import static com.fairmusic.fw.MessageQuery.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.fairmusic.dto.MessageDTO;

public class MessageDAOImpl implements MessageDAO {

	@Override
	public int sendMessage(MessageDTO dto) {
		Connection con = null;
		PreparedStatement ptmt = null;
		int result= 0;
		try {
			con = getConnection();
			ptmt = con.prepareStatement(Message_Send);
			ptmt.setString(1, dto.getDM_CODE());
			ptmt.setString(2, dto.getArtist_code());
			ptmt.setString(3, dto.getReceiver_code());
			ptmt.setString(4, dto.getDm_content());
			ptmt.setString(5, dto.getDm_read_state());
			result = ptmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(null, ptmt, con);
		}
		return result;
	}


	@Override
	public ArrayList<MessageDTO> Send_MessageList(String artist_code) {
		System.out.println("dao : "+artist_code);
		Connection con = null;
		PreparedStatement ptmt = null;
		ArrayList<MessageDTO> MessageList = new ArrayList<MessageDTO>();
		MessageDTO dto = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			ptmt = con.prepareStatement(Send_Message_Select);
			ptmt.setString(1,artist_code);
			rs = ptmt.executeQuery();
			while (rs.next()){
				dto = new MessageDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4));
				MessageList.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(null, ptmt, con);
		}
		return MessageList;
	}


	@Override
	public String Read_Message(String dm_code) {
		Connection con = null;
		PreparedStatement ptmt = null;
		ResultSet rs = null;
		String content = "";
		try {
			con = getConnection();
			ptmt = con.prepareStatement(Message_Read);
			ptmt.setString(1, dm_code);
			rs = ptmt.executeQuery();
			if(rs.next()){
				content = rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(null, ptmt, con);
		}
		return content;
	}


	@Override
	public ArrayList<MessageDTO> MessageList(String artist_code) {
		Connection con = null;
		PreparedStatement ptmt = null;
		ArrayList<MessageDTO> MessageList = new ArrayList<MessageDTO>();
		MessageDTO dto = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			ptmt = con.prepareStatement(Message_Select);
			ptmt.setString(1,artist_code);
			rs = ptmt.executeQuery();
			while (rs.next()){
				dto = new MessageDTO(rs.getString(1), rs.getString(2), rs.getString(3));
				MessageList.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(null, ptmt, con);
		}
		return MessageList;
	}


	@Override
	public int Message_Read_StateUpdate(String dm_code) {
		Connection con = null;
		PreparedStatement ptmt = null;
		int result= 0;
		try {
			con = getConnection();
			ptmt = con.prepareStatement(Message_Read_stateUpdate);
			ptmt.setString(1, dm_code);
			result = ptmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(null, ptmt, con);
		}
		return result;
	}


	@Override
	public String Message_Read_State(String dm_code) {
		Connection con = null;
		PreparedStatement ptmt = null;
		String state="";
		ResultSet rs = null;
		try {
			con = getConnection();
			ptmt = con.prepareStatement(Message_Read_state);
			ptmt.setString(1, dm_code);
			rs = ptmt.executeQuery();
			if(rs.next()){
				state = rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(null, ptmt, con);
		}
		return state;
	}


	@Override
	public ArrayList<MessageDTO> NewMessage(String artist_code) {
		Connection con = null;
		PreparedStatement ptmt = null;
		ArrayList<MessageDTO> MessageList = new ArrayList<MessageDTO>();
		MessageDTO dto = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			ptmt = con.prepareStatement(NewMessage);
			ptmt.setString(1,artist_code);
			rs = ptmt.executeQuery();
			while (rs.next()){
				dto = new MessageDTO(rs.getString(1), rs.getString(2), rs.getString(3));
				MessageList.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(null, ptmt, con);
		}
		
		System.out.println("dao : "+MessageList);
		return MessageList;
	}


	@Override
	public int Message_Delete(String dm_code) {
		Connection con = null;
		PreparedStatement ptmt = null;
		int result= 0;
		try {
			con = getConnection();
			ptmt = con.prepareStatement(Message_Delete);
			ptmt.setString(1, dm_code);
			result = ptmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(null, ptmt, con);
		}
		return result;
	}

}
