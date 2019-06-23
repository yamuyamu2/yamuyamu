package com.my.cloud;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;



/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	

	
	@RequestMapping(value="/joinf") // 회원가입
	public ModelAndView joinf(ModelAndView mv) {
		
		mv.setViewName("user/joinf");
		return mv;
		
	}
	@RequestMapping(value="/intro") // 회원가입
	public ModelAndView intro(ModelAndView mv) {
		
		mv.setViewName("villa/intro");
		return mv;
		
	}
	@RequestMapping(value="/villa") // 회원가입
	public ModelAndView villa(ModelAndView mv) {
		
		mv.setViewName("villa/vila1");
		return mv;
		
	}
	@RequestMapping(value="/loginf")//로그인폼
	public ModelAndView loginf(ModelAndView mv) {
		mv.setViewName("user/loginf");
		return mv;
	}
	@RequestMapping(value="/withdrawal")//로그인폼
	public ModelAndView withdrawal(ModelAndView mv) {
		mv.setViewName("user/withdrawal");
		return mv;
	}

	@RequestMapping(value="/roomrg")//
	public ModelAndView roomrg(ModelAndView mv) {
		mv.setViewName("reservation/roomrg");
		return mv;
	}
}
