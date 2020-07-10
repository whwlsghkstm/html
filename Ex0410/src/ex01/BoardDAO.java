package ex01;

import java.sql.*;
import java.util.*;

public class BoardDAO {
	
	//데이터베이스 접속
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
	public ArrayList<BoardVO> list() throws Exception{
		ArrayList<BoardVO> array=new ArrayList<BoardVO>();
		
		String sql="select * from tab_board order by bnum desc";
		PreparedStatement ps=con().prepareStatement(sql);
		ResultSet rs=ps.executeQuery();
		
		while(rs.next()) {
			BoardVO vo=new BoardVO();
			vo.setBnum(rs.getInt("bnum"));
			vo.setTitle(rs.getString("title"));
			vo.setContent(rs.getString("content"));
			vo.setWdate(rs.getTimestamp("wdate"));
			array.add(vo);
		}
		
		return array;
	}
	
	//목록입력 method
	public void insert(BoardVO vo) throws Exception{
		String sql="insert into tab_board(bnum, title, content, wdate) values(seq_board.nextval, ?, ?, sysdate)";
		PreparedStatement ps=con().prepareStatement(sql);
		ps.setString(1, vo.getTitle());
		ps.setString(2, vo.getContent());
		ps.execute();
		con().close();
	}
	
	//데이터 읽기 method
	public BoardVO read(int bnum) throws Exception {
		BoardVO vo=new BoardVO();
		String sql="select * from tab_board where bnum=?";
		PreparedStatement ps=con().prepareStatement(sql);
		ps.setInt(1, bnum);
		ResultSet rs=ps.executeQuery();
		if(rs.next()) {
			vo.setBnum(rs.getInt("bnum"));
			vo.setTitle(rs.getString("title"));
			vo.setContent(rs.getString("content"));
		}
		return vo;
	}
	
	//데이터 삭제 method
	public void delete(int bnum) throws Exception{
		String sql="delete from tab_board where bnum=?";
		PreparedStatement ps=con().prepareStatement(sql);
		ps.setInt(1, bnum);
		ps.execute();
		con().close();
	}
	
	//데이터 수정 method
	public void update(BoardVO vo) throws Exception{
		vo=new BoardVO();
		String sql="update tab_board set title=?, content=? where bnum=?";
		PreparedStatement ps=con().prepareStatement(sql);
		ps.setString(1, vo.getTitle());
		ps.setString(2, vo.getContent());
		ps.setInt(3, vo.getBnum());
		ps.execute();
		con().close();
	}
}
