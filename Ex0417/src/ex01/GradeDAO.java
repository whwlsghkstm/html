package ex01;

import java.sql.*;
import java.util.ArrayList;

public class GradeDAO {
	public Connection con() throws Exception{
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "system";
		String password = "1111";
		  
		Class.forName(driver);
		Connection con=DriverManager.getConnection(url, user, password);
		  
		return con;
	}
	
	//목록출력 method
	public ArrayList<GradeVO> list() throws Exception{
		ArrayList<GradeVO> array=new ArrayList<GradeVO>();
		String sql="select * from tab_grade order by gnum";
		PreparedStatement ps=con().prepareStatement(sql);
		ResultSet rs=ps.executeQuery();
		
		while(rs.next()) {
			GradeVO vo=new GradeVO();
			vo.setGnum(rs.getInt("gnum"));
			vo.setGname(rs.getString("gname"));
			vo.setKor(rs.getInt("kor"));
			vo.setEng(rs.getInt("eng"));
			vo.setMat(rs.getInt("mat"));
			array.add(vo);
		}
		return array;
	}
	
	//목록입력 method
	public void insert(GradeVO vo) throws Exception{
		String sql="insert into tab_grade(gnum, gname, kor, eng, mat) values(seq_gnum.nextval, ?, ?, ?, ?)";
		PreparedStatement ps=con().prepareStatement(sql);
		ps.setString(1, vo.getGname());
		ps.setInt(2, vo.getKor());
		ps.setInt(3, vo.getEng());
		ps.setInt(4, vo.getMat());
		ps.execute();
		con().close();
	}
	
	//데이터삭제 method
	public void delete(int gnum) throws Exception{
		String sql="delete from tab_grade where gnum=?";
		PreparedStatement ps=con().prepareStatement(sql);
		ps.setInt(1, gnum);
		ps.execute();
		con().close();
	}
	
	//데이터수정 method
	public void update(GradeVO vo) throws Exception{
		String sql="update tab_grade set kor=?, eng=?, mat=? where gnum=?";
		PreparedStatement ps=con().prepareStatement(sql);
		ps.setInt(1, vo.getKor());
		ps.setInt(2, vo.getEng());
		ps.setInt(3, vo.getMat());
		ps.setInt(4, vo.getGnum());
		ps.execute();
		con().close();
	}
	
}
