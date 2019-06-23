package business;


import java.util.ArrayList;
import java.util.Map;

import util.BoardVO;
import util.RoomVO;

public interface RoomDAO {
int rinsert(RoomVO vo);
public RoomVO rread (Integer rnum)throws Exception;
public ArrayList<RoomVO> getRoom() throws Exception;
public ArrayList<Map> getReservationStatus(int month) throws Exception;
public void Reservationinsert(RoomVO vo)throws Exception;
public void ReservationUpdate(RoomVO vo)throws Exception;
public ArrayList<Map>  getselectReservationRoomread(String user_id) throws Exception;
public Map rdetail(Integer rid)throws Exception;
public void deleteReservation(int rid)throws Exception;

}
