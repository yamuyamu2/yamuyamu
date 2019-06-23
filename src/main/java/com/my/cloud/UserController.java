package com.my.cloud;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import business.UserDAO;
import util.UserVO;


@Controller
public class UserController {
	@Autowired
	@Qualifier("User")
	UserDAO dao;
	
	@RequestMapping(value="join")
	public ModelAndView join(ModelAndView mv,UserVO vo) {
		if(vo==null) {
		    mv.setViewName("/joinf");
		    }
		else {
			int cnt=dao.insert(vo);
			if(cnt>0) {
				mv.setViewName("/login");
			}
		}
		
		mv.setViewName("/home");//회원가입후 홈으로!
		return mv;
		}
	
	@RequestMapping(value="/login")
	public ModelAndView login(ModelAndView mv,HttpServletRequest request,UserVO vo) {
		String id=vo.getId();
		System.out.println(vo.getId());
		String pw=vo.getPassword();
		System.out.println(vo.getPassword());
		System.out.println(vo);
		HttpSession session=request.getSession();
		if(id.equals("admin") && pw.equals("1234")) {
		
			vo.setId("admin");
		}else {
		vo=dao.Ulogin(vo);//admin 이 아니면 로그인 !
		}
		if(vo!=null) {
			session.setAttribute("logvo", vo);
			
			session.setMaxInactiveInterval(60 * 30);
			
			mv.setViewName("home");
		}else { 
			mv.addObject("msg","fail");
		     mv.setViewName("redirect:loginf");
		}
		
		return mv;
	}
	

	@RequestMapping(value = "/logout")
	public ModelAndView logout(HttpSession session,ModelAndView mv) throws Exception {
		session.invalidate();
		mv.setViewName("home");
		return mv;
	}
	@RequestMapping(value = "/uwithdrawal")
	public ModelAndView withdrawal(ModelAndView mv,UserVO vo,HttpSession session,RedirectAttributes rttr)  {
	UserVO id=(UserVO)session.getAttribute("logid");
		String oldPw = id.getPassword();
		String newPw = vo.getPassword();

		if (!(oldPw.equals(newPw))) {
			 rttr.addFlashAttribute("msg", false);
			 mv.setViewName("redirect:/withdrawal");
			return mv;
		}else
		dao.withdrawal(vo);

		session.invalidate();
		mv.setViewName("home");
		return mv;
	}
		
	

}