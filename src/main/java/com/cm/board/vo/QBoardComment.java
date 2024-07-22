package com.cm.board.vo;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class QBoardComment {
	private int commentNo;
	private int userNo;
	private int postNo;
	private String commentText;
	private LocalDateTime commentRegDate;
	private LocalDateTime commentModDate;
	public QBoardComment() {
		super();
	}
	public QBoardComment(int commentNo, int userNo, int postNo, String commentText, LocalDateTime commentRegDate,
			LocalDateTime commentModDate) {
		super();
		this.commentNo = commentNo;
		this.userNo = userNo;
		this.postNo = postNo;
		this.commentText = commentText;
		this.commentRegDate = commentRegDate;
		this.commentModDate = commentModDate;
	}
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getPostNo() {
		return postNo;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	public String getCommentText() {
		return commentText;
	}
	public void setCommentText(String commentText) {
		this.commentText = commentText;
	}
	public LocalDateTime getCommentRegDate() {
		return commentRegDate;
	}
	public void setCommentRegDate(LocalDateTime commentRegDate) {
		this.commentRegDate = commentRegDate;
	}
	public LocalDateTime getCommentModDate() {
		return commentModDate;
	}
	public void setCommentModDate(LocalDateTime commentModDate) {
		this.commentModDate = commentModDate;
	}
	
	
}
