package com.fairmusic.message.dao;

import java.util.ArrayList;

import com.fairmusic.dto.MessageDTO;

public interface MessageDAO {
	public int sendMessage(MessageDTO dto);
	public ArrayList<MessageDTO> Send_MessageList(String artist_code);
	public String Read_Message(String dm_code);
	public ArrayList<MessageDTO> MessageList(String artist_code);
	public int Message_Read_StateUpdate(String dm_code);
	public String Message_Read_State(String dm_code);
	public ArrayList<MessageDTO> NewMessage(String artist_code);
	public int Message_Delete(String dm_code);
}
