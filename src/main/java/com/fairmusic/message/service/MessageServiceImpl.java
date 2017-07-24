package com.fairmusic.message.service;

import java.util.ArrayList;

import com.fairmusic.dto.MessageDTO;
import com.fairmusic.message.dao.MessageDAOImpl;

public class MessageServiceImpl implements MessageService {

	@Override
	public int sendMessage(MessageDTO dto) {
		MessageDAOImpl dao = new MessageDAOImpl();
		int result =  dao.sendMessage(dto);
		return result;
	}

	@Override
	public ArrayList<MessageDTO> Send_MessageList(String artist_code) {
		MessageDAOImpl dao = new MessageDAOImpl();
		System.out.println("service : "+artist_code);
		ArrayList<MessageDTO> Send_MessageList = dao.Send_MessageList(artist_code);
		return Send_MessageList;
	}

	@Override
	public String Read_Message(String dm_code) {
		MessageDAOImpl dao = new MessageDAOImpl();
		String content = dao.Read_Message(dm_code);
		return content;
	}

	@Override
	public ArrayList<MessageDTO> MessageList(String artist_code) {
		MessageDAOImpl dao = new MessageDAOImpl();
		ArrayList<MessageDTO> messageList = dao.MessageList(artist_code);
		return messageList;
	}

	@Override
	public int Message_Read_StateUpdate(String dm_code) {
		MessageDAOImpl dao = new MessageDAOImpl();
		int result = dao.Message_Read_StateUpdate(dm_code);
		return result;
	}

	@Override
	public String Message_Read_State(String dm_code) {
		MessageDAOImpl dao = new MessageDAOImpl();
		String state = dao.Message_Read_State(dm_code);
		return state;
	}

	@Override
	public ArrayList<MessageDTO> NewMessage(String artist_code) {
		MessageDAOImpl dao = new MessageDAOImpl();
		ArrayList<MessageDTO> newMessage = dao.NewMessage(artist_code);
		System.out.println("¼­ºñ½º : "+newMessage);
		return newMessage;
	}

	@Override
	public int Message_Delete(String dm_code) {
		MessageDAOImpl dao = new MessageDAOImpl();
		int result = dao.Message_Delete(dm_code);
		return result;
	}

}
