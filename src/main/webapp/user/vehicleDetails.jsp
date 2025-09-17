<%@page import="com.carrental.DbConnect"%>
<%@page import="java.sql.*"%>
<%@include file="usernavbar.jsp" %>
<!-- Page Header Start -->
<div class="container-fluid page-header" xmlns="http://www.w3.org/1999/html">
    <h1 class="display-3 text-uppercase text-white mb-3">Car Detail</h1>
    <div class="d-inline-flex text-white">
        <h6 class="text-uppercase m-0"><a class="text-white" href="{% url 'userindex' %}">Home</a></h6>
        <h6 class="text-body m-0 px-3">/</h6>
        <h6 class="text-uppercase text-body m-0">Car Detail</h6>
    </div>
</div>
<!-- Page Header Start -->

<!-- Detail Start -->
<div class="container-fluid pt-5">
    <div class="container pt-5">
        <div class="row">
            <div class="col-lg-8 mb-5">
            <%
				int id = Integer.parseInt(request.getParameter("id"));
            	int bid=0;
				try {
					Connection con = DbConnect.Connect();
					Statement st = con.createStatement();
					ResultSet rs = st.executeQuery(
							"SELECT vehicles.*,brands.BrandName,brands.id from vehicles join brands on brands.id=vehicles.VehiclesBrand where vehicles.id="
									+ id + "");
					while (rs.next()) {
						bid = rs.getInt("VehiclesBrand");
			%>
                <h1 class="display-4 text-uppercase mb-5">
                    <%=rs.getString("BrandName")%>,<%=rs.getString("VehiclesTitle")%></h1>
                <div class="row pt-2">
                    <div class="col-md-3 col-6 mb-2">
                        <i class="fa fa-car text-primary mr-2"></i>
                        <span>Model: <%=rs.getInt("ModelYear")%></span>
                    </div>
                    <div class="col-md-3 col-6 mb-2">
                        <i class="fa fa-cogs text-primary mr-2"></i>
                        <span>Fuel Type : <%=rs.getString("FuelType")%></span>
                    </div>
                    <div class="col-md-3 col-6 mb-2">
                        <i class="fa fa-road text-primary mr-2"></i>
                        <span>Capacity : <%=rs.getInt("SeatingCapacity")%> Seat</span>
                    </div>
                    <div class="col-md-3 col-6 mb-2">
                        <i class="fa fa-eye text-primary mr-2"></i>
                        <span>Price : <%=rs.getFloat("PricePerDay")%>/day</span>
                    </div>
                </div>
                <div class="row mx-n2 mb-3">
                    <div class="col-md-3 col-6 px-2 pb-2">
                        <img class="img-fluid w-100" src="../images1/<%=rs.getString("Vimage1")%>" style="width: 100%; height: 150px;">
                    </div>
                    <div class="col-md-3 col-6 px-2 pb-2">
                        <img class="img-fluid w-100" src="../images1/<%=rs.getString("Vimage2")%>" style="width: 100%; height: 150px;">
                    </div>
                    <div class="col-md-3 col-6 px-2 pb-2">
                        <img class="img-fluid w-100" src="../images1/<%=rs.getString("Vimage3")%>" style="width: 100%; height: 150px;">
                    </div>
                    <div class="col-md-3 col-6 px-2 pb-2">
                        <img class="img-fluid w-100" src="../images1/<%=rs.getString("Vimage4")%>" style="width: 100%; height: 150px;">
                    </div>
                </div>
                <div class="container-fluid">
                    <ul class="nav nav-tabs">
                        <li class="active"><a data-toggle="tab" href="#home">Overview</a></li> &nbsp;&nbsp;&nbsp;
                        <li><a data-toggle="tab" href="#menu1">Accessories</a></li>
                    </ul>

                    <div class="tab-content">
                        <div id="home" class="tab-pane fade in active">
                            <h3>Vehicles Overview</h3>
                            <p><%=rs.getString("VehiclesOverview")%></p>
                        </div>
                        <div id="menu1" class="tab-pane fade">
                            <h3>Accessories</h3>
                            <table>

								<tbody>
									<tr>
										<td>Air Conditioner</td>
										  
										<% 
											if(rs.getString("AirConditioner").equalsIgnoreCase("yes")) {
										%>
										
											<td><i class="fa fa-check" aria-hidden="true"></i></td>									
										<%
											} else {
										%>
										
										<td><i class="fas fa-times" aria-hidden="true"></i></td>
										
										<%
											}
										%>
									</tr>
									<tr>
										<th>AntiLock Braking System</th> 
										<% 
											if(rs.getString("AntiLockBrakingSystem").equals("yes")) {
										%>
										<td><i class="fa fa-check" aria-hidden="true"></i></td>
										<%
											} else {
										%>
										
										<td><i class="fas fa-times" aria-hidden="true"></i></td>
										<%
											}
										%> 
									</tr>

									<tr>
										<td>Power Steering</td> 
										<% 
											if(rs.getString("PowerSteering").equals("yes")) {
										%>
										<td><i class="fa fa-check" aria-hidden="true"></i></td>
										<%
											} else {
										%>
										<td><i class="fas fa-times" aria-hidden="true"></i></td>
										<%
											}
										%> 
									</tr>


									<tr>
										<td>Power Windows</td> 
										<% 
											if(rs.getString("PowerWindows").equals("yes")) {
										%>
										<td><i class="fa fa-check" aria-hidden="true"></i></td>
										<%
											} else {
										%>
										<td><i class="fas fa-times" aria-hidden="true"></i></td>
										<%
											}
										%> 
									</tr>

									<tr>
										<td>CD Player</td> 
										<% 
											if(rs.getString("CDPlayer").equals("yes")) {
										%>
										<td><i class="fa fa-check" aria-hidden="true"></i></td>
										<%
											} else {
										%>
										<td><i class="fas fa-times" aria-hidden="true"></i></td>
										<%
											}
										%> 
									</tr>

									<tr>
										<td>Leather Seats</td> 
										<% 
											if(rs.getString("LeatherSeats").equals("yes")) {
										%>
										<td><i class="fa fa-check" aria-hidden="true"></i></td>
										<%
											} else {
										%>
										<td><i class="fas fa-times" aria-hidden="true"></i></td>
										<%
											}
										%> 
									</tr>

									<tr>
										<td>Central Locking</td> 
										<% 
											if(rs.getString("CentralLocking").equals("yes")) {
										%>
										<td><i class="fa fa-check" aria-hidden="true"></i></td>
										<%
											} else {
										%>
										<td><i class="fas fa-times" aria-hidden="true"></i></td>
										<%
											}
										%> 
									</tr>

									<tr>
										<td>Power Door Locks</td> 
										<% 
											if(rs.getString("PowerDoorLocks").equals("yes")) {
										%>
										<td><i class="fa fa-check" aria-hidden="true"></i></td>
										<%
											} else {
										%>
										<td><i class="fas fa-times" aria-hidden="true"></i></td>
										<%
											}
										%> 
									</tr>
									<tr>
										<td>Brake Assist</td>
										<% 
											if(rs.getString("BrakeAssist").equals("yes")) {
										%>
										<td><i class="fa fa-check" aria-hidden="true"></i></td>
										<%
											} else {
										%>
										<td><i class="fas fa-times" aria-hidden="true"></i></td>
										<%
											}
										%> 
									</tr>

									<tr>
										<td>Driver Airbag</td>
										<% 
											if(rs.getString("DriverAirbag").equals("yes")) {
										%>
										<td><i class="fa fa-check" aria-hidden="true"></i></td>
										<%
											} else {
										%>
										<td><i class="fas fa-times" aria-hidden="true"></i></td>
										<%
											}
										%> 
									</tr>

									<tr>
										<td>Passenger Airbag</td>
										<% 
											if(rs.getString("PassengerAirbag").equals("yes")) {
										%>
										<td><i class="fa fa-check" aria-hidden="true"></i></td>
										<%
											} else {
										%>
										<td><i class="fas fa-times" aria-hidden="true"></i></td>
										<%
											}
										%> 
									</tr>

									<tr>
										<td>Crash Sensor</td>
										<% 
											if(rs.getString("CrashSensor").equals("yes")) {
										%>
										<td><i class="fa fa-check" aria-hidden="true"></i></td>
										<%
											} else {
										%>
										<td><i class="fas fa-times" aria-hidden="true"></i></td>
										<%
											}
										%> 
									</tr>
								</tbody>
							</table>
                        </div>

                    </div>
                </div>
                <%
				}
				} catch (Exception e) {
					e.printStackTrace();
				}
			%>
        </div>

        <div class="col-lg-4 mb-5">
            <form action="../bookCar" method="post">
                
                <div class="bg-secondary p-5">
                    <h3 class="text-primary text-center mb-4">Book Now</h3>

                    <div class="form-group">
                        <div class="date" data-target-input="nearest">
                            <input type="date" name="FromDate" class="form-control p-4 datetimepicker-input" placeholder="From Date"
                                   required>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="date" id="date1" data-target-input="nearest">
                            <input type="date" name="ToDate" class="form-control p-4 datetimepicker-input" placeholder="To Date"
                                   required>
                        </div>
                    </div>
                    <div class="form-group">
                        <textarea type="text" name="message" class="form-control p-4" placeholder="Message..." required></textarea>
                    </div>
                    <input type="hidden" name="id" value="<%=id%>" >
                    <input type="hidden" name="email" value="<%out.println(email);%>">
                    <div class="form-group mb-0">
                        <button class="btn btn-primary btn-block" type="submit" style="height: 50px;">Book Now</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</div>
		<%
			String msg = request.getParameter("msg");
			if ("valid".equals(msg)) {
		%>
		<script>
			alert("Your Booking has been Successfully.");
			window.location.assign("userindex.jsp");
		</script>
		<%
			}
		%>
