package com.cm.sale_share_board.vo;

import java.time.LocalDateTime;

import com.cm.common.*;

public class SaleShareBoard {
	private int post_no;
	private int board_type_id;
	private int local_gu_no;
	private String post_title;
	private String post_text;
	private int prod_price;
	private int cate_code;
	private int user_no;
	private int deal_status;
	private LocalDateTime prod_reg_date;
	private LocalDateTime prod_mod_date;
	
	public SaleShareBoard() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getPost_no() {
		return post_no;
	}

	public void setPost_no(int post_no) {
		this.post_no = post_no;
	}

	public int getBoard_type_id() {
		return board_type_id;
	}

	public void setBoard_type_id(int board_type_id) {
		this.board_type_id = board_type_id;
	}

	public int getLocal_gu_no() {
		return local_gu_no;
	}

	public void setLocal_gu_no(int local_gu_no) {
		this.local_gu_no = local_gu_no;
	}

	public String getPost_title() {
		return post_title;
	}

	public void setPost_title(String post_title) {
		this.post_title = post_title;
	}

	public String getPost_text() {
		return post_text;
	}

	public void setPost_text(String post_text) {
		this.post_text = post_text;
	}

	public int getProd_price() {
		return prod_price;
	}

	public void setProd_price(int prod_price) {
		this.prod_price = prod_price;
	}

	public int getCate_code() {
		return cate_code;
	}

	public void setCate_code(int cate_code) {
		this.cate_code = cate_code;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public LocalDateTime getProd_reg_date() {
		return prod_reg_date;
	}

	public void setProd_reg_date(LocalDateTime prod_reg_date) {
		this.prod_reg_date = prod_reg_date;
	}

	public LocalDateTime getProd_mod_date() {
		return prod_mod_date;
	}

	public void setProd_mod_date(LocalDateTime prod_mod_date) {
		this.prod_mod_date = prod_mod_date;
	}

	public int getDeal_status() {
		return deal_status;
	}

	public void setDeal_status(int deal_status) {
		this.deal_status = deal_status;
	}

	public SaleShareBoard(int post_no, int board_type_id, int local_gu_no, String post_title, String post_text,
			int prod_price, int cate_code, int user_no, int deal_status, LocalDateTime prod_reg_date,
			LocalDateTime prod_mod_date) {
		super();
		this.post_no = post_no;
		this.board_type_id = board_type_id;
		this.local_gu_no = local_gu_no;
		this.post_title = post_title;
		this.post_text = post_text;
		this.prod_price = prod_price;
		this.cate_code = cate_code;
		this.user_no = user_no;
		this.deal_status = deal_status;
		this.prod_reg_date = prod_reg_date;
		this.prod_mod_date = prod_mod_date;
	}

	
	
	
}

