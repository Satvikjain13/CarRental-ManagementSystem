<%@page import="com.carrental.DbConnect"%>
<%@page import="java.sql.*"%>
<%@include file="usernavbar.jsp" %>

<!-- Search Start -->
<div class="container-fluid bg-white pt-3 px-lg-5">
	<form action="searchCarList.jsp" method="post">

		<div class="row mx-n2">
			<div class="col-xl-4 col-lg-4 col-md-6 px-2">
				<select class="custom-select px-4 mb-3" style="height: 50px;"
					name="brand" required>
					<option value="">Select Brand</option>
					<%
						try {
							Connection con = DbConnect.Connect();
							Statement st = con.createStatement();
							ResultSet rs = st.executeQuery("select * from brands");
							while (rs.next()) {
					%>
					<option value="<%=rs.getInt("id")%>"><%=rs.getString("BrandName")%></option>
					<%
						}
						}

						catch (Exception e) {
							System.out.println(e);
						}
					%>
				</select>
			</div>
			<div class="col-xl-4 col-lg-4 col-md-6 px-2">
				<select class="custom-select px-4 mb-3" style="height: 50px;"
					name="fuelType" required>
					<option value="">Select Fuel Type</option>
					<option value="Petrol">Petrol</option>
					<option value="Diesel">Diesel</option>
					<option value="CNG">CNG</option>
				</select>
			</div>

			<div class="col-xl-4 col-lg-4 col-md-6 px-2">
				<button class="btn btn-primary btn-block mb-3" type="submit"
					style="height: 50px;">Search</button>
			</div>
		</div>
	</form>
</div>
<!-- Search End -->

<!-- Rent A Car Start -->
<div class="container-fluid py-5">
	<div class="container pt-5 pb-3">
		<h1 class="display-4 text-uppercase text-center mb-5">Find Your
			Car</h1>
		<div class="row">
			<%
				try {
					Connection con = DbConnect.Connect();
					Statement st = con.createStatement();
					ResultSet rs = st.executeQuery(
							"SELECT vehicles.VehiclesTitle,brands.BrandName,vehicles.PricePerDay,vehicles.FuelType,vehicles.ModelYear,vehicles.id,vehicles.SeatingCapacity,vehicles.VehiclesOverview,vehicles.Vimage1 from vehicles join brands on brands.id=vehicles.VehiclesBrand");
					while (rs.next()) {
			%>

			<div class="col-lg-4 col-md-6 mb-2">
				<a href="vehicleDetails.jsp?id=<%=rs.getInt("id") %>">
					<div class="rent-item mb-4">
						<img class="img-fluid mb-4"
							src="../images1/<%=rs.getString("Vimage1")%>" width="100%"
							height="150px" alt="">
						<h4 class="text-uppercase mb-4"><%=rs.getString("VehiclesTitle")%></h4>
						<div class="d-flex justify-content-center mb-4">
							<div class="px-2">
								<i class="fa fa-car text-primary mr-1"></i> <span><%=rs.getInt("ModelYear")%>Model</span>
							</div>
							<div class="px-2 border-left border-right">
								<i class="fa fa-cogs text-primary mr-1"></i> <span><%=rs.getString("FuelType")%></span>
							</div>
							<div class="px-2">
								<i class="fa fa-road text-primary mr-1"></i> <span><%=rs.getInt("SeatingCapacity")%>Seater</span>
							</div>
						</div>
						<a class="btn btn-primary px-3" href=""><%=rs.getFloat("PricePerDay")%>
							Rs./Day</a>
					</div>
				</a>
			</div>
			<%
				}
				} catch (Exception e) {
					System.out.println(e);
				}
			%>
		</div>
	</div>
</div>
<!-- Rent A Car End -->

<!-- Banner Start -->
<div class="container-fluid py-5">
	<div class="container py-5">
		<div class="row mx-0">
			<div class="col-lg-6 px-0">
				<div
					class="px-5 bg-secondary d-flex align-items-center justify-content-between"
					style="height: 350px;">
					<img class="img-fluid flex-shrink-0 ml-n5 w-50 mr-4"
						src="../img/banner-left.png" alt="">
					<div class="text-right">
						<h3 class="text-uppercase text-light mb-3">Want to be driver?</h3>
						<p class="mb-4">Lorem justo sit sit ipsum eos lorem kasd, kasd
							labore</p>
					</div>
				</div>
			</div>
			<div class="col-lg-6 px-0">
				<div
					class="px-5 bg-dark d-flex align-items-center justify-content-between"
					style="height: 350px;">
					<div class="text-left">
						<h3 class="text-uppercase text-light mb-3">Looking for a car?</h3>
						<p class="mb-4">Lorem justo sit sit ipsum eos lorem kasd, kasd
							labore</p>
					</div>
					<img class="img-fluid flex-shrink-0 mr-n5 w-50 ml-4"
						src="../img/banner-right.png" alt="">
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Banner End -->

<!-- Vendor Start -->
<div class="container-fluid py-5">
	<div class="container py-5">
		<div class="owl-carousel vendor-carousel">
			<div class="bg-light p-4">
				<img src="../img/vendor-1.png" alt="">
			</div>
			<div class="bg-light p-4">
				<img src="../img/vendor-2.png" alt="">
			</div>
			<div class="bg-light p-4">
				<img src="../img/vendor-3.png" alt="">
			</div>
			<div class="bg-light p-4">
				<img src="../img/vendor-4.png" alt="">
			</div>
			<div class="bg-light p-4">
				<img src="../img/vendor-5.png" alt="">
			</div>
			<div class="bg-light p-4">
				<img src="../img/vendor-6.png" alt="">
			</div>
			<div class="bg-light p-4">
				<img src="../img/vendor-7.png" alt="">
			</div>
			<div class="bg-light p-4">
				<img src="../img/vendor-8.png" alt="">
			</div>
		</div>
	</div>
</div>
<!-- Vendor End -->

<%@include file="userfooter.jsp" %>