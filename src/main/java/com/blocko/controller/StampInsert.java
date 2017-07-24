package com.blocko.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import io.blocko.bitcoinj.core.Sha256Hash;
import io.blocko.bitcoinj.core.Utils;
import io.blocko.coinstack.CoinStackClient;
import io.blocko.coinstack.exception.CoinStackException;
import io.blocko.coinstack.model.Stamp;

import com.blocko.api.API;
import com.blocko.dto.MusicStampDTO;
import com.blocko.service.BlockoService;
import com.blocko.service.BlockoServiceImpl;
import com.fairmusic.dto.artistDTO;

public class StampInsert {
	CoinStackClient coinstack = API.createNewCoinStackClient();
	@SuppressWarnings("null")
	public Map<String, String> insert(String audio_code,byte[] filebyte,HttpSession ses){
		
		Map<String,String> stampData = new HashMap<String, String>();
		artistDTO ardto = (artistDTO)ses.getAttribute("user");
		
		String id= ardto.getArtist_code();

		String audiobyte = audio_code; 
		byte[] data = filebyte;
		byte[] hash = Sha256Hash.create(data).getBytes();
		String MusicHash = Utils.HEX.encode(hash);
		System.out.println("���� �ؽ���: "+MusicHash);
		// ���� �ؽ����� �ѷ��ش�.
		try {
			String stampId = coinstack.stampDocument(MusicHash);
			System.out.println("������ �������� �� : "+stampId);
			
			MusicStampDTO stampDTO = new MusicStampDTO(id, audio_code, MusicHash, stampId);
			BlockoService service = new BlockoServiceImpl();		
			int result = service.insert(stampDTO);
			
			String msg = "";
			if(result>=1){
				msg = result+"�� - Music ���ü�� ���ԵǾ����ϴ�.";
			}else{
				msg = "���ü�� ���Խ���";
			}
			stampData.put("msg", msg);
			stampData.put("MusicHash", MusicHash);
			stampData.put("stampId", stampId);

			

		} catch (CoinStackException e) {
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			coinstack.close();
		}
		return stampData;
	}

}
