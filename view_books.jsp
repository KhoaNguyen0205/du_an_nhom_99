<%@page import="com.entity.BookDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>

	<%
	int bid = Integer.parseInt(request.getParameter("bid"));
	BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
	BookDtls b = dao.getBookById(bid);
	%>


	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img src="book/<%=b.getPhotoName()%>"
					style="height: 300px; width: 200px"> <br>
				<h4 class="mt-3">
					LOT: <span class="text-success"><%=b.getBookName()%></span>
				</h4>
				<h4>
					ROOM NUMBER:<span class="text-success"><%=b.getAuthor()%></span>
				</h4>
				<h4>
					TYPE: <span class="text-success"><%=b.getBookCategory()%></span>
				</h4>
			</div>

			<div class="col-md-6 text-center p-5 border bg-white">
				<h2>LOT: <%=b.getBookName()%></h2>

				


				<div class="row">
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-money-bill-1-wave fa-2x"></i>
						<p>Cash on Checkout</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-arrow-rotate-left fa-2x"></i>
						<p>Return Available</p>
					</div>
					
                  
                  </div>
                  <%
                  if("Old".equals(b.getBookCategory()))
                  {
                  %>
                
				<div class="text-center p-3">
					<a href="index.jsp" class="btn btn-success"><i class="fas fa-cart-plus"></i>
						Continue Shopping</a> <a href="" class="btn btn-danger">200 <i
						class="fa-solid fa-dollar-sign"></i></a>
				</div>
                  <% 	  
                  }else {%>
                	  <div class="text-center p-3">
					<a href="" class="btn btn-primary"><i class="fas fa-cart-plus"></i>
						Booking Now</a> <a href="" class="btn btn-danger">200 <i
						class="fa-solid fa-dollar-sign"></i></a>
				</div>
                  <% 
                  }
                  %>


			</div>
		</div>
	</div>
</body>
</html>