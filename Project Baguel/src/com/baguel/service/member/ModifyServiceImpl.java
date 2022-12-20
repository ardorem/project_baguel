package com.baguel.service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baguel.model.member.MemberDao;
import com.baguel.model.member.MemberDto;

public class ModifyServiceImpl implements ModifyService {
	private MemberDao memberDao;
	
	public ModifyServiceImpl() {
		memberDao = MemberDao.getInstance();
	}
	@Override
	public int execute(HttpServletRequest request, HttpServletResponse response) {
		MemberDto updateMember = (MemberDto)request.getAttribute("updateMember");
		int ri = memberDao.updateMember(updateMember);
		return ri;
	}

}
