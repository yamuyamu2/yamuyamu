package business;

import java.util.List;

import util.BoardVO;
import util.PageVO;


public interface BoardDAO {
public void insert(BoardVO bvo)throws Exception;
public BoardVO read (Integer bid)throws Exception;
public void update(BoardVO bvo)throws Exception;
public void delete(Integer bid)throws Exception;
public List<BoardVO> list()throws Exception;
public void hitup(int bid);
public int totaldata()throws Exception;
public List<BoardVO> listCriteria(PageVO vo)throws Exception;

}
