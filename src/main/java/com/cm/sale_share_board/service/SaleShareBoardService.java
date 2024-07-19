package com.cm.sale_share_board.service;

import static com.cm.common.sql.JDBCTemplate.close;
import static com.cm.common.sql.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.cm.sale_share_board.dao.SaleShareBoardDao;
import com.cm.sale_share_board.vo.SaleShareBoard;
import com.cm.sale_share_board.vo.SaleShareImage;
import com.cm.sale_share_board.vo.SaleShareList;



public class SaleShareBoardService {
	
	// 게시글 생성
	public int createBoard(SaleShareBoard ssb,SaleShareImage ssi) {
		Connection conn = getConnection();
		int result = new SaleShareBoardDao().createBoard(ssb,ssi,conn);
		close(conn);
		return result;
	}
	// 게시글 리스트
	public List<SaleShareList> selectSaleBoardList(SaleShareList option){
		Connection conn = getConnection();
		List<SaleShareList> list = new SaleShareBoardDao().selectSaleBoardList(option,conn);
		close(conn);
		return list;
		
	}
	// 게시글 갯수
	public int selectListCount(SaleShareList option) {
		Connection conn = getConnection();
		int result = new SaleShareBoardDao().selectSaleBoardCount(option,conn);
		close(conn);
		return result;
	}
	// 상세조회, 수정 정보 가져오기
	public SaleShareList selectBoard(int postNo) {
		Connection conn = getConnection();
		SaleShareList ssl = new SaleShareBoardDao().selectBoard(postNo,conn);
		close(conn);
		return ssl;
	}
	// 게시글 수정
	public int saleEdit(int postNo, SaleShareBoard ssb, SaleShareImage ssi) {
		Connection conn = getConnection();
		int result = new SaleShareBoardDao().editSale(postNo,ssb,ssi,conn);
		close(conn);
		return result;
	}
	// 게시글 삭제
	public int saleDelete(int postNo) {
		Connection conn = getConnection();
		int result = new SaleShareBoardDao().deleteSale(postNo,conn);
		close(conn);
		return result;
	}
	// 카테고리 - 나눔
	public List<SaleShareList> selectShare(SaleShareList option) {
		Connection conn = getConnection();
		List<SaleShareList> list = new SaleShareBoardDao().selectShare(option,conn);
		close(conn);
		return list;
	}
	
	// 카테고리 - 판매
	public List<SaleShareList> selectSale(SaleShareList option){
		Connection conn = getConnection();
		List<SaleShareList> list = new SaleShareBoardDao().selectSale(option,conn);
		close(conn);
		return list;
	}
}

