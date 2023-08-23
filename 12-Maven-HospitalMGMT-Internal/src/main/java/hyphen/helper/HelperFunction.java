package hyphen.helper;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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
		if (formatedType == "/") {
			newFormatedDate = dateArr[2] + "/" + dateArr[1] + "/" + dateArr[0];
		} else {
			newFormatedDate = dateArr[2] + "-" + dateArr[1] + "-" + dateArr[0];
		}
		return newFormatedDate;
	}

	public static String formateDateFirstYear(String getDate, String formatedType) {
    	if(getDate == null) {
    		return "N/A";
    	}		
		String[] dopSplit = getDate.split("/");

		String newFormatedDate;
		if (formatedType == "/") {
			newFormatedDate = dopSplit[2] + "/" + dopSplit[1] + "/" + dopSplit[0];
		} else {
			newFormatedDate = dopSplit[2] + "-" + dopSplit[1] + "-" + dopSplit[0];
		}

		return newFormatedDate;
	}
	
	public static String buttonFormat(String info, String size, String type, String outline) {
		String button = "";
		
		// check button size
		if(size.equals("small")) {
			size = "btn-sm";
		} else if(size.equals("large")) {
			size = "btn-lg";
		} else if(size.equals("normal")) {
			size = "";
		}
		
		// check outline button		
		if(outline.equals("yes")) {
			
			if(type.equals("pending")) {
				outline = "btn-outline-warning";
			} else if(type.equals("ok")) {
				outline = "btn-outline-info";
			} else if(type.equals("success")) {
				outline = "btn-outline-success";
			}
			
		} else {
			outline = "";
		}
		
		// check button type - pending - success - ok
		if(type.equals("pending")) {
			button = "<a href=\"javascript:void(0)\" title=" + info +" class=\"btn " + size + " " + outline + " pending-button crop_div_text\">" +info+ "</a>";
		} else if(type.equals("ok")) {
			button = "<a href=\"javascript:void(0)\" title=" + info + " class=\"btn " + size + " " + outline + " ok-button crop_div_text\">" +info+ "</a>";
		}  else if(type.equals("success")) {
			button = "<a href=\"javascript:void(0)\" title=" + info +" class=\"btn " + size + " " + outline + " success-button crop_div_text\">" +info+ "</a>";
		}
		
		return button;
	}
	
	public static String maskedPassword(String passcode) {
        String masked = "";
        String last2 = passcode.substring(passcode.length() - 2);
       
        for(int i = 0; i < passcode.length() - 2; i++) {
            
            char ch = passcode.charAt(i);
            masked += "*";
        }
        return masked + last2;
	}
	
}


