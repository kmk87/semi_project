package com.cm.board.vo;

import java.time.LocalDateTime;

import com.cm.common.Paging;

public class QBoard extends Paging{
	private int postNo;
	private int boardTypeId;
	private int localGuNo;
	private int userNo;
	private String postTitle;
	private String postText;
	private LocalDateTime postRegDate;
	private LocalDateTime postModDate;
	private String postReleaseYn;
	private int likeCount;
	
	public QBoard() {
		super();
	}

	public QBoard(int postNo, int boardTypeId, int localGuNo, int userNo, String postTitle, String postText,
			LocalDateTime postRegDate, LocalDateTime postModDate, String postReleaseYn, int likeCount) {
		super();
		this.postNo = postNo;
		this.boardTypeId = boardTypeId;
		this.localGuNo = localGuNo;
		this.userNo = userNo;
		this.postTitle = postTitle;
		this.postText = postText;
		this.postRegDate = postRegDate;
		this.postModDate = postModDate;
		this.postReleaseYn = postReleaseYn;
		this.likeCount = likeCount;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public int getBoardTypeId() {
		return boardTypeId;
	}

	public void setBoardTypeId(int boardTypeId) {
		this.boardTypeId = boardTypeId;
	}

	public int getLocalGuNo() {
		return localGuNo;
	}

	public void setLocalGuNo(int localGuNo) {
		this.localGuNo = localGuNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getPostTitle() {
		return postTitle;
	}

	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}

	public String getPostText() {
		return postText;
	}

	public void setPostText(String postText) {
		this.postText = postText;
	}

	public LocalDateTime getPostRegDate() {
		return postRegDate;
	}

	public void setPostRegDate(LocalDateTime postRegDate) {
		this.postRegDate = postRegDate;
	}

	public LocalDateTime getPostModDate() {
		return postModDate;
	}

	public void setPostModDate(LocalDateTime postModDate) {
		this.postModDate = postModDate;
	}

	public String getPostReleaseYn() {
		return postReleaseYn;
	}

	public void setPostReleaseYn(String postReleaseYn) {
		this.postReleaseYn = postReleaseYn;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	
	
	
	
}
