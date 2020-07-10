package ex01;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class EDAO1 {
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
	
	//수강신청 목록출력 method
	public ArrayList<EVO1> list(String lcode) throws Exception{
		ArrayList<EVO1> array=new ArrayList<EVO1>();
		String sql="select * from view_enrollment where lcode=?";
		PreparedStatement ps=con().prepareStatement(sql);
		ps.setString(1, lcode);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			EVO1 vo=new EVO1();
			vo.setLcode(rs.getString("lcode"));
			vo.setLname(rs.getString("lname"));
			vo.setScode(rs.getString("scode"));
			vo.setSname(rs.getString("sname"));
			vo.setGrade(rs.getInt("grade"));
			vo.setEdate(rs.getDate("edate"));
			array.add(vo);
		}
		con().close();
		return array;
	}
	
	//학생이 신청한 수강신청 과목수 출력 method
	public int count(String lcode) throws Exception{
		int count=0;
		String sql="select count(*) from enrollment where lcode=?";
		PreparedStatement ps=con().prepareStatement(sql);
		ps.setString(1, lcode);
		ResultSet rs=ps.executeQuery();
		if(rs.next()) {
			count=rs.getInt("count(*)");
		}
		con().close();
		return count;
	}
}
