package ex01;

import java.sql.*;
import java.util.*;

public class ShopDAO {

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
	public void insert(ShopVO vo) throws Exception{
		String sql="insert into tab_shop(sid, title, lprice, hprice, wdate, image)values(?, ?, ?, ?, sysdate, ?)";
		PreparedStatement ps=con().prepareStatement(sql);
		ps.setString(1, vo.getSid());
		ps.setString(2, vo.getTitle());
		ps.setInt(3, vo.getLprice());
		ps.setInt(4, vo.getHprice());
		ps.setString(5, vo.getImage());
		ps.execute();
		con().close();
	}
	
	//전체 데이터갯수 출력 method
	public int count() throws Exception{
		int count=0;
		String sql="select count(*) cnt from tab_shop";
		PreparedStatement ps=con().prepareStatement(sql);
		ResultSet rs=ps.executeQuery();
		if(rs.next()) {
			count=rs.getInt("cnt");
		}
		con().close();
		return count;
	}
	
	//데이터 목록출력 method
	public ArrayList<ShopVO> list() throws Exception{
		ArrayList<ShopVO> array=new ArrayList<ShopVO>();
		String sql="select * from tab_shop order by wdate desc";
		PreparedStatement ps=con().prepareStatement(sql);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			ShopVO vo=new ShopVO();
			vo.setSid(rs.getString("sid"));
			vo.setTitle(rs.getString("title"));
			vo.setLprice(rs.getInt("lprice"));
			vo.setHprice(rs.getInt("hprice"));
			vo.setWdate(rs.getTimestamp("wdate"));
			vo.setImage(rs.getString("image"));
			array.add(vo);
		}
		con().close();
		return array;
	}
	
	//데이터삭제 method
	public void delete(String sid) throws Exception{
		String sql="delete from tab_shop where sid=?";
		PreparedStatement ps=con().prepareStatement(sql);
		ps.setString(1, sid);
		ps.execute();
		con().close();
	}
	
	//데이터수정 method
	public void update(ShopVO vo) throws Exception{
		String sql="update tab_shop set lprice=?, hprice=? where sid=?";
		PreparedStatement ps=con().prepareStatement(sql);
		ps.setInt(1, vo.getLprice());
		ps.setInt(2, vo.getHprice());
		ps.setString(3, vo.getSid());
		ps.execute();
		con().close();
	}
}
