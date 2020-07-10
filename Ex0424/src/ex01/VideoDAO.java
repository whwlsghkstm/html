package ex01;

import java.sql.*;
import java.util.*;

public class VideoDAO {

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
	public void insert(VideoVO vo) throws Exception{
		String sql="insert into tab_video(vnum, thumbnail, title, datetime, play_time)values(seq_vnum.nextval,?,?,?,?)";
		PreparedStatement ps=con().prepareStatement(sql);
		ps.setString(1, vo.getThumbnail());
		ps.setString(2, vo.getTitle());
		ps.setString(3, vo.getDatetime());
		ps.setString(4, vo.getPlay_time());
		ps.execute();
		con().close();
	}
	
	//전체 데이터갯수 출력 method
	public int count() throws Exception{
		int count=0;
		String sql="select count(*) cnt from tab_video";
		PreparedStatement ps=con().prepareStatement(sql);
		ResultSet rs=ps.executeQuery();
		if(rs.next()) {
			count=rs.getInt("cnt");
		}
		con().close();
		return count;
	}
	
	//데이터 목록출력 method
	public ArrayList<VideoVO> list() throws Exception{
		ArrayList<VideoVO> array=new ArrayList<VideoVO>();
		String sql="select * from tab_video order by vnum desc";
		PreparedStatement ps=con().prepareStatement(sql);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			VideoVO vo=new VideoVO();
			vo.setVnum(rs.getInt("vnum"));
			vo.setThumbnail(rs.getString("thumbnail"));
			vo.setTitle(rs.getString("title"));
			vo.setDatetime(rs.getString("datetime"));
			vo.setPlay_time(rs.getString("play_time"));
			array.add(vo);
		}
		con().close();
		return array;
	}
	
	//데이터삭제 method
	public void delete(int vnum) throws Exception{
		String sql="delete from tab_video where vnum=?";
		PreparedStatement ps=con().prepareStatement(sql);
		ps.setInt(1, vnum);
		ps.execute();
		con().close();
	}
	
	//데이터수정 method
	public void update(VideoVO vo) throws Exception{
		String sql="update tab_video set title=? where vnum=?";
		PreparedStatement ps=con().prepareStatement(sql);
		ps.setString(1, vo.getTitle());
		ps.setInt(2, vo.getVnum());
		ps.execute();
		con().close();
	}
}