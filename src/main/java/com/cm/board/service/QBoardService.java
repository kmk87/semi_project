package com.cm.board.service;

import static com.cm.common.sql.JDBCTemplate.close;
import static com.cm.common.sql.JDBCTemplate.commit;
import static com.cm.common.sql.JDBCTemplate.getConnection;
import static com.cm.common.sql.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.cm.board.dao.QBoardDao;
import com.cm.board.vo.LocationGu;
import com.cm.board.vo.QBoard;

public class QBoardService {
	
    public int createBoard(QBoard qb) {
        Connection conn = getConnection();
        int result = new QBoardDao().createBoard(qb, conn);
        if (result > 0) {
            commit(conn);
        } else {
            rollback(conn);
        }
        close(conn);
        return result;
    }
	
    public List<LocationGu> getLocationGuList() {
        Connection conn = getConnection();
        List<LocationGu> list = new QBoardDao().getLocationGuList(conn);
        close(conn);
        return list;
    }
	
    public int selectBoardCount(QBoard qb) {
        Connection conn = getConnection();
        int result = new QBoardDao().selectBoardCount(qb, conn);
        close(conn);
        return result;
    }
	
	
    public List<QBoard> getQBoardList(String sort, int nowPage, int numPerPage, QBoard qb) {
        Connection conn = getConnection();
        List<QBoard> list = new QBoardDao().selectBoardList(qb, sort, nowPage, numPerPage, conn);
        close(conn);
        return list;
    }

	
	public QBoard getQBoard(int postNo) {
		Connection conn = getConnection();
		QBoard result = new QBoardDao().getQBoard(postNo, conn);
		System.out.println("서비스"+postNo);
		close(conn);
		return result;
	}
	
    public int getQBoardCount() {
        Connection conn = getConnection();
        int result = new QBoardDao().selectBoardCount(new QBoard(), conn);
        close(conn);
        return result;
    }
	
    public int updateBoard(QBoard qb) {
        Connection conn = getConnection();
        int result = new QBoardDao().updateBoard(qb, conn);
        System.out.println("Transaction started");
        System.out.println("update"+result);
        System.out.println("servie"+qb);
        if (result > 0) {
            commit(conn);
            System.out.println("Transaction committed");
        } else {
            rollback(conn);
            System.out.println("Transaction rolled back");
        }
        close(conn);
        return result;
    }


    public boolean deleteBoard(int postNo) {
        Connection conn = getConnection();
        int result = new QBoardDao().deleteBoard(postNo, conn);
        boolean isDeleted = result > 0; // 삭제된 행이 1개 이상이면 true
        if (isDeleted) {
            commit(conn);
        } else {
            rollback(conn);
        }
        close(conn);
        return isDeleted;
    }
    
}
