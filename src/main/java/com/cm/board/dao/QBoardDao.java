package com.cm.board.dao;

import static com.cm.common.sql.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.cm.board.vo.LocationGu;
import com.cm.board.vo.QBoard;
import com.cm.user.vo.User;

public class QBoardDao {

    public int createBoard(QBoard qb, Connection conn) {
        PreparedStatement pstmt = null;
        int result = 0;
        try {
            String sql = "INSERT INTO question_post (board_type_id, local_gu_no, user_no, post_title, post_text, image_ori_name, image_new_name) VALUES (?,?,?,?,?,?,?)";
            pstmt = conn.prepareStatement(sql);
            System.out.println("Binding values: post_title=" + qb.getPostTitle() +"localgu"+qb.getLocalGuNo()+ " post_text=" + qb.getPostText() + " 이미지1=" + qb.getImageOriName() + " 이미지2=" + qb.getImageNewName());
            
            pstmt.setInt(1, 1);
            pstmt.setInt(2, qb.getLocalGuNo());
            pstmt.setInt(3, qb.getUserNo());
            pstmt.setString(4, qb.getPostTitle());
            pstmt.setString(5, qb.getPostText());
            pstmt.setString(6, qb.getImageOriName());
            pstmt.setString(7, qb.getImageNewName());

            result = pstmt.executeUpdate();

            System.out.println("다오=" + result);
        } catch (Exception e) {
            System.out.println("발생여부");
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
        return result;
    }
    
    public int deleteBoard(int postNo, Connection conn) {
        PreparedStatement pstmt = null;
        int result = 0;
        try {
            String sql = "DELETE FROM question_post WHERE post_no = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, postNo);
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
        boolean hasCondition = false;
        
        try {
            String sql = "SELECT COUNT(*) AS cnt FROM question_post qp LEFT JOIN user u ON qp.user_no = u.user_no";
            
            if (qb.getPostTitle() != null && !qb.getPostTitle().isEmpty()) {
                sql += " WHERE qp.post_title LIKE CONCAT('%', ?, '%')";
                hasCondition = true;
            }
            
            if (qb.getUser() != null && qb.getUser().getUser_nick() != null && !qb.getUser().getUser_nick().isEmpty()) {
                if (hasCondition) {
                    sql += " AND u.user_nick LIKE CONCAT('%', ?, '%')";
                } else {
                    sql += " WHERE u.user_nick LIKE CONCAT('%', ?, '%')";
                    hasCondition = true;
                }
            }
            
            pstmt = conn.prepareStatement(sql);
            int paramIndex = 1;
            
            if (qb.getPostTitle() != null && !qb.getPostTitle().isEmpty()) {
                pstmt.setString(paramIndex++, qb.getPostTitle());
            }
            
            if (qb.getUser() != null && qb.getUser().getUser_nick() != null && !qb.getUser().getUser_nick().isEmpty()) {
                pstmt.setString(paramIndex++, qb.getUser().getUser_nick());
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

    public List<QBoard> selectBoardList(QBoard qb, String sort, int nowPage, int numPerPage, Connection conn) {
        List<QBoard> list = new ArrayList<QBoard>();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT qp.*, u.user_nick, COUNT(DISTINCT ql.like_no) AS like_count " +
                         "FROM question_post qp " +
                         "LEFT JOIN question_like ql ON qp.post_no = ql.post_no " +
                         "LEFT JOIN user u ON qp.user_no = u.user_no ";
                         
            // 검색 조건 추가
            boolean hasCondition = false;

            // 제목 검색 조건 추가
            if (qb.getPostTitle() != null && !qb.getPostTitle().isEmpty()) {
                sql += " WHERE qp.post_title LIKE CONCAT('%', ?, '%')";
                hasCondition = true;
            }

            // 작성자 검색 조건 추가
            if (qb.getUser() != null && qb.getUser().getUser_nick() != null && !qb.getUser().getUser_nick().isEmpty()) {
                if (hasCondition) {
                    sql += " AND u.user_nick LIKE CONCAT('%', ?, '%')";
                } else {
                    sql += " WHERE u.user_nick LIKE CONCAT('%', ?, '%')";
                    hasCondition = true;
                }
            }

            sql += " GROUP BY qp.post_no, qp.board_type_id, qp.local_gu_no, qp.user_no, qp.post_title, " +
                   "qp.post_text, qp.post_reg_date, qp.post_mod_date, qp.post_release_yn, " +
                   "qp.image_ori_name, qp.image_new_name, qp.question_post_view, u.user_nick ";

            // 정렬 기준 추가
            switch (sort) {
                case "latest":
                    sql += " ORDER BY qp.post_reg_date DESC ";
                    break;
                case "views":
                    sql += " ORDER BY qp.question_post_view DESC ";
                    break;
                case "likes":
                    sql += " ORDER BY like_count DESC ";
                    break;
                default:
                    sql += " ORDER BY qp.post_reg_date DESC ";
                    break;
            }

            sql += " LIMIT ?, ?";

            pstmt = conn.prepareStatement(sql);

            int paramIndex = 1;
            if (qb.getPostTitle() != null && !qb.getPostTitle().isEmpty()) {
                pstmt.setString(paramIndex++, qb.getPostTitle());
            }
            if (qb.getUser() != null && qb.getUser().getUser_nick() != null && !qb.getUser().getUser_nick().isEmpty()) {
                pstmt.setString(paramIndex++, qb.getUser().getUser_nick());
            }

            pstmt.setInt(paramIndex++, (nowPage - 1) * numPerPage);
            pstmt.setInt(paramIndex, numPerPage);

            rs = pstmt.executeQuery();
            while (rs.next()) {
                QBoard resultVo = new QBoard(rs.getInt("post_no"),
                                             rs.getInt("board_type_id"),
                                             rs.getInt("local_gu_no"),
                                             rs.getInt("user_no"),
                                             rs.getString("post_title"),
                                             rs.getString("post_text"),
                                             rs.getTimestamp("post_reg_date").toLocalDateTime(),
                                             rs.getTimestamp("post_mod_date").toLocalDateTime(),
                                             rs.getString("post_release_yn"),
                                             rs.getInt("like_count"),
                                             rs.getString("image_ori_name"),
                                             rs.getString("image_new_name"),
                                             rs.getInt("question_post_view"));
                                             
                User user = new User();
                user.setUser_nick(rs.getString("user_nick"));
                resultVo.setUser(user);

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



    public QBoard getQBoard(int postNo, Connection conn) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        QBoard result = null;
        try {
            String sqlview = "UPDATE question_post SET question_post_view = question_post_view + 1 WHERE post_no = ?";
            pstmt = conn.prepareStatement(sqlview);
            pstmt.setInt(1, postNo);
            int i = pstmt.executeUpdate();
            String sql = "SELECT p.*, COUNT(l.post_no) AS like_count "
                    + "FROM question_post p "
                    + "LEFT JOIN question_like l ON p.post_no = l.post_no "
                    + "WHERE p.post_no = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, postNo);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                result = new QBoard(rs.getInt("post_no"),
                        rs.getInt("board_type_id"),
                        rs.getInt("local_gu_no"),
                        rs.getInt("user_no"),
                        rs.getString("post_title"),
                        rs.getString("post_text"),
                        rs.getTimestamp("post_reg_date").toLocalDateTime(),
                        rs.getTimestamp("post_mod_date").toLocalDateTime(),
                        rs.getString("post_release_yn"),
                        rs.getInt("like_count"),
                        rs.getString("image_ori_name"),
                        rs.getString("image_new_name"),
                        rs.getInt("question_post_view"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs);
            close(pstmt);
        }
        return result;
    }

    public int updateBoard(QBoard qb, Connection conn) {
        PreparedStatement pstmt = null;
        int result = 0;
        try {
            String sql = "UPDATE question_post SET post_title = ?, post_text = ?, post_release_yn = ?, image_ori_name = ?, image_new_name = ? WHERE post_no = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, qb.getPostTitle());
            pstmt.setString(2, qb.getPostText());
            pstmt.setString(3, qb.getPostReleaseYn());
            pstmt.setString(4, qb.getImageOriName());
            pstmt.setString(5, qb.getImageNewName());
            pstmt.setInt(6, qb.getPostNo());
            System.out.println("Executing query: " + pstmt);
            System.out.println("Post Title: " + qb.getPostTitle());
            System.out.println("Post Text: " + qb.getPostText());
            System.out.println("Post Release Yn: " + qb.getPostReleaseYn());
            System.out.println("Image Ori Name: " + qb.getImageOriName());
            System.out.println("Image New Name: " + qb.getImageNewName());
            System.out.println("Post No: " + qb.getPostNo());
            result = pstmt.executeUpdate();
            System.out.println("Update result1: " + result);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
        return result;
    }
    
    public List<LocationGu> getLocationGuList(Connection conn) {
        List<LocationGu> list = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT local_gu_no, local_gu_name FROM location_gu";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                LocationGu gu = new LocationGu(rs.getInt("local_gu_no"), rs.getString("local_gu_name"));
                list.add(gu);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs);
            close(pstmt);
        }
        return list;
    }
    
}
