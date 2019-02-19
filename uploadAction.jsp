<%@ page import="file.FileATO" %>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv= "Content-Type" content="text/html; charset="UTF-8">
<title>JSP File Upload</title>
</head>
<body>
	<%
		String directory = application.getRealPath("/upload/");
		int maxSize = 1024 * 1024 * 100;
		String encodiog = "UTF-8";
		
		MultipartRequest multipartRequest
		= new MultipartRequest(request,directory,maxSize,encoding,
				new DefaultFileRenamePolicy());
		
		String fileName = multipartRequest.getOriginalFileName("file");
		String fileRealName = multipartRequest.getFileSystemName("file");
		
		new FileATO().upload(fileName, fileRealName);
		out.write("파일명 : " + fileName+ "<br>");
		out.write("실제 파일명 : " + fileRealName + "<br>");
	%>
	
</body>
</html>