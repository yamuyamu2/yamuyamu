package business;

import java.util.ArrayList;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import util.RoomVO;
@Service("room")
public class RoomDAOImp implements RoomDAO {
	@Inject
	private SqlSession dao;
	private static final String RM="Room.mapper.";
	@Override
	public int rinsert(RoomVO vo) {
	return	dao.insert(RM+"rinsert", vo);
	}
	@Override
	public RoomVO rread(Integer rnum) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectOne(RM+"rread",rnum);
	}
	@Override
	public ArrayList<RoomVO> getRoom() throws Exception {
		// TODO Auto-generated method stub
		return (ArrayList)dao.selectList(RM+"selectRoom");
	}
	@Override
	public ArrayList<Map> getReservationStatus(int month) throws Exception {
		// TODO Auto-generated method stub
		return (ArrayList)dao.selectList(RM+"selectReservationStatus", month);
	}
	@Override
	public void Reservationinsert(RoomVO vo) throws Exception {
		System.out.println("@@@@@@@@@@@@@"+vo);
		  dao.insert(RM+"insertReservation",vo);
		
	}
	@Override
	public void ReservationUpdate(RoomVO vo) throws Exception {
		dao.update(RM+"resrvationupdate",vo);
		
	}
	@Override
	public ArrayList<Map>  getselectReservationRoomread(String user_id) throws Exception {
		// TODO Auto-generated method stub
		return (ArrayList)dao.selectList(RM+"selectReservationRoomread",user_id);
	}
	@Override
	public Map rdetail(Integer rid) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectOne(RM+"selectdetail",rid);
	}
	@Override
	public void deleteReservation(int rid) throws Exception {
		 dao.delete(RM+"deleteReservation",rid);
		
	}

}
