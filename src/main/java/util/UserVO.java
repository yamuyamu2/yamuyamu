package util;

public class UserVO {
private String name;
private String id;
private String password;
private String phonNum;
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public String getPhonNum() {
	return phonNum;
}
public void setPhonNum(String phonNum) {
	this.phonNum = phonNum;
}
@Override
public String toString() {
	return "UserVO [name=" + name + ", id=" + id + ", password=" + password + ", phonNum=" + phonNum + "]";
}

}
