package com.fairmusic.follow.service;

import java.util.ArrayList;

import com.fairmusic.dto.artistDTO;
import com.fairmusic.dto.followDTO;

public interface FollowService {
	public followDTO FOLLOW_CHECK(String me, String follower);
	
	public int FOLLOW_INSERT(String me, String follower);
	
	public int FOLLOW_UNFOLLOW(String me, String follower);
	
	public int FOLLOW_REFOLLOW(String me, String follower);
	
	public ArrayList<followDTO> FOLLOW_SEARCH_FOLLOWING(String me);
	
	public ArrayList<followDTO> FOLLOW_SEARCH_FOLLOWER(String follower);
	
	public artistDTO FOLLOW_GETID_BYCODE(String code);
}
