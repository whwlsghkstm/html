package ex01;

import java.util.ArrayList;

public class Test {

	public static void main(String[] args) throws Exception{
		
		//목록출력 test
		GoodsDAO dao=new GoodsDAO();
		ArrayList<GoodsVO> array=dao.list();
		for(int i=0; i<array.size(); i++) {
			GoodsVO vo=array.get(i);
			System.out.print(vo.getGnum());
			System.out.print(vo.getGname());
			System.out.println(vo.getPrice());
		}

	}

}
