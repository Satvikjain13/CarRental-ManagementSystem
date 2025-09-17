<%@page import="com.carrental.DbConnect"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
	String email = session.getAttribute("email").toString();
    int uid =1;
    String FullName = "";
	String ContactNo = "";
	String dob = "";
	String Address = "";
	String City = "";
	String Country = "";
	
	try {
		Connection con = DbConnect.Connect();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from users where EmailId='"+ email +"'");
		if (rs.next()) {
			uid=rs.getInt(1);
			FullName = rs.getString(2);
			ContactNo = rs.getString(5);
			dob = rs.getString(6);
			Address = rs.getString(7);
			City = rs.getString(8);
			Country = rs.getString(9);
		}
	} catch (Exception e) {
		System.out.println(e);
	}
%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Car Rental Portal Management System</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@400;500;600;700&family=Rubik&display=swap" rel="stylesheet">

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="../lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="../lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="../css/style.css" rel="stylesheet">
</head>

<body>
    <!-- Topbar Start -->
    <div class="container-fluid bg-dark py-3 px-lg-5 d-none d-lg-block">
        <div class="row">
            <div class="col-md-6 text-center text-lg-left mb-2 mb-lg-0">
                <div class="d-inline-flex align-items-center">
                    <a class="text-body pr-3" href="" style="text-decoration: none"><i class="fa fa-phone-alt mr-2"></i>+91 1234 5678 90</a>
                    <span class="text-body">|</span>
                    <a class="text-body px-3" href="" style="text-decoration: none"><i class="fa fa-envelope mr-2"></i>abc@gmail.com</a>
                </div>
            </div>
            <div class="col-md-6 text-center text-lg-right">
                <div class="d-inline-flex align-items-center">
                    <a class="text-body px-3" href="">
                        <i class="fab fa-facebook-f"></i>
                    </a>
                    <a class="text-body px-3" href="">
                        <i class="fab fa-twitter"></i>
                    </a>
                    <a class="text-body px-3" href="">
                        <i class="fab fa-linkedin-in"></i>
                    </a>
                    <a class="text-body px-3" href="">
                        <i class="fab fa-instagram"></i>
                    </a>
                    <a class="text-body pl-3" href="">
                        <i class="fab fa-youtube"></i>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <!-- Topbar End -->


    <!-- Navbar Start -->
    <div class="container-fluid position-relative nav-bar p-0">
        <div class="position-relative px-lg-5" style="z-index: 9;">
            <nav class="navbar navbar-expand-lg bg-secondary navbar-dark py-3 py-lg-0 pl-3 pl-lg-5">
                <a href="" class="navbar-brand">
                    <h1 class="text-uppercase text-primary mb-1">Car Rental Portal</h1>
                </a>
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-between px-3" id="navbarCollapse">
                    <div class="navbar-nav ml-auto py-0">
                        <a href="userindex.jsp" class="nav-item nav-link active">Home</a>
                        <a href="userabout.jsp" class="nav-item nav-link">About</a>
                        <a href="usercarlist.jsp" class="nav-item nav-link">Car Listing</a>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown"><% out.println(FullName);%></a>
                            <div class="dropdown-menu rounded-0 m-0">
                                <a href="myProfile.jsp" class="dropdown-item">Profile</a>
                                <a href="myBooking.jsp" class="dropdown-item">My Booking</a>
                                <a href="mychangePassword.jsp" class="dropdown-item">Change Password</a>
                                <a href="../logout" class="dropdown-item">Logout</a>
                            </div>
                        </div>
                    </div>
                </div>
            </nav>
        </div>
    </div>
    <!-- Navbar End -->

</body>
</html>