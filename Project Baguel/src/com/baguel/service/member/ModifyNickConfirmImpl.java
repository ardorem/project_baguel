package com.baguel.service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baguel.model.member.MemberDao;

public class ModifyNickConfirmImpl implements ModifyNickConfirm {
	private MemberDao memberDao;
	
	public ModifyNickConfirmImpl() {
		memberDao = MemberDao.getInstance();
	}
	@Override
	public int execute(HttpServletRequest request, HttpServletResponse response) {
		String userId = (String)request.getAttribute("userId");
		String userNick = (String)request.getAttribute("userNick");
		int ri = memberDao.confirmNick(userId, userNick);
		return ri;
	}

}
