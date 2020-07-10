package ex01;

import java.sql.*;
import java.util.*;

public class SDAO {

	//데이터베이스 연결
	public Connection con() throws Exception{
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "haksa";
		String password = "pass";
		  
		Class.forName(driver);
		Connection con=DriverManager.getConnection(url, user, password);
		  
		return con;
	}
	
	//학생목록 출력 method
	public ArrayList<SVO> list(String type, String word) throws Exception{
		ArrayList<SVO> array=new ArrayList<SVO>();
		String sql="select * from sview where " + type + " like ?";
		PreparedStatement ps=con().prepareStatement(sql);
		ps.setString(1, "%" + word + "%");
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			SVO vo=new SVO();
			vo.setScode(rs.getString("scode"));
			vo.setSname(rs.getString("sname"));
			vo.setSdept(rs.getString("sdept"));
			vo.setBirthday(rs.getDate("birthday"));
			
			vo.setPname(rs.getString("pname"));
			vo.setPdept(rs.getString("pdept"));
			
			array.add(vo);
		}
		return array;
	}
}
