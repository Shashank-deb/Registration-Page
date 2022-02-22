package com.shashank;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

/**
 * Servlet implementation class RegisterServlet
 */
@MultipartConfig
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		// getting all the incoming details from the request
		String name = req.getParameter("user_name");
		String password = req.getParameter("user_password");
		String email = req.getParameter("user_email");
		// this is used for image type content
		Part part = req.getPart("image");
		String filename = part.getSubmittedFileName();
		// out.println(filename);

		// creating connection with database
		try {
			// this will sleep the thread to 3 seconds
			Thread.sleep(3000);
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager
					.getConnection("jdbc:mysql://localhost:3306/registration?user=root&password=tiger");
			String query = "insert into user(name,password,email,imageName) values(?,?,?,?)";
			PreparedStatement pstm = con.prepareStatement(query);
			pstm.setString(1, name);
			pstm.setString(2, password);
			pstm.setString(3, email);
			pstm.setString(4, filename);
			pstm.executeUpdate();

			// uploading the file in the server
			InputStream is = part.getInputStream();
			byte[] data = new byte[is.available()];
			is.read(data);
			@SuppressWarnings("deprecation")
			String path = req.getRealPath("/") + "images" + File.separator + filename;
			// out.println(path);
			FileOutputStream fos = new FileOutputStream(path);
			fos.write(data);
			fos.close();
			out.println("done");
		}

		catch (Exception e) {
			e.printStackTrace();
			out.println("error");
		}
	}

}
