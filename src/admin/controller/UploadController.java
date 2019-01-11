package admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import admin.dao.*;

@WebServlet("/UploadFileImage")
public class UploadController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UploadController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		if (isMultipart) {
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			try {
				List items = upload.parseRequest(request);
				Iterator iterator = items.iterator();
				while (iterator.hasNext()) {
					FileItem item = (FileItem) iterator.next();
					if (!item.isFormField()) {
						String fileName = new File(item.getName()).getName();
						String root = getServletContext().getRealPath("/");
						File path = new File(root + "/upload");
						if (!path.exists()) {
							boolean status = path.mkdirs();
						}
						File uploadedFile = new File(path + "/" + fileName);
						String newFileName ="";
							newFileName=fileName;
						admin.model.FileImage fileUp = new admin.model.FileImage(newFileName, "upload/"+fileName, "");
						System.out.println(root+fileUp.getUrl());
						//tạo session lưu lại đường dẫn để lưu vào database
						HttpSession session = request.getSession();
						session.setAttribute("urlImage", "upload/"+fileName);
						
						SaveFileDAO.mapUrlFile.put(fileUp.getName(),fileUp);
						item.write(uploadedFile);
					}
				}
			} catch (	FileUploadException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
