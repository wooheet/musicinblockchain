package com.fairmusic.fw;

public class MessageQuery {
   
   public static String Message_Send
   = "insert into fm_dm values ( ?, ?, (select artist_code from fm_artist where artist_email = ?) , ? ,sysdate, ?)";
   /*public static String Message_Loading
   = " select * from fm_dm where artist_code= ? ";*/
   public static String Send_Message_Select
   = "select d.dm_content, a.artist_email, a.artist_image, d.dm_code from fm_dm d, fm_artist a where a.artist_code = d.artist_receiver_code and d.artist_code= ?";
   public static String Message_Read
   = "select dm_content from fm_dm where dm_code= ? ";
   public static String Message_Select
   = "select d.dm_code, a.artist_email, a.artist_image from fm_dm d, fm_artist a where a.artist_code = d.artist_code and d.artist_receiver_code= ? ";
   public static String Message_Read_stateUpdate
   = "update fm_dm set dm_read_state = '1' where dm_code= ? ";
   public static String Message_Read_state
   = "select dm_read_state from fm_dm where dm_code= ?";
   public static String NewMessage
   = "select d.dm_code, a.artist_email, a.artist_image from fm_dm d, fm_artist a where a.artist_code = d.artist_code and d.artist_receiver_code= ? and d.dm_read_state='0'";
   public static String Message_Delete
   = "delete from fm_dm where dm_code = ? ";
}