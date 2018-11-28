package jwcommand;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBOpen;

public class CommentDAO {
	public int getSeq() {
		int result = 1;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		// 시퀀스 값을 가져온다. (DUAL :  시퀀스 값을 가져오기 위한 임시 테이블)
		sql.append(" SELECT COMMENT_SEQ.NEXTVAL FROM DUAL ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(rs, pstmt, con);
		}
		return result;
	}
	
	public boolean insertComment(CommentDTO dto) {
		boolean flag = false;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" INSERT INTO jwcomment ");
		sql.append(" (num, bno, id, cdate, parent, content) ");
		sql.append(" value(?, ?, ?, sysdate, ?, ?) ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			
			pstmt.setInt(1, dto.getNum());
			pstmt.setInt(2, dto.getBno());
			pstmt.setString(3, dto.getID());
			pstmt.setInt(4, dto.getParent());
			pstmt.setString(5, dto.getContent());
			
			int cnt = pstmt.executeUpdate();
			
			if(cnt>0) {
				flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(pstmt, con);
		}
		return flag;
	}
	
	public List<CommentDTO> list(int bno){
		List<CommentDTO> list = new ArrayList<CommentDTO>();
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT LEVEL,  ");
		sql.append("  ");
		sql.append("  ");
		sql.append("  ");
		sql.append("  ");
		
		return list;
	}
}
