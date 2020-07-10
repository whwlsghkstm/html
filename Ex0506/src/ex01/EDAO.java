package ex01;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class EDAO {
	//�����ͺ��̽� ���� method
	public Connection con() throws Exception{
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "haksa";
		String password = "pass";
		  
		Class.forName(driver);
		Connection con=DriverManager.getConnection(url, user, password);
		  
		return con;
	}
	
	//���¸�� ��� method
	public ArrayList<EVO> clist() throws Exception{
		ArrayList<EVO> carray=new ArrayList<EVO>();
		String sql="select lcode, lname, pname from view_couenr group by lcode, lname, pname";
		PreparedStatement ps=con().prepareStatement(sql);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			EVO vo=new EVO();
			vo.setLcode(rs.getString("lcode"));
			vo.setLname(rs.getString("lname"));
			vo.setPname(rs.getString("pname"));
			carray.add(vo);
		}
		con().close();
		return carray;
	}
	
	//����Ŭ���� ��µǴ� ������û�� �л� ��� method
	public ArrayList<EVO> slist(String lcode) throws Exception{
		ArrayList<EVO> sarray=new ArrayList<EVO>();
		String sql="select scode, sname, grade from view_stuenr where lcode=? group by scode, sname, grade";
		PreparedStatement ps=con().prepareStatement(sql);
		ps.setString(1, lcode);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			EVO vo=new EVO();
			vo.setScode(rs.getString("scode"));
			vo.setSname(rs.getString("sname"));
			vo.setGrade(rs.getInt("grade"));
			sarray.add(vo);
		}
		con().close();
		return sarray;
	}
	
	//�л��� ��û�� ������û ����� ��� method
	public int count(String lcode) throws Exception{
		int count=0;
		String sql="select count(*) from view_couenr where lcode=?";
		PreparedStatement ps=con().prepareStatement(sql);
		ps.setString(1, lcode);
		ResultSet rs=ps.executeQuery();
		if(rs.next()) {
			count=rs.getInt("count(*)");
		}
		con().close();
		return count;
	}
	
	//�л��� ��û�� ���µ��� ������� method
	public double avg(String lcode) throws Exception{
		double avg=0;
		String sql="select avg(grade) from view_couenr where lcode=?";
		PreparedStatement ps=con().prepareStatement(sql);
		ps.setString(1, lcode);
		ResultSet rs=ps.executeQuery();
		if(rs.next()) {
			avg=rs.getDouble("avg(grade)");
		}
		con().close();
		return avg;
	}
}