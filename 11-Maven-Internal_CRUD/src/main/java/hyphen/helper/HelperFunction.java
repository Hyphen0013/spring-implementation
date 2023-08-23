package hyphen.helper;

import java.time.LocalDate;
import java.time.Month;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.Locale;

public class HelperFunction {
    public static String formateDate(String getDate, String formatedType) {
    	if(getDate == null) {
    		return "N/A";
    	}
        String[] splitTime = getDate.split(" ");
    	String[] splitDate = splitTime[0].split("-");
    	String formatedDate = splitDate[2] + "-" + splitDate[1] + "-" + splitDate[0];
    	
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy", Locale.ENGLISH);
        LocalDate date = LocalDate.parse(formatedDate, formatter);
        
        String dateString = date.toString();
        String[] dateArr = dateString.split("-");
        
        String newFormatedDate;
        if(formatedType == "/") {
        	newFormatedDate = dateArr[2] + "/" + dateArr[1] + "/" + dateArr[0];
        } else {
        	newFormatedDate = dateArr[2] + "-" + dateArr[1] + "-" + dateArr[0];
        }
                
        
        return newFormatedDate;
    }
    
    public static String formateDateFirstYear(String getDate, String formatedType) {
        String[] dopSplit = getDate.split("/");
    	if(getDate == null) {
    		return "N/A";
    	}        
        String newFormatedDate;
        if(formatedType == "/") {
        	newFormatedDate = dopSplit[2] + "/" + dopSplit[1] + "/" + dopSplit[0];
        } else {
        	newFormatedDate = dopSplit[2] + "-" + dopSplit[1] + "-" + dopSplit[0];
        }
                
        
        return newFormatedDate;
    }    
}
