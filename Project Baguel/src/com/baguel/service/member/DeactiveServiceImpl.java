package com.baguel.service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baguel.model.member.MemberDao;
import com.baguel.model.member.MemberDto;

public class DeactiveServiceImpl implements DeactiveService {
	private MemberDao memberDao;
	
	public DeactiveServiceImpl() {
		memberDao = MemberDao.getInstance();
	}
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String userId = (String)request.getAttribute("userId");
		memberDao.deactiveMember(userId);
	}

}
