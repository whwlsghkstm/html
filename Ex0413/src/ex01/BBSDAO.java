package ex01;

import java.sql.*;
import java.util.*;

public class BBSDAO {
	
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
	
	//목록출력 method
	public ArrayList<BBSVO> list() throws Exception{
		ArrayList<BBSVO> array=new ArrayList<BBSVO>();
		String sql="select * from tab_bbs order by bnum desc";
		PreparedStatement ps=con().prepareStatement(sql);
		ResultSet rs=ps.executeQuery();
		
		while(rs.next()) {
			BBSVO vo=new BBSVO();
			vo.setBnum(rs.getInt("bnum"));
			vo.setTitle(rs.getString("title"));
			vo.setContent(rs.getString("content"));
			vo.setWdate(rs.getTimestamp("wdate"));
			array.add(vo);
		}
		return array;
	}
	
	//데이터입력 method
	public void insert(BBSVO vo) throws Exception{
		String sql="insert into tab_bbs(bnum, title, content, wdate) values(seq_bbs.nextval, ?, ?, sysdate)";
		PreparedStatement ps=con().prepareStatement(sql);
		ps.setString(1, vo.getTitle());
		ps.setString(2, vo.getContent());
		ps.execute();
		con().close();
	}
	
	//특정데이터 출력 method
	public BBSVO read(int bnum) throws Exception{
		String sql="select * from tab_bbs where bnum=?";
		PreparedStatement ps=con().prepareStatement(sql);
		ps.setInt(1, bnum);
		ResultSet rs=ps.executeQuery();
		BBSVO vo=new BBSVO();
		
		if(rs.next()) {
			vo.setBnum(rs.getInt("bnum"));
			vo.setTitle(rs.getString("title"));
			vo.setContent(rs.getString("content"));
			vo.setWdate(rs.getTimestamp("wdate"));
		}
		
		return vo;
	}
	
	//데이터 삭제 method
	public void delete(int bnum) throws Exception{
		String sql="delete from tab_bbs where bnum=?";
		PreparedStatement ps=con().prepareStatement(sql);
		ps.setInt(1, bnum);
		ps.execute();
		con().close();
	}
	
	//데이터 수정 method
	public void update(BBSVO vo) throws Exception{
		String sql="update tab_bbs set title=?, content=? where bnum=?";
		PreparedStatement ps=con().prepareStatement(sql);
		ps.setString(1, vo.getTitle());
		ps.setString(2, vo.getContent());
		ps.setInt(3, vo.getBnum());
		ps.execute();
		con().close();
	}
}
