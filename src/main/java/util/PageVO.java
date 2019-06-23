package util;

public class PageVO {
	private int totaldata;//총데이터갯수 
	private int startpage;//페이지의 시작페이지
    private int endpage;//페이지의 끝번호 
    private int page=1;//보고있는페이지 
    private int numPerPage=10;// 글의갯수 
    private int spage; 
    private boolean prev;// 이전버튼 나타태는 boolean값
	private boolean next;//다음버튼 나타내는 boolean값
    private int displayPageNum=5;//보여주는 페이지
    
    
    private void pageingData() {
    	endpage = (int)(Math.ceil (page/ (double)displayPageNum)*displayPageNum);
		startpage = (endpage - displayPageNum) + 1;
		
		int finalEndpage = (int) (Math.ceil(totaldata / (double)numPerPage));
		if (endpage > finalEndpage) {
			endpage = finalEndpage;
		}
		prev=startpage==1?false:true;
		next=endpage*numPerPage>=totaldata?false:true;
	}//getpageingData
    
   
	public int getTotaldata() {
		return totaldata;
	}


	public void setTotaldata(int totaldata) {
		this.totaldata = totaldata;
		pageingData();
	}


	public int getStartpage() {
		return startpage;
	}
	public void setStartpage(int startpage) {
		this.startpage = startpage;
	}
	public int getEndpage() {
		return endpage;
	}
	public void setEndpage(int endpage) {
		this.endpage = endpage;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		if(page<=0) {
			this.page=1;
			return;
		}
		this.page=page;
	}
	
	public int getNumPerPage() {
		return numPerPage;
	}
	public void setNumPerPage(int numPerPage) {
		this.numPerPage = numPerPage;
	}
	public int getSpage() {
		return (this.page-1)*numPerPage;
	}
	public void setSpage(int spage) {
		this.spage = spage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getDisplayPageNum() {
		return displayPageNum;
	}
	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}
	
}
