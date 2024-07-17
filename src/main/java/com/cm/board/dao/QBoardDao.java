package com.cm.board.dao;

import static com.cm.common.sql.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.cm.board.vo.QBoard;

public class QBoardDao {

    public int createBoard(QBoard qb, Connection conn) {
        PreparedStatement pstmt = null;
        int result = 0;
        try {
            String sql = "INSERT INTO question_post (board_type_id, local_gu_no, user_no, post_title, post_text) VALUES ('?','?','?','?','?')";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, qb.getBoardTypeId());
            pstmt.setInt(2, qb.getLocalGuNo());
            pstmt.setInt(3, qb.getUserNo());
            pstmt.setString(4, qb.getPostTitle());
            pstmt.setString(5, qb.getPostText());

            result = pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
        return result;
    }

    public int selectBoardCount(QBoard qb, Connection conn) {
        int result = 0;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT COUNT(*) AS cnt FROM question_post";
            if (qb.getPostTitle() != null && !qb.getPostTitle().trim().isEmpty()) {
                sql += " WHERE post_title LIKE CONCAT('%',"+qb.getPostTitle()+" ,'%')";
            }
            pstmt = conn.prepareStatement(sql);
            if (qb.getPostTitle() != null && !qb.getPostTitle().trim().isEmpty()) {
                pstmt.setString(1, qb.getPostTitle());
            }
            rs = pstmt.executeQuery();
            if (rs.next()) {
                result = rs.getInt("cnt");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs);
            close(pstmt);
        }
        return result;
    }

    public List<QBoard> selectBoardList(QBoard qb, Connection conn) {
        List<QBoard> list = new ArrayList<QBoard>();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT * FROM question_post";
            if (qb.getPostTitle() != null) {
                sql += " WHERE post_title LIKE CONCAT('%','"+qb.getPostTitle()+"', '%')";
            }
            sql += " LIMIT "+qb.getLimitPageNo()+", "+qb.getNumPerPage();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while(rs.next()) {
            	QBoard resultVo = new QBoard(rs.getInt("post_no"),
            			rs.getInt("board_type_id"),
            			rs.getInt("local_gu_no"),
            			rs.getInt("user_no"),
            			rs.getString("post_title"),
            			rs.getString("post_text"),
            			rs.getTimestamp("post_reg_date").toLocalDateTime(),
            			rs.getTimestamp("post_mod_date").toLocalDateTime(),
            			rs.getString("post_release_yn"));
            	list.add(resultVo);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs);
            close(pstmt);
        }
        return list;
    }

    public int updateBoard(QBoard qb, Connection conn) {
        PreparedStatement pstmt = null;
        int result = 0;
        try {
            String sql = "UPDATE `question_post` SET board_type_id = ?, local_gu_no = ?, user_no = ?, post_title = ?, post_text = ?, post_release_yn = ? WHERE post_no = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, qb.getBoardTypeId());
            pstmt.setInt(2, qb.getLocalGuNo());
            pstmt.setInt(3, qb.getUserNo());
            pstmt.setString(4, qb.getPostTitle());
            pstmt.setString(5, qb.getPostText());
            pstmt.setString(6, qb.getPostReleaseYn());
            pstmt.setInt(7, qb.getPostNo());

            result = pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
        return result;
    }
}
