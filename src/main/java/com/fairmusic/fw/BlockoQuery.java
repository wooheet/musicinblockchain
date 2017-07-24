package com.fairmusic.fw;

public class BlockoQuery {
	public static String STAMP_INSERT
	="insert into blockostamp values(?,?,?,?)";
	
	public static String STAMP_SELECT
	="select * from blockostamp where artist_code=? and audio_code= ?";
	
	public static String BITCOINADDR_INSERT
	="insert into bitcoinaddress values(?,?,?,?,?)";
	
	public static String BITCOINADDR_SELECT
	="select * from bitcoinaddress where audio_code= ?";
	
	public static String MYBTC_INSERT
	="insert into mybtc values(?,?,?)";	
	
	public static String MYBTC_SELECT
	="select * from mybtc where artist_code =?";	
	
	public static String MYBTC_DELETE
	="delete from mybtc where artist_code = ?";
}
