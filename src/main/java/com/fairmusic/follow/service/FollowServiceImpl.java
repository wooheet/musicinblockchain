package com.fairmusic.follow.service;

import java.util.ArrayList;

import com.fairmusic.dto.artistDTO;
import com.fairmusic.dto.followDTO;
import com.fairmusic.follow.dao.FollowDAO;
import com.fairmusic.follow.dao.FollowDAOImpl;

public class FollowServiceImpl implements FollowService {

	@Override
	public followDTO FOLLOW_CHECK(String me, String follower) {
		FollowDAO dao = new FollowDAOImpl();
		followDTO result = dao.FOLLOW_CHECK(me, follower);
		return result;
	}

	@Override
	public int FOLLOW_INSERT(String me, String follower) {
		FollowDAO dao = new FollowDAOImpl();
		int result = dao.FOLLOW_INSERT(me, follower);
		return result;
	}

	@Override
	public int FOLLOW_UNFOLLOW(String me, String follower) {
		FollowDAO dao = new FollowDAOImpl();
		int result = dao.FOLLOW_UNFOLLOW(me, follower);
		return result;
	}

	@Override
	public int FOLLOW_REFOLLOW(String me, String follower) {
		FollowDAO dao = new FollowDAOImpl();
		int result = dao.FOLLOW_REFOLLOW(me, follower);
		return result;
	}

	@Override
	public ArrayList<followDTO> FOLLOW_SEARCH_FOLLOWING(String me) {
		FollowDAO dao = new FollowDAOImpl();
		ArrayList<followDTO> vector = dao.FOLLOW_SEARCH_FOLLOWING(me);
		return vector;
	}

	@Override
	public ArrayList<followDTO> FOLLOW_SEARCH_FOLLOWER(String follower) {
		FollowDAO dao = new FollowDAOImpl();
		ArrayList<followDTO> vector = dao.FOLLOW_SEARCH_FOLLOWER(follower);
		return vector;
	}

	@Override
	public artistDTO FOLLOW_GETID_BYCODE(String code) {
		FollowDAO dao = new FollowDAOImpl();
		artistDTO dto = dao.FOLLOW_GETID_BYCODE(code);
		return dto;
	}

	

}
