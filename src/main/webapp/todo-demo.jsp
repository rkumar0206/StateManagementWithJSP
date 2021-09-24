
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>TO-DO List</title>
</head>
<body>

<!-- Step 1 : Create HTML form -->

	<form action="todo-demo.jsp">
	
		Add new item : <input type="text" name= "theItem"/>
		
		<input type="submit" value="Submit"/>
		
	</form>

<br>

<!-- Step 2 : Add new item to "To-Do" list -->

<%
	
	// get the TO DO items from the session
	
	List<String> items = (List<String>) session.getAttribute("myToDoList");
	
	// if the TO DO items doesn't exist, then create a new one
	
	if (items == null) {
		
		items = new ArrayList<String>();
		session.setAttribute("myToDoList", items);
	}
	
	// see if there is form data to add
	
	String theItem = request.getParameter("theItem");
	
	boolean isItemNotEmpty = theItem != null && !theItem.trim().equals("");
	boolean isItemNotRepeated = theItem != null && !items.contains(theItem);
	
	if(isItemNotEmpty && isItemNotRepeated) {
		
		items.add(theItem);
	}
	

%>


<!-- Step 3 : Display all "To do" item from session -->

<hr>

<strong>To Do List items : </strong><br>

<ol>
	
	<%
		for (String temp : items) {
			
			out.println("<li>" + temp + "</li>");
		}
	%>

</ol>


</body>
</html>