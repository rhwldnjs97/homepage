package jwmember;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import db.DBClose;
import db.DBOpen;

public class memberDAO {
	public boolean create(memberDTO dto) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;

		StringBuffer sql = new StringBuffer();

		sql.append(" INSERT INTO jwmember(id, passwd, mname, tel, email, zipcode, address1, address2, mdate, fname, grade) ");
		sql.append(" VALUES(?, ?, ?, ?, ?, ?, ?, ?, sysdate, ?, 'H') ");

		try {
			pstmt = con.prepareStatement(sql.toString());

			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPasswd());
			pstmt.setString(3, dto.getMname());
			pstmt.setString(4, dto.getTel());
			pstmt.setString(5, dto.getEmail());
			pstmt.setString(6, dto.getZipcode());
			pstmt.setString(7, dto.getAddress1());
			pstmt.setString(8, dto.getAddress2());
			pstmt.setString(9, dto.getFname());

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

	public boolean update(memberDTO dto) {
		boolean flag = false;

		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;

		StringBuffer sql = new StringBuffer();

		sql.append(" UPDATE jwmember ");
		sql.append(" SET passwd=?, ");
		sql.append(" tel=?, ");
		sql.append(" email=?, ");
		sql.append(" zipcode=?, ");
		sql.append(" address1=?, ");
		sql.append(" address2=?, ");
		sql.append(" WHERE id = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());

			pstmt.setString(1, dto.getPasswd());
			pstmt.setString(2, dto.getTel());
			pstmt.setString(3, dto.getEmail());
			pstmt.setString(4, dto.getZipcode());
			pstmt.setString(5, dto.getAddress1());
			pstmt.setString(6, dto.getAddress2());
			pstmt.setString(7, dto.getId());

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

	public boolean delete(String id) {
		boolean flag = false;

		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;

		StringBuffer sql = new StringBuffer();

		sql.append(" DELETE FROM jwmember ");
		sql.append(" WHERE id=? ");

		try {
			pstmt = con.prepareStatement(sql.toString());

			pstmt.setString(1, id);

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

	public memberDTO read(String id) {
		memberDTO dto = new memberDTO();

		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		StringBuffer sql = new StringBuffer();

		sql.append(" SELECT id, passwd, mname, tel, email, zipcode, address1, address2, mdate, fname, grade ");
		sql.append(" FROM jwmember ");
		sql.append(" WHERE id = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());

			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setMname(rs.getString("mname"));
				dto.setTel(rs.getString("tel"));
				dto.setEmail(rs.getString("email"));
				dto.setZipcode(rs.getString("zipcode"));
				dto.setAddress1(rs.getString("address1"));
				dto.setAddress2(rs.getString("address2"));
				dto.setMdate(rs.getString("mdate"));
				dto.setFname(rs.getString("fname"));
				dto.setGrade(rs.getString("grade"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}

		return dto;
	}

	public List<memberDTO> list(Map map) {
		List<memberDTO> list = new ArrayList<memberDTO>();
		memberDTO dto = null;

		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String col = (String) map.get("col");
		String word = (String) map.get("word");
		int sno = (Integer) map.get("sno");
		int eno = (Integer) map.get("eno");

		StringBuffer sql = new StringBuffer();

		sql.append(" SELECT id, mname, tel, email, zipcode, address1, address2, fname, r ");
		sql.append(" FROM( ");
		sql.append(" 	SELECT id, mname, tel, email, zipcode, address1, address2, fname, rownum as r ");
		sql.append(" 	FROM( ");
		sql.append(" 		SELECT id, mname, tel, email, zipcode, address1, address2, fname ");
		sql.append(" 		FROM jwmember ");
		if (word.trim().length() > 0) {
			sql.append(" 		WHERE " + col + " like '%'||?||'%' ");
		}
		sql.append(" 		ORDER BY mdate DESC ) ");
		sql.append(" 	) WHERE r>=? and r<=? ");

		int i = 0;
		try {
			pstmt = con.prepareStatement(sql.toString());

			if (word.trim().length() > 0) {
				pstmt.setString(++i, word);
			}

			pstmt.setInt(++i, sno);
			pstmt.setInt(++i, eno);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				dto = new memberDTO();

				dto.setId(rs.getString("id"));
				dto.setMname(rs.getString("mname"));
				dto.setTel(rs.getString("tel"));
				dto.setEmail(rs.getString("email"));
				dto.setZipcode(rs.getString("zipcode"));
				dto.setAddress1(rs.getString("address1"));
				dto.setAddress2(rs.getString("address2"));
				dto.setFname(rs.getString("fname"));

				list.add(dto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}

		return list;
	}

	public boolean loginCheck(Map map) {
		boolean flag = false;

		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String id = (String) map.get("id");
		String pw = (String) map.get("pw");

		StringBuffer sql = new StringBuffer();

		sql.append(" SELECT COUNT(*) FROM jwmember ");
		sql.append(" WHERE id=? ");
		sql.append(" AND passwd=? ");

		try {
			pstmt = con.prepareStatement(sql.toString());

			pstmt.setString(1, id);
			pstmt.setString(2, pw);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				int cnt = rs.getInt(1);
				if (cnt > 0) {
					flag = true;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}

		return flag;
	}

	public String getGrade(String id) {
		String grade = null;

		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		StringBuffer sql = new StringBuffer();

		sql.append(" SELECT grade FROM jwmember ");
		sql.append(" WHERE id = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());

			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				grade = rs.getString("grade");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return grade;
	}
	
	public boolean duplicateId(String id) {
		boolean flag = false;

		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		StringBuffer sql = new StringBuffer();

		sql.append(" SELECT COUNT(id) ");
		sql.append(" FROM jwmember ");
		sql.append(" WHERE id=? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				int cnt = rs.getInt(1);
				if (cnt > 0) {
					flag = true;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}
		return flag;
	}

	public boolean duplicateEmail(String email) {
		boolean flag = false;

		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		StringBuffer sql = new StringBuffer();

		sql.append(" SELECT COUNT(email) ");
		sql.append(" FROM jwmember ");
		sql.append(" WHERE email=? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, email);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				int cnt = rs.getInt(1);
				if (cnt > 0) {
					flag = true;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}

		return flag;
	}
	
	public String getFname(String id) {
		String fname = null;

		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		StringBuffer sql = new StringBuffer();

		sql.append(" SELECT fname ");
		sql.append(" FROM jwmember ");
		sql.append(" WHERE id = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());

			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				fname = rs.getString("fname");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}

		return fname;
	}
	
	
	public boolean updateFile(Map map) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;

		String fname = (String) map.get("fname");
		String id = (String) map.get("id");

		StringBuffer sql = new StringBuffer();

		sql.append(" update jwmember ");
		sql.append(" set fname = ? ");
		sql.append(" where id = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());

			pstmt.setString(1, fname);
			pstmt.setString(2, id);

			int cnt = pstmt.executeUpdate();

			if (cnt > 0) {
				flag = true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return flag;
	}
	
	public boolean updateInfo(Map map) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;

		String id = (String) map.get("id");
		String mname = (String) map.get("mname");
		String tel = (String) map.get("tel");
		String email = (String) map.get("email");
		String zipcode = (String) map.get("zipcode");
		String address1 = (String) map.get("address1");
		String address2 = (String) map.get("address2");

		StringBuffer sql = new StringBuffer();

		sql.append(" update jwmember ");
		sql.append(" set mname = ?, tel = ?, email = ?, zipcode = ?, address1 = ?, address2 = ? ");
		sql.append(" where id = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());

			pstmt.setString(1, mname);
			pstmt.setString(2, tel);
			pstmt.setString(3, email);
			pstmt.setString(4, zipcode);
			pstmt.setString(5, address1);
			pstmt.setString(6, address2);
			pstmt.setString(7, id);

			int cnt = pstmt.executeUpdate();

			if (cnt > 0) {
				flag = true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return flag;
	}
	
	
	public boolean passwdCheck(Map map) {
		int check = 0;
		boolean flag = false;

		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String id = (String) map.get("id");
		String oldpasswd = (String) map.get("oldpasswd");

		StringBuffer sql = new StringBuffer();

		sql.append(" SELECT COUNT(*) ");
		sql.append(" FROM jwmember ");
		sql.append(" where id = ? and passwd = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());

			pstmt.setString(1, id);
			pstmt.setString(2, oldpasswd);

			rs = pstmt.executeQuery();
			rs.next();

			check = rs.getInt(1);

			if (check > 0) {
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
	
	
	public boolean updatePasswd(Map map) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;

		String id = (String) map.get("id");
		String oldpasswd = (String) map.get("oldpasswd");
		String passwd = (String) map.get("passwd");
		String repasswd = (String) map.get("repasswd");

		StringBuffer sql = new StringBuffer();

		sql.append(" update jwmember ");
		sql.append(" set passwd = ? ");
		sql.append(" where id = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());

			pstmt.setString(1, passwd);
			pstmt.setString(2, id);

			int cnt = pstmt.executeUpdate();

			if (cnt > 0) {
				flag = true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return flag;
	}
	
}
