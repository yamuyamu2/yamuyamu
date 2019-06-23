package com.my.cloud;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import business.BoardDAO;
import util.BoardVO;
import util.PageVO;


@Controller
public class BoardController {
@Autowired
@Qualifier("board")
private BoardDAO dao;
@RequestMapping(value="/binsert")
public ModelAndView binsert(ModelAndView mv, BoardVO bvo) throws Exception  {
	dao.insert(bvo);
		
	 // 성공 => boardList
		mv.setViewName("redirect:pagelist");		
	return mv ;
   } // bdetail
 @RequestMapping(value="/boardl")//boardList
public ModelAndView blist(ModelAndView mv) throws Exception   {
	
	 List<BoardVO> list= dao.list();
	 mv.addObject("blist",list);
	 
	 mv.setViewName("board/boardlist"); 
	return mv;
	}
 @RequestMapping(value="/read")
 public ModelAndView read(ModelAndView mv,@RequestParam("bid")int bid,BoardVO bvo) throws Exception   {
	 dao.hitup(bid);//조회수 증가 
	mv.addObject(dao.read(bid));
	System.out.println(bvo.getContent());
	
 	 mv.setViewName("board/boardlead"); 
 	return mv;
 	}
 @RequestMapping(value="/delete")
 public ModelAndView delete(ModelAndView mv,@RequestParam("bid")int bid)throws Exception {
	
	 dao.delete(bid);

	 System.out.println("@@@삭제성공@@@@");
	 mv.setViewName("redirect:pagelist");
	return mv; 
 }
 @RequestMapping(value="/rwriter")
 public ModelAndView rwriter(@RequestParam("bid")int bid,ModelAndView mv,BoardVO vo) throws Exception {
	    mv.addObject(dao.read(bid));
	    System.out.println(vo);
		mv.setViewName("board/rwriter");
		return mv;
	}
 @RequestMapping(value="/modify")
 public ModelAndView modify(ModelAndView mv,BoardVO vo) throws Exception {
	
	dao.update(vo);
	System.out.println(vo);
	 mv.setViewName("redirect:pagelist");
	 return mv;
 }
 @RequestMapping(value="/writeA")//게시판글쓰기
	public ModelAndView wirter(HttpServletRequest request,ModelAndView mv) {
		
		HttpSession session = request.getSession() ;
		if (session!=null) {
		mv.setViewName("board/wirterForm");
		}else {
			mv.setViewName("login/loginForm");
		}
		return mv;
	}
 @RequestMapping(value="/pagelist")

 public ModelAndView pagelist(ModelAndView mv,PageVO vo) throws Exception   {
    
    int cnt=dao.totaldata();
    
    vo.setTotaldata(cnt);
    System.out.println("endpage  !"+vo.getEndpage());
    System.out.println("startpage !"+vo.getStartpage());
    List<BoardVO> list= dao.listCriteria(vo);
    mv.addObject("blist", list);
     mv.addObject("page", vo);
	 
	
	
	 mv.setViewName("board/pagelist"); 
	return mv;
	}

}
