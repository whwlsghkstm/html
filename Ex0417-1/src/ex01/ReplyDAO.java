package ex01;
import java.util.*;
import java.sql.*;

public class ReplyDAO {
   //데이터 접속 메서드
   public Connection con() throws Exception{
         String driver = "oracle.jdbc.driver.OracleDriver";
         String url = "jdbc:oracle:thin:@localhost:1521:xe";
         String user = "system";
         String password = "1111";
         Class.forName(driver);
         Connection con=DriverManager.getConnection(url, user, password);
         return con;
   }
   
   //데이터 목록 메서드
    public ArrayList<ReplyVO> list()throws Exception{
        ArrayList<ReplyVO> array=new ArrayList<ReplyVO>();
        String sql="select * from tab_reply order by rnum desc";
        PreparedStatement ps=con().prepareStatement(sql);
        ResultSet rs=ps.executeQuery();
        while(rs.next()) {
           ReplyVO vo=new ReplyVO();
           vo.setRnum(rs.getInt("rnum"));
           vo.setContent(rs.getString("content"));
           vo.setWdate(rs.getTimestamp("wdate"));
           vo.setCnt(rs.getInt("cnt"));
           array.add(vo);
        }
        return array;
     }
	
	//목록입력 method
	public void insert(String content) throws Exception{
		String sql="insert into tab_reply(rnum, content, wdate)values(seq_rnum.nextval, ?, sysdate)";
		PreparedStatement ps=con().prepareStatement(sql);
		ps.setString(1, content);
		ps.execute();
		con().close();
	}
	
	//데이터삭제 method
	public void delete(int rnum) throws Exception{
		String sql="delete from tab_reply where rnum=?";
		PreparedStatement ps=con().prepareStatement(sql);
		ps.setInt(1, rnum);
		ps.execute();
		con().close();
	}
	
	//update cnt method
	public void update(int rnum) throws Exception{
		String sql="update tab_reply set cnt=cnt+1 where rnum=?";
		PreparedStatement ps=con().prepareStatement(sql);
		ps.setInt(1, rnum);
		ps.execute();
		con().close();
	}
}