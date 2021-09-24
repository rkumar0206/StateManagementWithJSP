<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Confirmation</title>
</head>
<%
	// read the form data
	
	String favLang = request.getParameter("favoriteLanguage");

	// encode cookies data.. handle case of languages with white space
	favLang = URLEncoder.encode(favLang,"UTF-8");

	// create the cookie
	Cookie theCookie = new Cookie("myApp.favoriteLanguage", favLang);
	
	// set the life span... total number of seconds
	theCookie.setMaxAge(60*60*24*365); // <-- for one year
	
	// send the cookie to the browser
	response.addCookie(theCookie);
			

%>
<body>

	Thanks! we set your favorite language to : ${param.favoriteLanguage }
	
	<br><br>
	
	<a href="cookies-homepage.jsp">Return to homepage</a>
	
</body>
</html>