package com.cm.sale_share_board.vo;

public class SaleShareLike {
	
	private int like_no;
	private int like_user_no;
	private int like_status;
	public int getLike_no() {
		return like_no;
	}
	public void setLike_no(int like_no) {
		this.like_no = like_no;
	}
	public int getLike_user_no() {
		return like_user_no;
	}
	public void setLike_user_no(int like_user_no) {
		this.like_user_no = like_user_no;
	}
	public int getLike_status() {
		return like_status;
	}
	public void setLike_status(int like_status) {
		this.like_status = like_status;
	}
	public SaleShareLike() {
		super();
	}
	public SaleShareLike(int like_no, int like_user_no, int like_status) {
		super();
		this.like_no = like_no;
		this.like_user_no = like_user_no;
		this.like_status = like_status;
	}
	
	
}
