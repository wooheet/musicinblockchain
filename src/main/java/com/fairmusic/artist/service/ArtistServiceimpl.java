package com.fairmusic.artist.service;

import com.fairmusic.artist.dao.ArtistDAOimpl;
import com.fairmusic.dto.artistDTO;

public class ArtistServiceimpl implements ArtistService{

   @Override
   public int regist(artistDTO artist) {
      ArtistDAOimpl dao = new ArtistDAOimpl();
      int result = dao.regist(artist);
      return result;
   }


   @Override
   public boolean emailCheck(String email) {
      ArtistDAOimpl dao = new ArtistDAOimpl();
      boolean result = dao.emailCheck(email);
      return result;
   }



   @Override
   public artistDTO login(String email, String pass) {
      ArtistDAOimpl dao = new ArtistDAOimpl();
      artistDTO dto = dao.login(email, pass);
      return dto;
   }


   @Override
   public int pass_update(String email, String newPass) {
      ArtistDAOimpl dao = new ArtistDAOimpl();
      int result = dao.pass_update(email, newPass);
      return result;
   }


   @Override
   public artistDTO getArtistDTO(String artist_code) {
      ArtistDAOimpl dao = new ArtistDAOimpl();
      artistDTO dto = dao.getArtistDTO(artist_code);
      return dto;
   }


@Override
public int edit(String artist_pass, String artist_name, String artist_code) {
	  ArtistDAOimpl dao = new ArtistDAOimpl();
	  int result = dao.edit(artist_pass, artist_name,  artist_code);
	return result;
}


@Override
public int drop(String artist_code) {
	  ArtistDAOimpl dao = new ArtistDAOimpl();
	  int result = dao.drop(artist_code);
	return result;
}


}   

