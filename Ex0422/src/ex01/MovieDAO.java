package ex01;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class MovieDAO {
	//데이터베이스 연동 method
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
	public void insert(MovieVO vo) throws Exception{
		String sql="insert into tab_movie(mnum,title,actor,image)values(seq_mnum.nextval,?,?,?)";
		PreparedStatement ps=con().prepareStatement(sql);
		ps.setString(1, vo.getTitle());
		ps.setString(2, vo.getActor());
		ps.setString(3, vo.getImage());
		ps.execute();
		con().close();
	}
	
	//데이터목록 method
	public ArrayList<MovieVO> list() throws Exception{
		ArrayList<MovieVO> array=new ArrayList<MovieVO>();
		String sql="select * from tab_movie order by mnum desc";
		PreparedStatement ps=con().prepareStatement(sql);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			MovieVO vo=new MovieVO();
			vo.setMnum(rs.getInt("mnum"));
			vo.setTitle(rs.getString("title"));
			vo.setActor(rs.getString("actor"));
			vo.setImage(rs.getString("image"));
			array.add(vo);
		}
		
		return array;
	}
	
	//데이터 삭제 method
	public void delete(int mnum) throws Exception{
		String sql="delete from tab_movie where mnum=?";
		PreparedStatement ps=con().prepareStatement(sql);
		ps.setInt(1, mnum);
		ps.execute();
		con().close();
	}
}
