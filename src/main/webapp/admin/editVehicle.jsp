<%@page import="java.sql.*"%>
<%@page import="com.carrental.Vehicles"%>
<%@page import="com.carrental.DbConnect"%>
<%@page import="com.carrental.VehicleDAO"%>
<%@include file="adminNavbar.jsp"%>

<div class="content-wrapper">
	<section class="content-header">
		<h1 align="center">
			<i class="fa fa-cab"></i> Update Vehicle <small></small>
		</h1>
	</section>

	<section class="content">
		<div class="row">
			<div class="col-xs-12">
				<div class="box">
					<div class="box-header">
						<h3 class="box-title">
							<i class="fa fa-cab"></i> Update Vehicle
						</h3>
						<%
							int id = Integer.parseInt(request.getParameter("id"));
							VehicleDAO dao = new VehicleDAO(DbConnect.Connect());
							Vehicles b = dao.getVehicleById(id);							
						%>
						<form action="../updateVehicle" method="post" enctype="multipart/form-data">
							<input type="hidden" name="id" value="<%=id%>">

							<div class="modal-body">
								<div class="box box-primary">
									<div class="box-body">

										<div class="row">
											<div class="form-group col-lg-6">
												<label>Vehicle Title</label> <input type="text"
													name="VehiclesTitle" class="form-control"
													value="<%=b.getVehiclesTitle()%>">
											</div>

											<div class="form-group col-lg-6">
												<label>Brand</label> <select name="VehiclesBrand"
													class="form-control" id="VehiclesBrand">
													
													<option value="<%=b.getVehiclesBrand()%>"><%=b.getVehiclesBrand()%></option>
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
										</div>

										<div class="row">
											<div class="form-group col-lg-12">
												<label>Vehical Overview</label>
												<textarea name="VehiclesOverview" class="form-control"><%=b.getVehiclesOverview()%></textarea>
											</div>
										</div>

										<div class="row">
											<div class="form-group col-lg-6">
												<label>Price Per Day(In Rs.)</label> <input type="text"
													name="PricePerDay" class="form-control"
													value="<%=b.getPricePerDay()%>">
											</div>

											<div class="form-group col-lg-6">
												<label>Select Fuel Type</label> <select name="FuelType"
													class="form-control">
													<option value="<%=b.getFuelType()%>"><%=b.getFuelType()%></option>
													<option value="Petrol">Petrol</option>
													<option value="Diesel">Diesel</option>
													<option value="CNG">CNG</option>
												</select>
											</div>
										</div>

										<div class="row">
											<div class="form-group col-lg-6">
												<label>Model Year</label> <input type="text"
													name="ModelYear" class="form-control"
													value="<%=b.getModelYear()%>">
											</div>

											<div class="form-group col-lg-6">
												<label>Seating Capacity</label> <input type="text"
													name="SeatingCapacity" class="form-control"
													value="<%=b.getSeatingCapacity()%>">
											</div>
										</div>

										<h4 style="color: red">Upload Images</h4>
										<br>
										<div class="row">
											<div class="form-group col-lg-3">
												<label>Image 1</label> <input type="file" name="Vimage1"
													class="form-control">
											</div>
											<div class="form-group col-lg-3">
												<img src="../images1/<%=b.getVimage1()%>" name="Vimage1"
													width="100" height="100">
											</div>

											<div class="form-group col-lg-3">
												<label>Image 2</label> <input type="file" name="Vimage2"
													class="form-control">
											</div>
											<div class="form-group col-lg-3">
												<img src="../images1/<%=b.getVimage2()%>" name="Vimage2"
													width="100" height="100">
											</div>

											<div class="form-group col-lg-3">
												<label>Image 3</label> <input type="file" name="Vimage3"
													class="form-control">
											</div>
											<div class="form-group col-lg-3">
												<img src="../images1/<%=b.getVimage3()%>" name="Vimage3"
													width="100" height="100">
											</div>

											<div class="form-group col-lg-3">
												<label>Image 4</label> <input type="file" name="Vimage4"
													class="form-control">
											</div>
											<div class="form-group col-lg-3">
												<img src="../images1/<%=b.getVimage4()%>" name="Vimage4"
													height="100" width="100">
											</div>

											<div class="form-group col-lg-3">
												<label>Image 5</label> <input type="file" name="Vimage5"
													class="form-control">
											</div>
											<div class="form-group col-lg-3">
												<img src="../images1/<%=b.getVimage5()%>" name="Vimage5"
													height="100" width="100">
											</div>
										</div>


										<h4 style="color: red">Accessories</h4>
										<br>
										<div class="row">
											<%
												if (b.getAirConditioner().equals("yes")) {
											%>

											<div class="input-checkbox col-lg-3">
												<label class="label-checkbox"> <input
													type="checkbox" name="AirConditioner" id="AirConditioner"
													checked value="yes"> <span>Air Conditioner</span>
												</label>
											</div>
											<%
												} else {
											%>
											<div class="input-checkbox col-lg-3">
												<label class="label-checkbox"> <input
													type="checkbox" name="AirConditioner" id="AirConditioner"
													value="yes"> <span>Air Conditioner</span>
												</label>
											</div>

											<%
												}
											%>

 
											<%
											if ("yes".equals(b.getPowerDoorLocks())) {
											%>
											<div class="input-checkbox col-lg-3">
												<label class="label-checkbox"> <input
													type="checkbox" name="PowerDoorLocks" id="PowerDoorLocks"
													checked value="yes"> <span>Power Door Locks</span>
												</label>
											</div>
											<%
												} else {
											%>
											<div class="input-checkbox col-lg-3">
												<label class="label-checkbox"> <input
													type="checkbox" name="PowerDoorLocks" id="PowerDoorLocks"
													value="yes"> <span>Power Door Locks</span>
												</label>
											</div>
											<%
												}
											%>

											<%
											if ("yes".equals(b.getAntiLockBrakingSystem())) {
											%>
											<div class="input-checkbox col-lg-3">
												<label class="label-checkbox"> <input
													type="checkbox" name="AntiLockBrakingSystem"
													id="AntiLockBrakingSystem" checked value="yes"> <span>AntiLock
														Braking System</span>
												</label>
											</div>
											<%
												} else {
											%>
											<div class="input-checkbox col-lg-3">
												<label class="label-checkbox"> <input
													type="checkbox" name="AntiLockBrakingSystem"
													id="AntiLockBrakingSystem" value="yes"> <span>AntiLock
														Braking System</span>
												</label>
											</div>
											<%
												}
											%>


											<%
											if ("yes".equals(b.getBrakeAssist())) {
											%>
											<div class="input-checkbox col-lg-3">
												<label class="label-checkbox"> <input
													type="checkbox" name="BrakeAssist" id="BrakeAssist" checked
													value="yes"> <span>Brake Assist</span>
												</label>
											</div>
											<%
												} else {
											%>
											<div class="input-checkbox col-lg-3">
												<label class="label-checkbox"> <input
													type="checkbox" name="BrakeAssist" id="BrakeAssist"
													value="yes"> <span>Brake Assist</span>
												</label>
											</div>
											<%
												}
											%>
										</div>

										<div class="row">
											<%
											if ("yes".equals(b.getPowerSteering())){
											%>

											<div class="input-checkbox col-lg-3">
												<label class="label-checkbox"> <input
													type="checkbox" name="PowerSteering" id="PowerSteering"
													checked value="yes"> <span>Power Steering</span>
												</label>
											</div>
											<%
												} else {
											%>
											<div class="input-checkbox col-lg-3">
												<label class="label-checkbox"> <input
													type="checkbox" name="PowerSteering" id="PowerSteering"
													value="yes"> <span>Power Steering</span>
												</label>
											</div>

											<%
												}
											%>

											<%
											if ("yes".equals(b.getDriverAirbag())){
											%>


											<div class="input-checkbox col-lg-3">
												<label class="label-checkbox"> <input
													type="checkbox" name="DriverAirbag" id="DriverAirbag"
													checked value="yes"> <span>Driver Airbag</span>
												</label>
											</div>
											<%
												} else {
											%>
											<div class="input-checkbox col-lg-3">
												<label class="label-checkbox"> <input
													type="checkbox" name="DriverAirbag" id="DriverAirbag"
													value="yes"> <span>Driver Airbag</span>
												</label>
											</div>
											<%
												}
											%>

											<%
											if ("yes".equals(b.getPassengerAirbag())){
											%>
											<div class="input-checkbox col-lg-3">
												<label class="label-checkbox"> <input
													type="checkbox" name="PassengerAirbag" id="PassengerAirbag"
													checked value="yes"> <span>Passenger Airbag</span>
												</label>
											</div>
											<%
												} else {
											%>
											<div class="input-checkbox col-lg-3">
												<label class="label-checkbox"> <input
													type="checkbox" name="PassengerAirbag" id="PassengerAirbag"
													value="yes"> <span>Passenger Airbag</span>
												</label>
											</div>
											<%
												}
											%>

											<%
											if ("yes".equals(b.getPowerWindows())){
											%>

											<div class="input-checkbox col-lg-3">
												<label class="label-checkbox"> <input
													type="checkbox" name="PowerWindows" id="PowerWindows"
													checked value="yes"> <span>Power Windows</span>
												</label>
											</div>
											<%
												} else {
											%>
											<div class="input-checkbox col-lg-3">
												<label class="label-checkbox"> <input
													type="checkbox" name="PowerWindows" id="PowerWindows"
													value="yes"> <span>Power Windows</span>
												</label>
											</div>
											<%
												}
											%>
										</div>

										<div class="row">
											<%
											if ("yes".equals(b.getCDPlayer())){
											%>

											<div class="input-checkbox col-lg-3">
												<label class="label-checkbox"> <input
													type="checkbox" name="CDPlayer" id="CDPlayer" checked
													value="yes"> <span>CD Player</span>
												</label>
											</div>
											<%
												} else {
											%>
											<div class="input-checkbox col-lg-3">
												<label class="label-checkbox"> <input
													type="checkbox" name="CDPlayer" id="CDPlayer" value="yes">
													<span>CD Player</span>
												</label>
											</div>
											<%
												}
											%>


											<%
											if ("yes".equals(b.getCentralLocking())){
											%>

											<div class="input-checkbox col-lg-3">
												<label class="label-checkbox"> <input
													type="checkbox" name="CentralLocking" id="CentralLocking"
													checked value="yes"> <span>Central Locking</span>
												</label>
											</div>
											<%
												} else {
											%>
											<div class="input-checkbox col-lg-3">
												<label class="label-checkbox"> <input
													type="checkbox" name="CentralLocking" id="CentralLocking"
													value="yes"> <span>Central Locking</span>
												</label>
											</div>
											<%
												}
											%>

											<%
											if ("yes".equals(b.getCrashSensor())){
											%>

											<div class="input-checkbox col-lg-3">
												<label class="label-checkbox"> <input
													type="checkbox" name="CrashSensor" id="CrashSensor" checked
													value="yes"> <span>Crash Sensor</span>
												</label>
											</div>
											<%
												} else {
											%>
											<div class="input-checkbox col-lg-3">
												<label class="label-checkbox"> <input
													type="checkbox" name="CrashSensor" id="CrashSensor"
													value="yes"> <span>Crash Sensor</span>
												</label>
											</div>
											<%
												}
											%>

											<%
											if ("yes".equals(b.getLeatherSeats())){
											%>

											<div class="input-checkbox col-lg-3">
												<label class="label-checkbox"> <input
													type="checkbox" name="LeatherSeats" id="LeatherSeats"
													checked value="yes"> <span>Leather Seats</span>
												</label>
											</div>
											<%
												} else {
											%>
											<div class="input-checkbox col-lg-3">
												<label class="label-checkbox"> <input
													type="checkbox" name="LeatherSeats" id="LeatherSeats"
													value="yes"> <span>Leather Seats</span>
												</label>
											</div>
											<%
												}
											%>
										</div>

									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="submit" class="btn btn-primary">Update</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>
<%
		String msg = request.getParameter("msg");
		if ("valid".equals(msg)) {
	%>
	<script>
		alert("Vehicle has been Updated");
		window.location.assign("manageVehicle.jsp");
	</script>
	<%
		}
	%>
<%@include file="adminFooter.jsp"%>