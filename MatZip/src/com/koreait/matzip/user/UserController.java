package com.koreait.matzip.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.matzip.Const;
import com.koreait.matzip.ViewRef;

public class UserController {
	
	//     /user/login
	public String login(HttpServletRequest request) {
		request.setAttribute(Const.TITLE, "로그인");
		request.setAttribute(Const.VIEW, "user/login");
		return ViewRef.TEMP_DEFAULT;
	}
}
