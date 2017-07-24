package com.fairmusic.fw;

public class Follow_Query {

		public static String FOLLOW_CHECK
		= "select * from fm_follow where artist_code = ? and artist_follow_code= ?";
		
		public static String FOLLOW_INSERT
		="insert into fm_follow values(?,?,1)";
		
		public static String FOLLOW_UNFOLLOW
		="update fm_follow set FOLLOW_GOOD_ALIVE=0 where artist_code = ? and artist_follow_code = ?";
		
		public static String FOLLOW_REFOLLOW
		="update fm_follow set FOLLOW_GOOD_ALIVE=1 where artist_code = ? and artist_follow_code = ?";
		
		public static String FOLLOW_SEARCH_FOLLOWING
		="select f.*, a.artist_name, d.audio_code from fm_follow f, fm_artist a, FM_AUDIO d where f.artist_follow_code=a.artist_code and d.artist_code=f.artist_code and f.FOLLOW_GOOD_ALIVE=1 and f.artist_code= ?";
		
		public static String FOLLOW_SEARCH_FOLLOWER
		="select f.*, a.artist_name, d.audio_code from fm_follow f, fm_artist a, FM_AUDIO d where f.artist_code=a.artist_code and d.artist_code=f.artist_code and f.FOLLOW_GOOD_ALIVE=1 and f.artist_follow_code= ?";
		
		public static String FOLLOW_GETID_BYCODE
		="select * from fm_artist where artist_code= ?";
}
