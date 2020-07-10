package ex01;

import java.sql.*;
import java.util.*;
import org.json.simple.*;

public class SDAO {
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
	
	//�л� ����Ÿ ���
	public JSONObject slist()throws Exception{
		JSONObject jObject=new JSONObject();
		String sql="select * from student";
		PreparedStatement ps=con().prepareStatement(sql);
		ResultSet rs=ps.executeQuery();
		
		JSONArray sArray=new JSONArray();
		while(rs.next()) {
			JSONObject obj=new JSONObject();
			obj.put("scode", rs.getString("scode"));
			obj.put("sname", rs.getString("sname"));
			obj.put("dept", rs.getString("dept"));
			sArray.add(obj);
		}
		jObject.put("sArray", sArray);
		return jObject;
	}

	//�л������� �Է� method
	public JSONObject sinsert(SVO vo) throws Exception{
		JSONObject jObject=new JSONObject();
		String sql="{call add_student(?,?,?,?,?)}";
		CallableStatement cs=con().prepareCall(sql);
		cs.setString(1, vo.getScode());
		cs.setString(2, vo.getSname());
		cs.setString(3, vo.getDept());
		cs.registerOutParameter(4, oracle.jdbc.OracleTypes.NUMBER);
		cs.registerOutParameter(5, oracle.jdbc.OracleTypes.CURSOR);
		cs.execute();
		
		jObject.put("cnt", cs.getInt(4));
		ResultSet rs=(ResultSet)cs.getObject(5);
		JSONArray sArray=new JSONArray();
		while(rs.next()) {
			JSONObject obj=new JSONObject();
			obj.put("scode", rs.getString("scode"));
			obj.put("sname", rs.getString("sname"));
			obj.put("dept", rs.getString("dept"));
			sArray.add(obj);
		}
		jObject.put("sArray", sArray);
		con().close();
		return jObject;
	}
	
	//�л������� ���� method
	public JSONObject sdelete(String scode) throws Exception{
		JSONObject jObject=new JSONObject();
		String sql="{call del_student(?,?)}";
		CallableStatement cs=con().prepareCall(sql);
		cs.setString(1, scode);
		cs.registerOutParameter(2, oracle.jdbc.OracleTypes.NUMBER);
		cs.execute();
		
		jObject.put("cnt", cs.getInt(2));
		
		con().close();
		return jObject;
	}
	
	
	
	
	
	
	//���� ����Ÿ ���
	public JSONObject clist()throws Exception{
		JSONObject jObject=new JSONObject();
		String sql="select * from course";
		PreparedStatement ps=con().prepareStatement(sql);
		ResultSet rs=ps.executeQuery();
		
		JSONArray cArray=new JSONArray();
		while(rs.next()) {
			JSONObject obj=new JSONObject();
			obj.put("lcode", rs.getString("lcode"));
			obj.put("lname", rs.getString("lname"));
			cArray.add(obj);
		}
		jObject.put("cArray", cArray);
		return jObject;
	}
	
	//���µ����� �Է� method
	public JSONObject cinsert(SVO vo) throws Exception{
		JSONObject jObject=new JSONObject();
		String sql="{call add_course(?,?,?)}";
		CallableStatement cs=con().prepareCall(sql);
		cs.setString(1, vo.getLcode());
		cs.setString(2, vo.getLname());
		cs.registerOutParameter(3, oracle.jdbc.OracleTypes.NUMBER);
		cs.execute();
		
		jObject.put("cnt", cs.getInt(3));
		con().close();
		return jObject;
	}
	
	//���µ����� ���� method
	public JSONObject cdelete(String lcode) throws Exception{
		JSONObject jObject=new JSONObject();
		String sql="{call del_course(?,?)}";
		CallableStatement cs=con().prepareCall(sql);
		cs.setString(1, lcode);
		cs.registerOutParameter(2, oracle.jdbc.OracleTypes.NUMBER);
		cs.execute();
		
		jObject.put("cnt", cs.getInt(2));
		
		con().close();
		return jObject;
	}
	
	//Ư�����¸� ������û�� �л���� method
	public JSONObject cslist(String lcode) throws Exception{
		JSONObject jObject=new JSONObject();
		String sql="{call out_couenr(?,?,?,?)}";
		CallableStatement cs=con().prepareCall(sql);
		cs.setString(1, lcode);
		cs.registerOutParameter(2, oracle.jdbc.OracleTypes.NUMBER);
		cs.registerOutParameter(3, oracle.jdbc.OracleTypes.NUMBER);
		cs.registerOutParameter(4, oracle.jdbc.OracleTypes.CURSOR);
		cs.execute();

		jObject.put("cnt", cs.getInt(2));
		jObject.put("average", cs.getDouble(3));
		ResultSet rs=(ResultSet)cs.getObject(4);
		
		JSONArray jArray=new JSONArray();
		while(rs.next()) {
			JSONObject obj=new JSONObject();
			obj.put("scode", rs.getString("scode"));
			obj.put("sname", rs.getString("sname"));
			obj.put("grade", rs.getString("grade"));
			jArray.add(obj);
		}
		jObject.put("jArray", jArray);
		con().close();
		return jObject;
	}
	
	//��µ� �л���Ͽ��� ���� ���� method
	public void cupdate(int grade, String lcode, String scode) throws Exception{
		String sql="update enrollment set grade=? where lcode=? and scode=?";
		PreparedStatement ps=con().prepareStatement(sql);
		ps.setInt(1, grade);
		ps.setString(2, lcode);
		ps.setString(3, scode);
		ps.execute();
		con().close();
	}
}