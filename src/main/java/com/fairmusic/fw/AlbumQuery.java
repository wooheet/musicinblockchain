package com.fairmusic.fw;

public class AlbumQuery {
	
	public static String albuminsert = "insert into fm_album values(?,?,?,?,sysdate,?,?,?)";
	public static String select_albumlist = "select * from fm_album where artist_code = ?";
	public static String select_album= "select * from fm_album where album_code=?";
	public static String delete_album = "update fm_album set album_alive = 0 where album_code = ?";
}
