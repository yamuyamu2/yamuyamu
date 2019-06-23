package com.my.cloud;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import business.RoomDAO;
import util.RoomVO;
import util.UserVO;

@Controller
public class RoomController {
	@Autowired
	@Qualifier("room")
	private RoomDAO dao;
	
	@RequestMapping(value = {"/","/home"}, method = RequestMethod.GET)
	public ModelAndView  home( ModelAndView mv ,HttpSession session) throws Exception {
		ArrayList<RoomVO> roomList = dao.getRoom();
		
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG);
		
		String formattedDate = dateFormat.format(date);
	
		session.setAttribute("roomLis", roomList);
		mv.addObject("serverTime", formattedDate);
		
		mv.setViewName("home");
		return mv;
	}
	@RequestMapping(value = "/rinsert")
	public ModelAndView roominsert(ModelAndView mv, RoomVO vo) throws ServletException, IOException {

		MultipartFile rimgf = vo.getRimgf();
		String file1, file2 = "No Image";
		if (!rimgf.isEmpty()) {
			file1 = "/Users/seungyang/Desktop/java/Mtest/CloudF/src/main/webapp/resources/uploadImage/"
					+ rimgf.getOriginalFilename();
			rimgf.transferTo(new File(file1));
			file2 = "resources/uploadImage/" + rimgf.getOriginalFilename();
		}
		vo.setRimg(file2);
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@" + vo);
		int cnt = dao.rinsert(vo);

		if (cnt > 0)
			mv.setViewName("redirect:home");
		else {
			mv.setViewName("roomrg");
		}
		return mv;
	}

	@RequestMapping(value = "rread")
	public ModelAndView rread(ModelAndView mv, @RequestParam("rnum") int rnum, RoomVO vo) throws Exception {

		mv.addObject(dao.rread(rnum));
		System.out.println("!!!!!!!!!!!!!!!!!!!" + rnum);
		System.out.println("@@@@@@@@@@@@@@@" + vo.getRimg());
		System.out.println();
		mv.setViewName("villa/vila1");
		return mv;
	}

	@RequestMapping(value = "cal") // 
	public ModelAndView cal(ModelAndView mv,RoomVO vo) throws Exception {
        try {
        	JSONObject json = new JSONObject(); 
        	
			ArrayList<RoomVO> roomList = dao.getRoom();
//			ArrayList<Map> reservationList = dao.getReservationStatus();
			mv.addObject("roomList", roomList);
//			mv.addObject("reservationList", reservationList);
			mv.setViewName("reservation/calendar");
	    } catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
  		return mv;
	}
	
	@RequestMapping(value = "reservation/load-status", method = RequestMethod.GET) // 
	@ResponseBody
	public Map<String, Object> loadReservationStatus(@RequestParam("month")Integer month) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
        try {
			ArrayList<Map> reservationList = dao.getReservationStatus(month);
		
			resultMap.put("data", reservationList);
			
	    } catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
  		return resultMap;
	}
	
	@RequestMapping(value = "resertvationinsert", method = RequestMethod.POST)
	@ResponseBody
	public Map Resertvationinsert(ModelAndView mv, @RequestBody RoomVO rvo, HttpServletRequest request) throws Exception {
		Map resultMap = new HashMap();
		
		try {
			UserVO lvo=(UserVO)request.getSession().getAttribute("logvo");
			
			rvo.setUser_id(lvo.getId());
			System.out.println("$$$$$$$$$"+rvo);
			dao.Reservationinsert(rvo);

			resultMap.put("result", "success");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	@RequestMapping(value = "reservationinfo")
	public ModelAndView roomread(ModelAndView mv,RoomVO rvo,HttpServletRequest request) throws Exception {
		try {
			UserVO lvo=(UserVO)request.getSession().getAttribute("logvo");
			
			String user_id = lvo.getId();
			System.out.println("-=-=-=-="+user_id);
			
			ArrayList<Map> roomR=dao.getselectReservationRoomread(user_id);
			System.out.println("-=-=-=-=-"+roomR);
			mv.addObject("roomR", roomR);
			mv.setViewName("reservation/reservationRead");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		
		return mv;
	}
	@RequestMapping(value = "saveupdate", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> updateReservation(ModelAndView mv,@RequestBody RoomVO rvo) throws Exception {
		Map<String, String> resultMap = new HashMap<String, String>();
		
		try {
			System.out.println(rvo);
			dao.ReservationUpdate(rvo);
			
			resultMap.put("result", "success");
//			mv.addObject("result", "success");
	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		
		}
		
//		mv.setViewName("reservation/reservationUpdate");
		return resultMap;
		
	}
	@RequestMapping(value = "roomdetail")//예약 변경 이동
	public ModelAndView Uread(ModelAndView mv,@RequestParam("srid")String srid) throws Exception {
		Map room=(Map) dao.rdetail(Integer.parseInt(srid));
		
		ArrayList<RoomVO> roomList = dao.getRoom();
	
		mv.addObject("room", room);
		mv.addObject("roomList", roomList);
		
		mv.setViewName("reservation/reservationUpdate");
		return mv;

}
	@RequestMapping(value = "deleteReservation")//예약취소
	public ModelAndView deleteReservation(ModelAndView mv,@RequestParam("rid")int rid) throws Exception {
		dao.deleteReservation(rid);
		System.out.println("-=-=-="+rid);
		
		mv.setViewName("reservation/reservationUpdate");
		return mv;

}
}
