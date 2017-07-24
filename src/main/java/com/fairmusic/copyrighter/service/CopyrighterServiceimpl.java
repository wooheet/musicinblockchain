package com.fairmusic.copyrighter.service;

import com.fairmusic.copyrighter.dao.CopyrighterDAO;
import com.fairmusic.copyrighter.dao.CopyrighterDAOimpl;
import com.fairmusic.dto.copyrighterDTO;

public class CopyrighterServiceimpl implements CopyrighterService{

	@Override
	public int createCopyrighter(copyrighterDTO copyrighter) {
		
		CopyrighterDAO dao = new CopyrighterDAOimpl();
		int result = dao.createCopyrighter(copyrighter);
		return result;
	
	}

}
