package business;

import util.UserVO;

public interface UserDAO  {
	int insert(UserVO vo);//회원가입VO
	UserVO Ulogin(UserVO vo);//로그인VO
	int withdrawal(UserVO vo);
}
