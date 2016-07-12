package com.board.util;

public class StringUtil {
	public static String parseBr(String msg){
		
		if(msg == null) return null;
		//글내용보기에서 다음줄로 개행할때 \r\n-><br>를 줘서 출력
		//<pre><%=content%></pre>
		return msg.replace("\r\n", "<br>")
                  .replace("\n", "<br>");
	}
}
