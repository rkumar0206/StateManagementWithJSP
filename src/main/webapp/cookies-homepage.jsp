<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Learning cookies</title>
</head>
<body>

	<h3>Training Portal</h3>
	
	<!-- read the favorite programming language cookie -->

<%

	// the default... if there are no cookies
	String favLang = "Java";

	Cookie[] theCookies = request.getCookies();
	
	// find our fav language
	
	if (theCookies != null) {
		
		for(Cookie tempCookie : theCookies) {
			
			if("myApp.favoriteLanguage".equals(tempCookie.getName())) {
				
				// decode cookie data.. handle case of language with spaces
				favLang = URLDecoder.decode(tempCookie.getValue(), "UTF-8");
				break;
			}
		}
	}
	
	

%>

<!-- Now show a personalized page.. use the 'favLang' variable -->

	<!--  Show new books for this lang -->
	<h4>New books for <%= favLang %></h4>
	
	<ul>
		<li>blah blah blah</li>
		<li>blah blah blah</li>
		<li>blah blah blah</li>
	</ul>

	<h4>Latest news for <%= favLang %></h4>
	
	<ul>
		<li>blah blah blah</li>
		<li>blah blah blah</li>
	</ul>
	
	<h4>Hot jobs for <%= favLang %></h4>
	
	<ul>
		<li>blah blah blah</li>
		<li>blah blah blah</li>
		<li>blah blah blah</li>
		<li>blah blah blah</li>
	</ul>

<hr>

<a href="cookies-personalize-form.html">Personalize this page</a>


</body>
</html>