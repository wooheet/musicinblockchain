package com.fairmusic.fw;

public class AudioQuery {

	public static String audioinsert ="insert into fm_audio values(?,?,?,?,?,?,?,?,?,sysdate,?,?,?)";
	public static String select_audio= "select * from fm_audio where audio_code = ?";
	public static String select_audiolist = "select * from fm_audio where artist_code = ?";
	public static String delete_audio = "update fm_audio set audio_alive = 0 where audio_code = ?";
	public static String having_audio_list = "select * from fm_audio_buy where artist_code = ?";
	public static String audio_get = "insert into fm_audio_buy values(?,?)";
	public static String audio_10select = "select * from (select * from fm_audio order by audio_date desc) where rownum < 10";
	
}
