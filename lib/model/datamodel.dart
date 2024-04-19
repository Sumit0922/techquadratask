class Customer {
  final String userType;
  final bool signUpStatus;
  final String name;
  final String email;
  final String password;
  final String mobileNo;
  final String mapLocation;
  final String latitude;
  final String longitude;
  final String address;
  final String token;
  final String countryCode;

  Customer({
    required this.userType,
    required this.signUpStatus,
    required this.name,
    required this.email,
    required this.password,
    required this.mobileNo,
    required this.mapLocation,
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.token,
    required this.countryCode,
  });
}