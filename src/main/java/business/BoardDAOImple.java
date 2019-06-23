package business;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import util.BoardVO;
import util.PageVO;


@Service("board")
public class BoardDAOImple implements BoardDAO {
  @Inject
  private SqlSession dao;
  private static final String CB="board.mapper.";
	@Override
	public void insert(BoardVO bvo) throws Exception {
		dao.insert(CB+"insert",bvo);

	}

	@Override
	public BoardVO read(Integer bid) throws Exception{
		// TODO Auto-generated method stub
		return dao.selectOne(CB+"read",bid);
	}

	@Override
	public void update(BoardVO bvo) throws Exception {
		dao.update(CB+"update",bvo);

	}

	@Override
	public void delete(Integer bid) throws Exception {
		// TODO Auto-generated method stub
    dao.delete(CB+"delete",bid);
	}

	@Override
	public List<BoardVO> list() throws Exception {
		// TODO Auto-generated method stub
		return dao.selectList(CB+"list");
	}

	@Override
	public void hitup(int bid) {
	  dao.update(CB+"hit",bid);
		
	}

	@Override
	public int totaldata() throws Exception {
		
		return dao.selectOne(CB+"totaldata");
	}

	@Override
	public List<BoardVO> listCriteria(PageVO vo) throws Exception {
		return dao.selectList(CB+"listcriteria",vo);
	}

	



}
