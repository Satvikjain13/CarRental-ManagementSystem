package com.carrental;

public class Vehicles {
	
	private int id;
	private String VehiclesTitle;
	private int VehiclesBrand;
	private String VehiclesOverview;
	private float PricePerDay;
	private String FuelType;
	private int ModelYear;
	private int SeatingCapacity;
	private String Vimage1;
	private String Vimage2;
	private String Vimage3;
	private String Vimage4;
	private String Vimage5;
	private String AirConditioner;
	private String PowerDoorLocks;
	private String AntiLockBrakingSystem;
	private String BrakeAssist;
	private String PowerSteering;
	private String DriverAirbag;
	private String PassengerAirbag;
	private String PowerWindows;
	private String CDPlayer;
	private String CentralLocking;
	private String CrashSensor;
	private String LeatherSeats;
	private String RegDate; 
	private String UpdationDate;
	
	public Vehicles() {
		super();
	}

	public Vehicles(String vehiclesTitle, int vehiclesBrand, String vehiclesOverview, float pricePerDay,
			String fuelType, int modelYear, int seatingCapacity, String airConditioner, String powerDoorLocks, String antiLockBrakingSystem,
			String brakeAssist, String powerSteering, String driverAirbag, String passengerAirbag, String powerWindows,
			String cDPlayer, String centralLocking, String crashSensor, String leatherSeats) {
		super();
		VehiclesTitle = vehiclesTitle;
		VehiclesBrand = vehiclesBrand;
		VehiclesOverview = vehiclesOverview;
		PricePerDay = pricePerDay;
		FuelType = fuelType;
		ModelYear = modelYear;
		SeatingCapacity = seatingCapacity;
		AirConditioner = airConditioner;
		PowerDoorLocks = powerDoorLocks;
		AntiLockBrakingSystem = antiLockBrakingSystem;
		BrakeAssist = brakeAssist;
		PowerSteering = powerSteering;
		DriverAirbag = driverAirbag;
		PassengerAirbag = passengerAirbag;
		PowerWindows = powerWindows;
		CDPlayer = cDPlayer;
		CentralLocking = centralLocking;
		CrashSensor = crashSensor;
		LeatherSeats = leatherSeats;
	} 
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	public String getVehiclesTitle() {
		return VehiclesTitle;
	}
	public void setVehiclesTitle(String vehiclesTitle) {
		VehiclesTitle = vehiclesTitle;
	}

	public int getVehiclesBrand() {
		return VehiclesBrand;
	}
	public void setVehiclesBrand(int vehiclesBrand) {
		VehiclesBrand = vehiclesBrand;
	}

	public String getVehiclesOverview() {
		return VehiclesOverview;
	}
	public void setVehiclesOverview(String vehiclesOverview) {
		VehiclesOverview = vehiclesOverview;
	}

	public float getPricePerDay() {
		return PricePerDay;
	}
	public void setPricePerDay(float pricePerDay) {
		PricePerDay = pricePerDay;
	}

	public String getFuelType() {
		return FuelType;
	}
	public void setFuelType(String fuelType) {
		FuelType = fuelType;
	}

	public int getModelYear() {
		return ModelYear;
	}
	public void setModelYear(int modelYear) {
		ModelYear = modelYear;
	}

	public int getSeatingCapacity() {
		return SeatingCapacity;
	}
	public void setSeatingCapacity(int seatingCapacity) {
		SeatingCapacity = seatingCapacity;
	}

	public String getVimage1() {
		return Vimage1;
	}
	public void setVimage1(String vimage1) {
		Vimage1 = vimage1;
	}

	public String getVimage2() {
		return Vimage2;
	}
	public void setVimage2(String vimage2) {
		Vimage2 = vimage2;
	}

	public String getVimage3() {
		return Vimage3;
	}
	public void setVimage3(String vimage3) {
		Vimage3 = vimage3;
	}

	public String getVimage4() {
		return Vimage4;
	}
	public void setVimage4(String vimage4) {
		Vimage4 = vimage4;
	}

