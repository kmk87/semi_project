package com.cm.flashmob.dao;
import static com.cm.common.sql.JDBCTemplate.close;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.cm.flashmob.vo.FlashmobApply;

public class FlashmobApplyDao {
	public int createApply(FlashmobApply fa,Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		try {
			String sql = "INSERT INTO `flashmob_application` (post_no,user_no,application_text) VALUES (?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, fa.getPost_no());
			pstmt.setInt(2, fa.getUser_no());
			pstmt.setString(3, fa.getApplication_text());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
}
