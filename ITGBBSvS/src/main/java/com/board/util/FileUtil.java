package com.board.util;

import java.io.File;

//1.업로드 경로 지정,2.업로드한 파일명을 임의로 변경->노출 X

public class FileUtil {
  //업로드 경로를 지정->절대경로
	public static final String UPLOAD_PATH="C:/web/sou/springfileboard/src/main/webapp/upload";

//1.파일이름변경,변경할 이름을 메서드내부에서 지정
	public static String rename(String filename) throws Exception {
		if(filename==null) return null;//파일업로드가 안됐다면 return null
		//임의의 컴퓨터시간+난수를 결합->문자열 상수->파일명부여
		String newName=Long.toString(System.currentTimeMillis())
				                  +(int)(Math.random()*50);
				
		return rename(filename,newName);
	}
//2.실질적인 파일변경시켜주는 메서드->aaa.txt->확장자를 따로 찾아서 변경된 파일명+확장자
	public static String rename(String filename,String newName)throws Exception{
		if(filename==null) return null;
		//확장자 위치->뒤에서  찾기
		int idx=filename.lastIndexOf(".");
		System.out.println("idx="+idx);
		String extention="";//확장자를 저장
		String newFileName="";//새파일명을 저장
		
		if(idx!=-1){//찾았다면
			extention=filename.substring(idx);
			System.out.println("extention="+extention);//확장자 출력
		}
		//ex) aaa.txt->12334122.txt //인덱스 0~확장자위치까지 지정
		int newIdx=newName.lastIndexOf(".");
		if(newIdx!=-1){
			newName=newName.substring(0,newIdx);
			System.out.println("newName="+newName);//새로운 파일명출력
		} //aaa.TXT->aaa.txt
		//최종적으로 결합->새로운 파일명을 작성 리턴
		newFileName=newName+extention.toLowerCase();//확장자(대->소문자로변경)
		return newFileName;
	}
//3.자료실의 수정->파일업로드 수정->aaa.txt(기존파일 삭제)->abc.gif로 변경(새로 업로드)
	public static void removeFile(String filename){
		File file=new File(UPLOAD_PATH,filename);//경로,불러올 파일명
		//기존의 파일이 삭제되고 다시 업로드가 되는지 확인
		if(file.exists()) file.delete();
	}
}