	public String getVimage5() {
		return Vimage5;
	}
	public void setVimage5(String vimage5) {
		Vimage5 = vimage5;
	}

	public String getAirConditioner() {
		return AirConditioner;
	}
	public void setAirConditioner(String airConditioner) {
		AirConditioner = airConditioner;
	}

	public String getPowerDoorLocks() {
		return PowerDoorLocks;
	}
	public void setPowerDoorLocks(String powerDoorLocks) {
		PowerDoorLocks = powerDoorLocks;
	}

	public String getAntiLockBrakingSystem() {
		return AntiLockBrakingSystem;
	}
	public void setAntiLockBrakingSystem(String antiLockBrakingSystem) {
		AntiLockBrakingSystem = antiLockBrakingSystem;
	}

	public String getBrakeAssist() {
		return BrakeAssist;
	}
	public void setBrakeAssist(String brakeAssist) {
		BrakeAssist = brakeAssist;
	}

	public String getPowerSteering() {
		return PowerSteering;
	}
	public void setPowerSteering(String powerSteering) {
		PowerSteering = powerSteering;
	}

	public String getDriverAirbag() {
		return DriverAirbag;
	}
	public void setDriverAirbag(String driverAirbag) {
		DriverAirbag = driverAirbag;
	}

	public String getPassengerAirbag() {
		return PassengerAirbag;
	}
	public void setPassengerAirbag(String passengerAirbag) {
		PassengerAirbag = passengerAirbag;
	}

	public String getPowerWindows() {
		return PowerWindows;
	}
	public void setPowerWindows(String powerWindows) {
		PowerWindows = powerWindows;
	}

	public String getCDPlayer() {
		return CDPlayer;
	}
	public void setCDPlayer(String cDPlayer) {
		CDPlayer = cDPlayer;
	}

	public String getCentralLocking() {
		return CentralLocking;
	}
	public void setCentralLocking(String centralLocking) {
		CentralLocking = centralLocking;
	}

	public String getCrashSensor() {
		return CrashSensor;
	}
	public void setCrashSensor(String crashSensor) {
		CrashSensor = crashSensor;
	}

	public String getLeatherSeats() {
		return LeatherSeats;
	}
	public void setLeatherSeats(String leatherSeats) {
		LeatherSeats = leatherSeats;
	}

	public String getRegDate() {
		return RegDate;
	}
	public void setRegDate(String regDate) {
		RegDate = regDate;
	}

	public String getUpdationDate() {
		return UpdationDate;
	}
	public void setUpdationDate(String updationDate) {
		UpdationDate = updationDate;
	}
	
	
	@Override
	public String toString() {
		return "Vehicles [id=" + id + ", VehiclesTitle=" + VehiclesTitle + ", VehiclesBrand=" + VehiclesBrand
				+ ", VehiclesOverview=" + VehiclesOverview + ", PricePerDay=" + PricePerDay + ", FuelType=" + FuelType
				+ ", ModelYear=" + ModelYear + ", SeatingCapacity=" + SeatingCapacity + ", Vimage1=" + Vimage1
				+ ", Vimage2=" + Vimage2 + ", Vimage3=" + Vimage3 + ", Vimage4=" + Vimage4 + ", Vimage5=" + Vimage5
				+ ", AirConditioner=" + AirConditioner + ", PowerDoorLocks=" + PowerDoorLocks
				+ ", AntiLockBrakingSystem=" + AntiLockBrakingSystem + ", BrakeAssist=" + BrakeAssist
				+ ", PowerSteering=" + PowerSteering + ", DriverAirbag=" + DriverAirbag + ", PassengerAirbag="
				+ PassengerAirbag + ", PowerWindows=" + PowerWindows + ", CDPlayer=" + CDPlayer + ", CentralLocking="
				+ CentralLocking + ", CrashSensor=" + CrashSensor + ", LeatherSeats=" + LeatherSeats + ", RegDate="
				+ RegDate + ", UpdationDate=" + UpdationDate + "]";
	}
}
