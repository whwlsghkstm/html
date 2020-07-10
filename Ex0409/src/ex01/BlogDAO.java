package ex01;

import java.sql.*;
import java.util.*;

public class BlogDAO {
	
	public Connection con() throws Exception{
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "system";
		String password = "1111";
	
		Class.forName(driver);
		Connection con=DriverManager.getConnection(url, user, password);
		
		return con;
	}
	
	//데이터 목록 출력 method
	public ArrayList<BlogVO> list() throws Exception{
		ArrayList<BlogVO> array = new ArrayList<BlogVO>();
		String sql="select * from tab_blog order by bnum desc";
		PreparedStatement ps=con().prepareStatement(sql);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			BlogVO vo=new BlogVO();
			vo.setBnum(rs.getInt("bnum"));
			vo.setTitle(rs.getString("title"));
			vo.setWdate(rs.getDate("wdate"));
			vo.setArticle(rs.getString("article"));
			array.add(vo);
		}		
		return array;
	}
	
	//데이터 입력 method
	public void insert(BlogVO vo) throws Exception{
		String sql="insert into tab_blog(bnum, title, wdate, article) values(seq_blog.nextval,?,sysdate,?)";
		PreparedStatement ps=con().prepareStatement(sql);
		ps.setString(1, vo.getTitle());
		ps.setString(2, vo.getArticle());
		ps.execute();
		con().close();
	}
	
	//데이터 삭제 method
	public void delete(int bnum) throws Exception{
		String sql="delete from tab_blog where bnum=?";
		PreparedStatement ps=con().prepareStatement(sql);
		ps.setInt(1, bnum);
		ps.execute();
		con().close();
	}
}
