import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> createCustomerAccount() async {

  String apiUrl = 'http://3.14.153.182:8000/create_account_customer/';


  Map<String, dynamic> requestBody = {
    "user_type": "Customer",
    "sign_up_status": true,
    "name": "testUser",
    "email": "xyz@gmail.com",
    "password": "12345678",
    "mobile_no": "",
    "map_location": "Delhi",
    "latitude": "21.2536521",
    "longitude": "79.36255222",
    "address": "",
    "token": "",
    "country_code": "+91,IN"
  };

  try {

    var response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(requestBody),
    );


    if (response.statusCode == 200) {
      print('Account created successfully');
      print('Response: ${response.body}');
    } else {
      print('Failed to create account. Error: ${response.statusCode}');
    }
  } catch (error) {
    print('Error creating account: $error');
  }
}

