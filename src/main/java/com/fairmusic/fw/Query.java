package com.fairmusic.fw;

public class Query {

      public static String Regist
      = "insert into fm_artist values(?,?,?,?,?,?,?) ";
      public static String EMAIL_CHECK
      = "select * from fm_artist where artist_email = ?";
      public static String EMP_login
      = "select * from fm_artist where ARTIST_EMAIL = ? and ARTIST_PASS =? and ARTIST_ALIVE='1' ";
      public static String Pass_update
      = "update fm_artist set artist_pass=? where artist_email=?";
      public static String Select_Artist
         = "select * from fm_artist where artist_code = ?";
      public static String Edit
      = "update fm_artist set artist_pass=?, artist_name=? where artist_code=? ";
      public static String Drop
      = "update fm_artist set artist_alive='0' where artist_code = ? ";
}