<!-- Detail End -->


<!-- Related Car Start -->
    <div class="container-fluid pb-5">
        <div class="container pb-5">
            <h2 class="mb-4">Related Cars</h2>
            <div class="row">
			<%
				try {
					Connection con = DbConnect.Connect();
					Statement st = con.createStatement();
					ResultSet rs = st.executeQuery(
							"SELECT vehicles.VehiclesTitle,brands.BrandName,vehicles.PricePerDay,vehicles.FuelType,vehicles.ModelYear,vehicles.id,vehicles.SeatingCapacity,vehicles.VehiclesOverview,vehicles.Vimage1 from vehicles join brands on brands.id=vehicles.VehiclesBrand where vehicles.VehiclesBrand="+bid+" and vehicles.id !="+id);
					while (rs.next()) {
			%>
			<div class="col-lg-4 col-md-6 mb-2">
				<a href="vehicleDetails.jsp?id=<%=rs.getInt("id") %>">
					<div class="rent-item mb-4">
						<img class="img-fluid mb-4" src="../images1/<%=rs.getString("Vimage1")%>" width="100%"
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
						<a class="btn btn-primary px-3" href=""><%=rs.getFloat("PricePerDay")%></a>
					</div>
				</a>
			</div>
			<%
				}
				} catch (Exception e) {
					e.printStackTrace();
				}
			%>
		</div>

        </div>
    </div>
    <!-- Related Car End -->

<%@include file="userfooter.jsp" %>