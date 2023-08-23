package hyphen.gallery.servlet;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import hyphen.conn.DBConnect;
import hyphen.dao.GalleryImageDAO;
import hyphen.entity.GalleryImage;

@WebServlet("/add_gallery_image")
@MultipartConfig
public class UploadImage extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Part part = req.getPart("img_name");
		String fileName = part.getSubmittedFileName();
		
		String img_heading = req.getParameter("img_heading");
		String remarks = req.getParameter("remarks");
		
		Calendar calendar = Calendar.getInstance();
		Date createdAt = new Date(calendar.getTime().getTime());
		
		GalleryImage gallery = new GalleryImage();
		gallery.setImg_name(fileName);
		gallery.setImg_heading(img_heading);
		gallery.setRemarks(remarks);
		gallery.setCreated_at(createdAt);
		
//		String path = getServletContext().getRealPath("") + "gallery";
//		System.out.println(path);
		
		GalleryImageDAO dao = new GalleryImageDAO(DBConnect.getConnection());
		
		boolean check = dao.addGalleryImage(gallery);
		
		HttpSession session = req.getSession();
		if(check) {
			
			// Store image in path
			String path = getServletContext().getRealPath("") + "gallery";
			File file = new File(path);
			part.write(path+file.separator+fileName);
			
			session.setAttribute("successMsg", "Gallery image added successfully");
			resp.sendRedirect("gallery.jsp");
		} else {
			session.setAttribute("errorMsg", "Gallery image failed to add!");
			resp.sendRedirect("gallery.jsp");
		}
	}

}
