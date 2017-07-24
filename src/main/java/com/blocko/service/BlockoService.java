package com.blocko.service;

import java.util.ArrayList;

import com.blocko.dto.BitcoinAdressDTO;
import com.blocko.dto.MusicStampDTO;
import com.blocko.dto.MyBTCaddrDTO;

public interface BlockoService {
	int insert(MusicStampDTO stamp);
	int bitcoinAdressInsert(BitcoinAdressDTO bitcoinAdress);
	ArrayList<BitcoinAdressDTO> bitcoinAdressSelect(String id);
	MusicStampDTO StampSelect(String id,String MusicName);
	int mybtcaddr(MyBTCaddrDTO myaddr);
	MyBTCaddrDTO read(String artist);
	int delete(String artist_code);
}
