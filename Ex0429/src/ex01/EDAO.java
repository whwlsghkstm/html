package ex01;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class EDAO {
	//데이터베이스 연결 method
	public Connection con() throws Exception{
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "haksa";
		String password = "pass";
		  
		Class.forName(driver);
		Connection con=DriverManager.getConnection(url, user, password);
		  
		return con;
	}
	
	//특정 학생이 신청 수강신청 목록
	public ArrayList<EVO> list(String scode) throws Exception{
		ArrayList<EVO> array=new ArrayList<EVO>();
		String sql="select * from view_enrollment where scode=?";
		PreparedStatement ps=con().prepareStatement(sql);
		ps.setString(1, scode);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			EVO vo=new EVO();
			vo.setSname(rs.getString("sname"));
			vo.setScode(rs.getString("scode"));
			vo.setLname(rs.getString("lname"));
			vo.setLcode(rs.getString("lcode"));
			vo.setEdate(rs.getString("edate"));
			vo.setGrade(rs.getInt("grade"));
			array.add(vo);
		}
		con().close();
		return array;
	}
	
	//수강신청 method
	public void insert(String lcode, String scode) throws Exception{
		String sql="insert into enrollment(lcode, scode, edate) values(?, ?, sysdate)";
		PreparedStatement ps=con().prepareStatement(sql);
		ps.setString(1, lcode);
		ps.setString(2, scode);
		ps.execute();
		con().close();
	}
	
	//수강취소 method
	public void delete(String lcode, String scode) throws Exception{
		String sql="delete from enrollment where lcode=? and scode=?";
		PreparedStatement ps=con().prepareStatement(sql);
		ps.setString(1, lcode);
		ps.setString(2, scode);
		ps.execute();
		con().close();
	}
}
