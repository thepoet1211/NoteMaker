<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.helper.FactoryProvider" %>
    <%@ page import="org.hibernate.*" %>
    <%@ page import="java.util.*" %>
    <%@ page import="com.entities.Note" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All notes</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
<div class="container">
		<%@include file="navbar.jsp"%>
		<br>
		<h1 class="text-uppercase">All Notes:</h1>
		<div class="row">
		<div class="col-12">
			<%
		Session s=FactoryProvider.getFactory().openSession();
		Query q=s.createQuery("from Note");
		List<Note> list=q.list();
		for(Note note:list)
		{
			%>
			<div class="card mt-3">
  <img class="card-img-top m-4 mx-auto" src="img/notes.png" style="max-width:100px" alt="Card image cap">
  <div class="card-body px-5">
    <h5 class="card-title"><%= note.getTitle() %></h5>
    <p class="card-text"><%= note.getContent() %></p>
    <p class="text-primary"><b><%= "updated on: "+note.getAddeddate() %></b>
    <div class="container text-center mt-2">
     <a href="Edit.jsp?note_id=<%= note.getId() %>" class="btn btn-primary">Edit</a>
    <a href="DeleteServlet?note_id=<%= note.getId() %>" class="btn btn-danger">Delete</a>
    </div>
  </div>
</div>
			
			<%
			
		}
		s.close();
		%>
		
		</div>
		</div>
			</div>
</body>
</html>