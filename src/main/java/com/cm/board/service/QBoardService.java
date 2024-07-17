package com.cm.board.service;

import static com.cm.common.sql.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.cm.board.dao.QBoardDao;
import com.cm.board.vo.QBoard;

public class QBoardService {
	
	public int createBoard(QBoard qb) {
		Connection conn = getConnection();
		int result = new QBoardDao().createBoard(qb,conn);
		close(conn);
		return result;
	}
	
	public int selectBoardCount(QBoard qb) {
		Connection conn = getConnection();
		int result = new QBoardDao().selectBoardCount(qb,conn);
		close(conn);
		return result;
	}
	
	
	public List<QBoard> selectBoardList(QBoard qb) {
		Connection conn = getConnection();
		List<QBoard> list = new QBoardDao().selectBoardList(qb,conn);
		close(conn);
		return list;
	}
	
    public int updateBoard(QBoard qb) {
        Connection conn = getConnection();
        int result = new QBoardDao().updateBoard(qb, conn);
        if (result > 0) {
            commit(conn);
        } else {
            rollback(conn);
        }
        close(conn);
        return result;
    }
    
//    public int detailBoard(QBoard qb) {
//    	Connection conn = getConnection();
//    	int result = new QBoardDao().detailBoard(qb,conn);
//    	close(conn);
//    	return result;
//    }
}
