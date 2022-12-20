package com.baguel.service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baguel.model.member.MemberDto;

public interface LoginService {
	public MemberDto execute(HttpServletRequest request, HttpServletResponse response);
}
