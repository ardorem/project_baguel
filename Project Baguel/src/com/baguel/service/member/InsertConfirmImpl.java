package com.baguel.service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baguel.model.member.MemberDao;
import com.baguel.model.member.MemberDto;

public class InsertConfirmImpl implements InsertConfirm {
	private MemberDao memberDao;
	
	public InsertConfirmImpl() {
		memberDao = MemberDao.getInstance();
	}
	@Override
	public int execute(HttpServletRequest request, HttpServletResponse response) {
		String userId = (String)request.getAttribute("userId");
		int ri = memberDao.confirmId(userId);
		return ri;
	}

}
