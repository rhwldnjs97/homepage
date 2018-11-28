package jwreply;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import db.DBClose;
import db.DBOpen;

public class ReplyDAO {
	
	public int total(int bbsno) {
int total = 0;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();										
		sql.append(" select count(*) from jwreply where bbsno=?");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsno);
			
			rs = pstmt.executeQuery();
			rs.next();
			total = rs.getInt(1);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(rs, pstmt, con);
		}
		
		return total;
		
	}
	
	public List<ReplyDTO> list(Map map){

		List<ReplyDTO> list = new ArrayList<ReplyDTO>();

		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int bbsno = (Integer)map.get("bbsno");
		int sno = (Integer)map.get("sno");
		int eno = (Integer)map.get("eno");
		
		
		StringBuffer sql = new StringBuffer();
		/*to_char(wdate,'yyyy-mm-dd') as */			
		 
		sql.append(" select rnum, content, to_char(regdate,'yyyy-mm-dd') regdate, id, bbsno, r ");			// 외출
		sql.append(" from( ");
		sql.append(" 		select rnum, content, regdate, id, bbsno, rownum r ");
		sql.append(" 		from ( ");
		sql.append(" 				select rnum, content, regdate, id, bbsno ");
		sql.append(" 				FROM jwreply ");
		sql.append(" where bbsno = ? ");
		sql.append(" 				order by rnum DESC ) ");
		sql.append(" 	) where r>=? and r<=? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsno);
			pstmt.setInt(2, sno);
			pstmt.setInt(3, eno);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ReplyDTO dto = new ReplyDTO();
				
				dto.setId(rs.getString("id"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
				
				list.add(dto);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(rs, pstmt, con);
		}
		return list;
	}

	
	public ReplyDTO read(int rnum) {
		ReplyDTO dto = new ReplyDTO();

		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		StringBuffer sql = new StringBuffer();

		sql.append(" SELECT rnum, content, regdate, id, bbsno ");
		sql.append(" FROM jwreply ");
		sql.append(" WHERE rnum = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());

			pstmt.setInt(1, rnum);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto.setRnum(rs.getInt("rnum"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setId(rs.getString("id"));
				dto.setBbsno(rs.getInt("bbsno"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}

		return dto;
	}
	
	public boolean deleteAll(int bbsno) {
		boolean flag = false;

		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;

		StringBuffer sql = new StringBuffer();

		sql.append(" DELETE FROM jwreply ");
		sql.append(" WHERE bbsno = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());

			pstmt.setInt(1, bbsno);

			int cnt = pstmt.executeUpdate();

			if (cnt > 0) {
				flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}

		return flag;
	}
	
	public boolean delete(int rnum) {
		boolean flag = false;

		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;

		StringBuffer sql = new StringBuffer();

		sql.append(" DELETE FROM jwreply ");
		sql.append(" WHERE rnum = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());

			pstmt.setInt(1, rnum);

			int cnt = pstmt.executeUpdate();

			if (cnt > 0) {
				flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}

		return flag;
	}
	
	public boolean update(ReplyDTO dto) {
		boolean flag = false;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" UPDATE jwreply ");
		sql.append(" SET content = ? WHERE rnum = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			
			pstmt.setString(1, dto.getContent());
			pstmt.setInt(2, dto.getRnum());
			
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
	
	public boolean create(ReplyDTO dto) {
		boolean flag = false;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" INSERT INTO jwreply(rnum, content, regdate, id, bbsno) ");
		sql.append(" VALUES( (SELECT nvl(max(rnum),0)+1 FROM jwreply), ?, sysdate, ?, ? ) ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			
			pstmt.setString(1, dto.getContent());
			pstmt.setString(2, dto.getId());
			pstmt.setInt(3, dto.getBbsno());
			
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
}
