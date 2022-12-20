package com.baguel.service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baguel.model.member.MemberDao;
import com.baguel.model.member.MemberDto;

public class LoginServiceImpl implements LoginService {
	private MemberDao memberDao;
	
	public LoginServiceImpl() {
		memberDao = MemberDao.getInstance();
	}
	@Override
	public MemberDto execute(HttpServletRequest request, HttpServletResponse response) {
		String userId = (String)request.getAttribute("userId");
		System.out.println("LoginServiceImpl : "+ request.getAttribute("userId"));
		MemberDto memberDto = memberDao.getMember(userId);
		return memberDto;
	}

}
