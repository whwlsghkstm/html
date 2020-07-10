package Ex0407;

import java.sql.*;
import java.util.*;

public class StudentDAO {
	
	
	//데이터접속
	public Connection con() throws Exception{
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "system";
		String password = "1111";
	
		Class.forName(driver);
		Connection con=DriverManager.getConnection(url, user, password);
		
		return con;
	}
	
	//데이터입력 method
	public void insert(StudentVO vo) throws Exception{
		String sql="insert into tab_student(snum, sname, stel, saddr) values(?,?,?,?)";
		PreparedStatement ps=con().prepareStatement(sql);
		ps.setString(1, vo.getSnum());
		ps.setString(2, vo.getSname());
		ps.setString(3, vo.getStel());
		ps.setString(4, vo.getSaddr());
		ps.execute();
		con().close();
	}
	
	//데이터 목록출력 method
		public ArrayList<StudentVO> list() throws Exception{
			ArrayList<StudentVO> array = new ArrayList<StudentVO>();
			String sql="select * from tab_student order by snum";
			PreparedStatement ps=con().prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				StudentVO vo = new StudentVO();
				vo.setSnum(rs.getString("snum"));
				vo.setSname(rs.getString("sname"));
				vo.setStel(rs.getString("stel"));
				vo.setSaddr(rs.getString("saddr"));
				array.add(vo);
			}
			
			return array;
		}
}
