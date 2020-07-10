package ex01;

import java.util.ArrayList;

public class Test {

	public static void main(String[] args) throws Exception{
		GradeDAO dao=new GradeDAO();
		GradeVO vo=new GradeVO();
		
		//list method
		ArrayList<GradeVO> array=dao.list();
		for(int i=0; i<array.size(); i++) {
			vo=array.get(i);
			System.out.println(vo.getGnum()+"\t"+vo.getGname()+"\t"+vo.getKor()+"\t"+vo.getEng()+"\t"+vo.getMat());
		}
		
		//insert method
		vo=new GradeVO();
		vo.setGname("ÀÌ¸ù·æ");
		vo.setKor(98);
		vo.setEng(84);
		vo.setMat(42);
		dao.list();
		System.out.println(vo.getGnum()+"\t"+vo.getGname()+"\t"+vo.getKor()+"\t"+vo.getEng()+"\t"+vo.getMat());
		
		//update method
		vo=new GradeVO();
		vo.setGnum(2);
		vo.setGname("¼ºÃáÇâ");
		vo.setKor(20);
		vo.setEng(20);
		vo.setMat(20);
		dao.update(vo);
		System.out.println(vo.getGnum()+"\t"+vo.getGname()+"\t"+vo.getKor()+"\t"+vo.getEng()+"\t"+vo.getMat());
		
		//delete method
		
	}

}
