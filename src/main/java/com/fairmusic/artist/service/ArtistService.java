package com.fairmusic.artist.service;

import com.fairmusic.dto.artistDTO;

interface ArtistService {

   int regist(artistDTO artist);
   boolean emailCheck(String email);
   artistDTO login(String email, String pass);
   int pass_update(String email, String newPass);
   artistDTO getArtistDTO(String artist_code);
   int edit(String artist_pass, String artist_name, String artist_code);
   int drop(String artist_code);
}