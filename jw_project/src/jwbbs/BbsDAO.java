package jwbbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import jwbbs.BbsDTO;
import db.DBClose;
import db.DBOpen;

public class BbsDAO {
	
	public List<BbsDTO> noticelist(Map map){
		List<BbsDTO> list = new ArrayList<BbsDTO>();

		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String col = (String)map.get("col");
		String word = (String)map.get("word");
		int sno = (Integer)map.get("sno");
		int eno = (Integer)map.get("eno");
		
		
		StringBuffer sql = new StringBuffer();
		/*to_char(wdate,'yyyy-mm-dd') as */			
		 
		sql.append(" SELECT bbsno, title, id, wdate, viewcnt, fin, indent, r ");			// 외출
		sql.append(" from( ");
		sql.append(" 		SELECT bbsno, title, id, wdate, viewcnt, fin, indent, rownum as r ");
		sql.append(" 		from ( ");
		sql.append(" 				SELECT bbsno, title, id, to_char(wdate,'yyyy-mm-dd') as wdate, viewcnt, fin, indent ");
		sql.append(" 				FROM jwbbs where DIV='A04' ");
		if(word.trim().length()>0) {	// total 값은 못들어오게 함.
			sql.append(" 			and "+col+" LIKE '%'||?||'%' ");	// oracle의 연결기호 -> ||
		}
		sql.append(" 				ORDER BY grpno DESC, ansnum ) ");
		sql.append(" 	) where r>=? and r<=? ");
		
		int i=0;
		try {
			pstmt = con.prepareStatement(sql.toString());
			if(word.trim().length()>0) {
				pstmt.setString(++i, word);
			}
			
			pstmt.setInt(++i, sno);
			pstmt.setInt(++i, eno);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BbsDTO dto = new BbsDTO();
				
				dto.setBbsno(rs.getInt("bbsno"));
				dto.setTitle(rs.getString("title"));
				dto.setId(rs.getString("id"));
				dto.setWdate(rs.getString("wdate"));
				dto.setViewcnt(rs.getInt("Viewcnt"));
				dto.setFin(rs.getString("fin"));
				dto.setIndent(rs.getInt("Indent"));
				
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
	
	public List<BbsDTO> QnAlist(Map map){
		List<BbsDTO> list = new ArrayList<BbsDTO>();

		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String col = (String)map.get("col");
		String word = (String)map.get("word");
		int sno = (Integer)map.get("sno");
		int eno = (Integer)map.get("eno");
		
		
		StringBuffer sql = new StringBuffer();
		/*to_char(wdate,'yyyy-mm-dd') as */			
		 
		sql.append(" SELECT bbsno, title, id, wdate, viewcnt, fin, indent, r ");			// 외출
		sql.append(" from( ");
		sql.append(" 		SELECT bbsno, title, id, wdate, viewcnt, fin, indent, rownum as r ");
		sql.append(" 		from ( ");
		sql.append(" 				SELECT bbsno, title, id, to_char(wdate,'yyyy-mm-dd') as wdate, viewcnt, fin, indent ");
		sql.append(" 				FROM jwbbs where DIV='A03' ");
		if(word.trim().length()>0) {	// total 값은 못들어오게 함.
			sql.append(" 			and "+col+" LIKE '%'||?||'%' ");	// oracle의 연결기호 -> ||
		}
		sql.append(" 				ORDER BY grpno DESC, ansnum ) ");
		sql.append(" 	) where r>=? and r<=? ");
		
		int i=0;
		try {
			pstmt = con.prepareStatement(sql.toString());
			if(word.trim().length()>0) {
				pstmt.setString(++i, word);
			}
			
			pstmt.setInt(++i, sno);
			pstmt.setInt(++i, eno);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BbsDTO dto = new BbsDTO();
				
				dto.setBbsno(rs.getInt("bbsno"));
				dto.setTitle(rs.getString("title"));
				dto.setId(rs.getString("id"));
				dto.setWdate(rs.getString("wdate"));
				dto.setViewcnt(rs.getInt("Viewcnt"));
				dto.setFin(rs.getString("fin"));
				dto.setIndent(rs.getInt("Indent"));
				
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
	
	public List<BbsDTO> selllist(Map map){
		List<BbsDTO> list = new ArrayList<BbsDTO>();

		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String col = (String)map.get("col");
		String word = (String)map.get("word");
		int sno = (Integer)map.get("sno");
		int eno = (Integer)map.get("eno");
		
		
		StringBuffer sql = new StringBuffer();
		/*to_char(wdate,'yyyy-mm-dd') as */			
		 
		sql.append(" SELECT bbsno, title, id, wdate, viewcnt, fin, indent, r ");			// 외출
		sql.append(" from( ");
		sql.append(" 		SELECT bbsno, title, id, wdate, viewcnt, fin, indent, rownum as r ");
		sql.append(" 		from ( ");
		sql.append(" 				SELECT bbsno, title, id, to_char(wdate,'yyyy-mm-dd') as wdate, viewcnt, fin, indent ");
		sql.append(" 				FROM jwbbs where DIV='A01' ");
		if(word.trim().length()>0) {	// total 값은 못들어오게 함.
			sql.append(" 			and "+col+" LIKE '%'||?||'%' ");	// oracle의 연결기호 -> ||
		}
		sql.append(" 				ORDER BY grpno DESC, ansnum ) ");
		sql.append(" 	) where r>=? and r<=? ");
		
		int i=0;
		try {
			pstmt = con.prepareStatement(sql.toString());
			if(word.trim().length()>0) {
				pstmt.setString(++i, word);
			}
			
			pstmt.setInt(++i, sno);
			pstmt.setInt(++i, eno);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BbsDTO dto = new BbsDTO();
				
				dto.setBbsno(rs.getInt("bbsno"));
				dto.setTitle(rs.getString("title"));
				dto.setId(rs.getString("id"));
				dto.setWdate(rs.getString("wdate"));
				dto.setViewcnt(rs.getInt("Viewcnt"));
				dto.setFin(rs.getString("fin"));
				dto.setIndent(rs.getInt("Indent"));
				
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
	
	public List<BbsDTO> buylist(Map map){
		List<BbsDTO> list = new ArrayList<BbsDTO>();

		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String col = (String)map.get("col");
		String word = (String)map.get("word");
		int sno = (Integer)map.get("sno");
		int eno = (Integer)map.get("eno");
		
		
		StringBuffer sql = new StringBuffer();
		/*to_char(wdate,'yyyy-mm-dd') as */			
		 
		sql.append(" SELECT bbsno, title, id, wdate, viewcnt, fin, indent, r ");			// 외출
		sql.append(" from( ");
		sql.append(" 		SELECT bbsno, title, id, wdate, viewcnt, fin, indent, rownum as r ");
		sql.append(" 		from ( ");
		sql.append(" 				SELECT bbsno, title, id, to_char(wdate,'yyyy-mm-dd') as wdate, viewcnt, fin, indent ");
		sql.append(" 				FROM jwbbs where DIV='A02' ");
		if(word.trim().length()>0) {	// total 값은 못들어오게 함.
			sql.append(" 			and "+col+" LIKE '%'||?||'%' ");	// oracle의 연결기호 -> ||
		}
		sql.append(" 				ORDER BY grpno DESC, ansnum ) ");
		sql.append(" 	) where r>=? and r<=? ");
		
		int i=0;
		try {
			pstmt = con.prepareStatement(sql.toString());
			if(word.trim().length()>0) {
				pstmt.setString(++i, word);
			}
			
			pstmt.setInt(++i, sno);
			pstmt.setInt(++i, eno);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BbsDTO dto = new BbsDTO();
				
				dto.setBbsno(rs.getInt("bbsno"));
				dto.setTitle(rs.getString("title"));
				dto.setId(rs.getString("id"));
				dto.setWdate(rs.getString("wdate"));
				dto.setViewcnt(rs.getInt("Viewcnt"));
				dto.setFin(rs.getString("fin"));
				dto.setIndent(rs.getInt("Indent"));
				
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
	
	public boolean passCheck(Map map) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int bbsno = (Integer) map.get("bbsno");
		String passwd = (String) map.get("passwd");

		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT COUNT(bbsno) as cnt ");
		sql.append(" FROM jwbbs ");
		sql.append(" WHERE bbsno=? AND passwd=? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsno);
			pstmt.setString(2, passwd);

			rs = pstmt.executeQuery();
			rs.next();
			int cnt = rs.getInt("cnt");

			if (cnt > 0) {
				flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}
		return flag;
	}

	
	public boolean update(BbsDTO dto) {
		boolean flag = false;

		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;

		StringBuffer sql = new StringBuffer();

		sql.append(" UPDATE jwbbs ");
		sql.append(" SET title=?, content=?, fin=? ");
		if(dto.getFilesize()>0) {
			sql.append(" , fname = ?, filesize = ? ");
		}
		sql.append(" WHERE bbsno=? ");
		
		int i=0;
		try {
			pstmt = con.prepareStatement(sql.toString());

			pstmt.setString(++i, dto.getTitle());
			pstmt.setString(++i, dto.getContent());
			pstmt.setString(++i, dto.getFin());
			if(dto.getFilesize()>0) {
				pstmt.setString(++i, dto.getFname());
				pstmt.setInt(++i, dto.getFilesize());
			}
			pstmt.setInt(++i, dto.getBbsno());

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
	
	public BbsDTO read(int bbsno) {
		BbsDTO dto = new BbsDTO();

		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		StringBuffer sql = new StringBuffer();

		sql.append(" SELECT bbsno, id, title, content, viewcnt, wdate, recom, div, grpno, indent, ansnum, fname, filesize, hide ");
		sql.append(" FROM jwbbs ");
		sql.append(" WHERE bbsno=? ");

		try {
			pstmt = con.prepareStatement(sql.toString());

			pstmt.setInt(1, bbsno);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				dto.setBbsno(rs.getInt("bbsno"));
				dto.setId(rs.getString("id"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setViewcnt(rs.getInt("viewcnt"));
				dto.setWdate(rs.getString("wdate"));
				dto.setRecom(rs.getInt("recom"));
				dto.setDiv(rs.getString("div"));
				dto.setGrpno(rs.getInt("grpno"));
				dto.setIndent(rs.getInt("indent"));
				dto.setAnsnum(rs.getInt("ansnum"));
				dto.setFname(rs.getString("fname"));
				dto.setFilesize(rs.getInt("filesize"));
				dto.setHide(rs.getString("hide"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}

		return dto;
	}
	
	public void updateviewcnt(int bbsno) {

		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;

		StringBuffer sql = new StringBuffer();

		sql.append(" UPDATE jwbbs ");
		sql.append(" SET viewcnt = viewcnt + 1 ");
		sql.append(" WHERE bbsno = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());

			pstmt.setInt(1, bbsno);

			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}
	}
	
	public boolean create(BbsDTO dto) {

		boolean flag = false;

		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;

		StringBuffer sql = new StringBuffer();

		sql.append(" INSERT INTO jwbbs ");
		sql.append(" (bbsno, id, title, content, passwd, wdate, div, grpno, fname, filesize, hide) ");
		sql.append(" VALUES((SELECT NVL(MAX(bbsno),0)+1 as max FROM jwbbs), ");
		sql.append(" ?, ?, ?, ?, sysdate, ? ");
		sql.append(", (SELECT NVL(MAX(grpno),0)+1 as grpno FROM jwbbs),?,?,?)");

		try {
			pstmt = con.prepareStatement(sql.toString());

			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPasswd());
			pstmt.setString(5, dto.getDiv());
			pstmt.setString(6, dto.getFname());
			pstmt.setInt(7, dto.getFilesize());
			pstmt.setString(8, dto.getHide());

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
	

	public List<BbsDTO> list(Map map){
		List<BbsDTO> list = new ArrayList<BbsDTO>();

		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String col = (String)map.get("col");
		String word = (String)map.get("word");
		int sno = (Integer)map.get("sno");
		int eno = (Integer)map.get("eno");
		
		
		StringBuffer sql = new StringBuffer();
		/*to_char(wdate,'yyyy-mm-dd') as */			
		 
		sql.append(" SELECT bbsno, title, id, wdate, viewcnt, fin, div, indent,  r ");			// 외출
		sql.append(" from( ");
		sql.append(" 		SELECT bbsno, title, id, wdate, viewcnt, fin, div, indent, rownum as r ");
		sql.append(" 		from ( ");
		sql.append(" 				SELECT bbsno, title, id, to_char(wdate,'yyyy-mm-dd') as wdate, viewcnt, fin, div, indent ");
		sql.append(" 				FROM jwbbs ");
		if(word.trim().length()>0) {	// total 값은 못들어오게 함.
			sql.append(" 			WHERE "+col+" LIKE '%'||?||'%' ");	// oracle의 연결기호 -> ||
		}
		sql.append(" 				ORDER BY grpno DESC, ansnum ) ");
		sql.append(" 	) where r>=? and r<=? ");
		
		int i=0;
		try {
			pstmt = con.prepareStatement(sql.toString());
			if(word.trim().length()>0) {
				pstmt.setString(++i, word);
			}
			
			pstmt.setInt(++i, sno);
			pstmt.setInt(++i, eno);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BbsDTO dto = new BbsDTO();
				
				dto.setBbsno(rs.getInt("bbsno"));
				dto.setTitle(rs.getString("title"));
				dto.setId(rs.getString("id"));
				dto.setWdate(rs.getString("wdate"));
				dto.setViewcnt(rs.getInt("Viewcnt"));
				dto.setFin(rs.getString("fin"));
				dto.setDiv(rs.getString("div"));
				dto.setIndent(rs.getInt("Indent"));
				
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

	
	public int total(Map map) {						
		int total = 0;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String col = (String)map.get("col");
		String word = (String)map.get("word");															
		
		StringBuffer sql = new StringBuffer();										// 체크
		sql.append(" select count(*) from jwbbs ");
		if(word.trim().length()>0) {	// total 값은 못들어오게 함.
			sql.append(" WHERE "+col+" LIKE '%'||?||'%' ");	// oracle의 연결기호 -> ||
		}
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			
			if(word.trim().length()>0) {
				pstmt.setString(1, word);
			}
			
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
	
	public int buytotal(Map map) {						
		int total = 0;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String col = (String)map.get("col");
		String word = (String)map.get("word");															
		
		StringBuffer sql = new StringBuffer();										// 체크
		sql.append(" select count(*) from jwbbs WHERE div='A02' ");
		if(word.trim().length()>0) {	// total 값은 못들어오게 함.
			sql.append("  and "+col+" LIKE '%'||?||'%' ");	// oracle의 연결기호 -> ||
		}
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			
			if(word.trim().length()>0) {
				pstmt.setString(1, word);
			}
			
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
	
	public int selltotal(Map map) {						
		int total = 0;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String col = (String)map.get("col");
		String word = (String)map.get("word");															
		
		StringBuffer sql = new StringBuffer();										// 체크
		sql.append(" select count(*) from jwbbs WHERE div='A01' ");
		if(word.trim().length()>0) {	// total 값은 못들어오게 함.
			sql.append("  and "+col+" LIKE '%'||?||'%' ");	// oracle의 연결기호 -> ||
		}
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			
			if(word.trim().length()>0) {
				pstmt.setString(1, word);
			}
			
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
	
	public int QnAtotal(Map map) {						
		int total = 0;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String col = (String)map.get("col");
		String word = (String)map.get("word");															
		
		StringBuffer sql = new StringBuffer();										// 체크
		sql.append(" select count(*) from jwbbs WHERE div='A03' ");
		if(word.trim().length()>0) {	// total 값은 못들어오게 함.
			sql.append("  and "+col+" LIKE '%'||?||'%' ");	// oracle의 연결기호 -> ||
		}
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			
			if(word.trim().length()>0) {
				pstmt.setString(1, word);
			}
			
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
	
	public int noticetotal(Map map) {						
		int total = 0;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String col = (String)map.get("col");
		String word = (String)map.get("word");															
		
		StringBuffer sql = new StringBuffer();										// 체크
		sql.append(" select count(*) from jwbbs WHERE div='A04' ");
		if(word.trim().length()>0) {	// total 값은 못들어오게 함.
			sql.append("  and "+col+" LIKE '%'||?||'%' ");	// oracle의 연결기호 -> ||
		}
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			
			if(word.trim().length()>0) {
				pstmt.setString(1, word);
			}
			
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
	
	public boolean checkRefnum(int bbsno) {
		boolean flag = false;

		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		StringBuffer sql = new StringBuffer();

		sql.append(" select count(refnum) ");
		sql.append(" from jwbbs ");
		sql.append(" where refnum = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());

			pstmt.setInt(1, bbsno);

			rs = pstmt.executeQuery();

			rs.next();

			int cnt = rs.getInt(1);

			if (cnt > 0) {
				flag = true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}
		return flag;
	}
	
	public boolean delete(int bbsno) {
		boolean flag = false;

		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;

		StringBuffer sql = new StringBuffer();

		sql.append(" DELETE FROM jwbbs ");
		sql.append(" WHERE bbsno=? ");

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
}
