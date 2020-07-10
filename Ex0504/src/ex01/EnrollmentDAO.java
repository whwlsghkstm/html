package ex01;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class EnrollmentDAO {
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
	
	//과목별 평균점수 출력 method
	public ArrayList<EnrollmentVO> clist() throws Exception{
		ArrayList<EnrollmentVO> carray=new ArrayList<EnrollmentVO>();
		String sql="select lcode, lname, pname, avg(grade) c from view_view group by lcode, lname, pname";
		PreparedStatement ps=con().prepareStatement(sql);
		ResultSet rs=ps.executeQuery();
		while(rs.next()){
			EnrollmentVO vo=new EnrollmentVO();
			vo.setLcode(rs.getString("lcode"));
			vo.setLname(rs.getString("lname"));
			vo.setPname(rs.getString("pname"));
			vo.setAvg(rs.getDouble("c"));
			carray.add(vo);
		}
		con().close();
		return carray;
	}
}
