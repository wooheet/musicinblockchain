package com.fairmusic.seong;

import java.util.Random;

public class fm_Code {
	
	public String uniqueCode(int i){
		String code = "";
		Random r = new Random();
		for(int j = 0; j < i ; j++){
			if(r.nextBoolean()){
				code += r.nextInt(9)+"";
			}else{
				code += getRandomString(1);
			}
		}
		return code;
	}
	
	public String getRandomString(int length){
		  StringBuffer buffer = new StringBuffer();
		  Random random = new Random();
		 
		  char chars[] = {'a','b','c','d','e','f','g','h','i','j','k','l','n','m','o','p','q','r','s','t','u','v','w','x','y','z'};
		  
		 
		  for (int i=0 ; i<length ; i++)
		  {
		    buffer.append(chars[random.nextInt(chars.length)]);
		  }
		  return buffer.toString();
	}
}
