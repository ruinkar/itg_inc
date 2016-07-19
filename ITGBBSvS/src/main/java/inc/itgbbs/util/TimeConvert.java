package inc.itgbbs.util;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeConvert {

	
	public Timestamp strToTimeStamp ( String time)
	{
		DateFormat formatter;
	      formatter = new SimpleDateFormat("MM/dd/yyyy");
	      Date date;
	      Timestamp timeStampDate =null;
		try {
			date = (Date) formatter.parse(time);
			timeStampDate = new Timestamp(date.getTime());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	      
	    
		  return timeStampDate;
	}
	
	public String timeStampTostr ( Timestamp time)
	{
		  SimpleDateFormat sdfCurrent = new SimpleDateFormat ("yyyy-MM-dd hh:mm:ss"); 
	      String date = sdfCurrent.format(time); 
	    
		return date;
	}
	
	public String timeStampTostr2 ( Timestamp time)
	{
		SimpleDateFormat sdfCurrent = new SimpleDateFormat ("yyyy-MM-dd hh:mm:ss"); 
	    String date = sdfCurrent.format(time); 
	    
		String yy = date.substring(0,4);
		String mm=date.substring(5, 7);
		String dd=date.substring(8, 10);
		return mm+"/"+dd+"/"+yy;
	}
}
