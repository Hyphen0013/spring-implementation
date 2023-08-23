package hyphen.gallery.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/download-gal-image")
public class DownloadImage extends HttpServlet {
	// Define the size of file
	public final int BUFFER_SIZE = 1024 * 1000;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String fileName = req.getParameter("fileName");
		String path = getServletContext().getRealPath("") + "gallery" + File.separator+fileName;
		
		File file = new File(path);
		OutputStream os = null;
		FileInputStream fis = null;

		
		try {
			
			if(file.exists()) {
				
				// Set on Header 
				resp.setHeader("Content-Disposition", String.format("attachment;filename=\"%s\"", file.getName()));
				resp.setContentType("application/octet-stream");			
				
				os = resp.getOutputStream();
				fis = new FileInputStream(file);
				
				byte[] bf = new byte[BUFFER_SIZE];
				int byteRead = -1;
				
				while((byteRead = fis.read(bf)) != -1) {
					os.write(bf, 0, byteRead);
				}
				
			} else {
				resp.setContentType("text/html");
				resp.getWriter().print("<h4>File Not Found.. </h4>");
			}			
			
		} catch (Exception e) {
			e.printStackTrace();			
		}
		
		finally {
			if(fis != null) {
				fis.close();
			}
			os.flush();
			if(os != null) {
				os.close();
			}			
		}
	}
	
}
