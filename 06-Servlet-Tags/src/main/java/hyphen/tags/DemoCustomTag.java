package hyphen.tags;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class DemoCustomTag extends TagSupport {

	@Override
	public int doStartTag() throws JspException {
		try {
			JspWriter out = pageContext.getOut();
			out.print("<p>New cusom taglib example: </p>");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return SKIP_BODY;
	}

}
