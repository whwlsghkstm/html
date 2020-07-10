package ex01;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class PDAO {
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
	
	//교수목록출력 method
	public ArrayList<PVO> list() throws Exception{
		ArrayList<PVO> array=new ArrayList<PVO>();
		String sql="select * from professor";
		PreparedStatement ps=con().prepareStatement(sql);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			PVO vo=new PVO();
			vo.setPcode(rs.getString("pcode"));
			vo.setPname(rs.getString("pname"));
			vo.setDept(rs.getString("dept"));
			vo.setHiredate(rs.getString("hiredate"));
			vo.setTitle(rs.getString("title"));
			vo.setSalary(rs.getInt("salary"));
			array.add(vo);
		}
		con().close();
		return array;
	}
}
