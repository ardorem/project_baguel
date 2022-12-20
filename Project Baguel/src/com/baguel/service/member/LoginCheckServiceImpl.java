package com.baguel.service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baguel.model.member.MemberDao;
import com.baguel.model.member.MemberDto;

public class LoginCheckServiceImpl implements LoginCheckService {
	private MemberDao memberDao;
	
	public LoginCheckServiceImpl() {
		memberDao = MemberDao.getInstance();
	}
	@Override
	public int execute(HttpServletRequest request, HttpServletResponse response) {
		MemberDto checkMember = (MemberDto)request.getAttribute("checkMember");
		String userId = checkMember.getUserId();
		String userPw = checkMember.getUserPw();
		
		int result = memberDao.userCheck(userId, userPw);
		return result;
	}

}
