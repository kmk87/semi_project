package com.cm.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.cm.board.vo.LocationGu;
import static com.cm.common.sql.JDBCTemplate.*;

public class LocationGuDao {
	
	public List<LocationGu> getLocationGuList(Connection conn) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<LocationGu> list = new ArrayList<>();
        
        try {
            String sql = "SELECT local_gu_no, local_gu_name FROM location_gu";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
                LocationGu locationGu = new LocationGu();
                locationGu.setLocalGuNo(rs.getInt("local_gu_no"));
                locationGu.setLocalGuName(rs.getString("local_gu_name"));
                list.add(locationGu);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs);
            close(pstmt);
        }
        
        return list;
    }
	
    public List<LocationGu> selectAll(Connection conn) {
        List<LocationGu> locationGuList = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT local_gu_no, local_gu_name FROM location_gu";
        
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
                LocationGu gu = new LocationGu();
                gu.setLocalGuNo(rs.getInt("local_gu_no"));
                gu.setLocalGuName(rs.getString("local_gu_name"));
                locationGuList.add(gu);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs);
            close(pstmt);
        }
        
        return locationGuList;
    }
}
