package inc.itgbbs.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import inc.itgbbs.dao.ReviewDao;
import inc.itgbbs.util.ContentPath;

@Controller
public class LocSearchController implements ContentPath {

	private Logger log=Logger.getLogger(this.getClass());

	/*public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
		System.out.println("setMemberDao()호출됨");
	}*/
	
	//요청받아 처리해주는 메서드 작성
	@RequestMapping(EVINFO+"/locSearch.do")
	public ModelAndView process
	             (@RequestParam(value="keyWord",defaultValue="")  //검색어
	                 String keyWord,
	             @RequestParam(value="check",defaultValue="y")  //검색어
    String check){
	
		if(log.isDebugEnabled()){//디버깅모드라면
			log.debug("keyWord="+keyWord);
		}
		
		String dx ="126.9783880";
	    String dy ="37.5666100";
	    String saveAddress="서울특별시";
	    saveAddress = keyWord;
		if (check.equals("n"))
		{
		    String naverUrl = "http://openapi.map.naver.com/api/geocode.php?key=f32441ebcd3cc9de474f8081df1e54e3&encoding=utf-8&coord=LatLng&query=";
		    String address = naverUrl + keyWord;
		    System.out.println(address);
		    
		    URL url;
		    String result = "";
		    
			try {
				url = new URL(address);
				URLConnection connection = url.openConnection();
			    
			    connection.setDoInput(true);
			    BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream()));
			    String inputLine;
			    
			    
			    while((inputLine = br.readLine()) != null) {
			        result += inputLine.trim();
			    }
			    
			    //System.out.println(result);
			    
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		    
		    int total = Integer.parseInt(result.substring(result.indexOf("<total>") +7, result.indexOf("</total>") ) );
		    if (total != 0) {
		    	dx = result.substring(result.indexOf("<x>") +3, result.indexOf("</x>"));
			    dy = result.substring(result.indexOf("<y>") +3, result.indexOf("</y>"));
			}
		    else{saveAddress="서울특별시";}
		    
		    
		}
		ModelAndView mav=new ModelAndView();
		mav.setViewName("LocSearchForm");
		mav.addObject("check", check); // 레코드를 저장한 객체
		mav.addObject("dX", dx); // 레코드를 저장한 객체
		mav.addObject("dY", dy); // 레코드를 저장한 객체
		mav.addObject("address", saveAddress);
		return mav;
	}
}

