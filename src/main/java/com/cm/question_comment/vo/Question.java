package com.cm.question_comment.vo;

//import java.security.Timestamp;
import java.time.LocalDateTime;

public class Question {
	private int comment_no;
	private int question_comment_user_no;
	private int question_post_no;
	private String comment_text;
	private LocalDateTime comment_reg_date;
	private LocalDateTime comment_mod_date;
	
	public Question() {
		super();
	}

	public Question(int comment_no, int question_comment_user_no, int question_post_no, String comment_text,
			LocalDateTime comment_reg_date, LocalDateTime comment_mod_date) {
		super();
		this.comment_no = comment_no;
		this.question_comment_user_no = question_comment_user_no;
		this.question_post_no = question_post_no;
		this.comment_text = comment_text;
		this.comment_reg_date = comment_reg_date;
		this.comment_mod_date = comment_mod_date;
	}

	public int getComment_no() {
		return comment_no;
	}

	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}

	public int getQuestion_comment_user_no() {
		return question_comment_user_no;
	}

	public void setQuestion_comment_user_no(int question_comment_user_no) {
		this.question_comment_user_no = question_comment_user_no;
	}

	public int getQuestion_post_no() {
		return question_post_no;
	}

	public void setQuestion_post_no(int question_post_no) {
		this.question_post_no = question_post_no;
	}

	public String getComment_text() {
		return comment_text;
	}

	public void setComment_text(String comment_text) {
		this.comment_text = comment_text;
	}

	public LocalDateTime getComment_reg_date() {
		return comment_reg_date;
	}

	public void setComment_reg_date(LocalDateTime comment_reg_date) {
		this.comment_reg_date = comment_reg_date;
	}

	public LocalDateTime getComment_mod_date() {
		return comment_mod_date;
	}

	public void setComment_mod_date(LocalDateTime comment_mod_date) {
		this.comment_mod_date = comment_mod_date;
	}
	
	
}
