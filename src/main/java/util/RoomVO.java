package util;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

public class RoomVO implements Serializable{
	private int rnum;
	private String rname;
	private String rimg;
	private MultipartFile rimgf;
	private String rpersonnel;
	private String rsize;
	private String rfixtures;
	private String rprice;
	private String user_id;
	private String start_date;
	private String end_date;
	private int rid;
	@Override
	public String toString() {
		return "RoomVO [rnum=" + rnum + ", rname=" + rname + ", rimg=" + rimg + ", rimgf=" + rimgf + ", rpersonnel="
				+ rpersonnel + ", rsize=" + rsize + ", rfixtures=" + rfixtures + ", rprice=" + rprice + ", user_id="
				+ user_id + ", start_date=" + start_date + ", end_date=" + end_date + ", rid=" + rid + ", p_count="
				+ p_count + "]";
	}

	public int getRid() {
		return rid;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}

	private int p_count;

	public int getP_count() {
		return p_count;
	}

	public void setP_count(int p_count) {
		this.p_count = p_count;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	public String getRprice() {
		return rprice;
	}

	public void setRprice(String rfrice) {
		this.rprice = rfrice;
	}

	public MultipartFile getRimgf() {
		return rimgf;
	}

	public void setRimgf(MultipartFile rimgf) {
		this.rimgf = rimgf;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public String getRname() {
		return rname;
	}

	public void setRname(String rname) {
		this.rname = rname;
	}

	public String getRimg() {
		return rimg;
	}

	public void setRimg(String rimg) {
		this.rimg = rimg;
	}

	public String getRpersonnel() {
		return rpersonnel;
	}

	public void setRpersonnel(String rpersonnel) {
		this.rpersonnel = rpersonnel;
	}

	public String getRsize() {
		return rsize;
	}

	public void setRsize(String rsize) {
		this.rsize = rsize;
	}

	public String getRfixtures() {
		return rfixtures;
	}

	public void setRfixtures(String rfixtures) {
		this.rfixtures = rfixtures;
	}
}
