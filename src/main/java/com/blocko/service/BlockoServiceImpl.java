package com.blocko.service;

import java.util.ArrayList;

import com.blocko.dao.BlockoDAO;
import com.blocko.dao.BlockoDAOImpl;
import com.blocko.dto.BitcoinAdressDTO;
import com.blocko.dto.MusicStampDTO;
import com.blocko.dto.MyBTCaddrDTO;

public class BlockoServiceImpl implements BlockoService{

	@Override
	public int insert(MusicStampDTO stamp) {
		BlockoDAO dao = new BlockoDAOImpl();
		int result = dao.insert(stamp);
		return result;
	}
	public int delete(String artist_code) {
		BlockoDAO dao = new BlockoDAOImpl();
		int result = dao.delete(artist_code);
		return result;
	}
	

	@Override
	public int bitcoinAdressInsert(BitcoinAdressDTO bitcoinAdress) {
		BlockoDAO dao = new BlockoDAOImpl();
		int result = dao.bitcoinAdressInsert(bitcoinAdress);
		return result;
	}

	@Override
	public ArrayList<BitcoinAdressDTO> bitcoinAdressSelect(String id) {
		BlockoDAO dao = new BlockoDAOImpl();
		ArrayList<BitcoinAdressDTO> BitcoinAdress = dao.bitcoinAdressSelect(id);
		return BitcoinAdress;
	}

	@Override
	public MusicStampDTO StampSelect(String id,String MusicName) 	{
		BlockoDAO dao = new BlockoDAOImpl();
		MusicStampDTO MusicStamp = dao.StampSelect(id, MusicName);
		return MusicStamp;
	}
	
	@Override
	public int mybtcaddr(MyBTCaddrDTO myaddr) {
		BlockoDAO dao = new BlockoDAOImpl();
		int result = dao.mybtcaddr(myaddr);
		return result;
	}

	@Override
	public MyBTCaddrDTO read(String artist) {
		BlockoDAO dao = new BlockoDAOImpl();
		MyBTCaddrDTO addr = dao.read(artist);
		return addr;
	}

}
