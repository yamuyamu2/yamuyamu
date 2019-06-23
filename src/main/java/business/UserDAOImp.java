package business;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import util.UserVO;
@Service("User")

public class UserDAOImp implements UserDAO {
	@Inject
	private SqlSession dao;
	private static final String US="User.mapper.";
	@Override
	public int insert(UserVO vo) {
		return dao.insert(US+"insert", vo);
	}

	@Override
	public UserVO Ulogin(UserVO vo) {
		return dao.selectOne(US+"Ulogin", vo);
		
	}

	@Override
	public int withdrawal(UserVO vo) {
		// TODO Auto-generated method stub
		return dao.delete(US+"withdrawal",vo);
	}

}
