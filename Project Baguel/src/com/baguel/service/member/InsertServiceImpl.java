package com.baguel.service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baguel.model.member.MemberDao;
import com.baguel.model.member.MemberDto;

public class InsertServiceImpl implements InsertService{
	private MemberDao memberDao;
	
	public InsertServiceImpl() {
		memberDao = MemberDao.getInstance();
	}
	@Override
	public int execute(HttpServletRequest request, HttpServletResponse response) {
		MemberDto insMember = (MemberDto)request.getAttribute("insMember");
		int ri = memberDao.insertMember(insMember);
		return ri;
	}

}
