package com.cm.flashmob.service;
import static com.cm.common.sql.JDBCTemplate.close;
import static com.cm.common.sql.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.cm.flashmob.dao.FlashmobApplyDao;
import com.cm.flashmob.vo.FlashmobApply;

public class FlashmobApplyService {
	public int createApply(FlashmobApply fa) {
		Connection conn = getConnection();
		int result = new FlashmobApplyDao().createApply(fa,conn);
		close(conn);
		return result;
	}
}
