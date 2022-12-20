package com.baguel.service.member;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baguel.model.member.MemberDao;

public class InsertNickConfirmImpl implements InsertNickConfirm {
	private MemberDao memberDao;
	
	public InsertNickConfirmImpl() {
		memberDao = MemberDao.getInstance();
	}
	@Override
	public int execute(HttpServletRequest request, HttpServletResponse response) {
		String userNick = (String)request.getAttribute("userNick");
		int ri = memberDao.confirmNick(userNick);
		
		return ri;
	}

}
