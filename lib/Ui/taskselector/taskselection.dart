import 'package:flutter/material.dart';
import 'package:petshop/Ui/availability_screen_ui/availabilityscreen.dart';
import 'package:petshop/Ui/login%20screen/loginscreen.dart';
import 'package:petshop/Ui/new_pet_screen_ui/new_pet_screen.dart';

class TaskSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Selection'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Text('Task 1'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewPet()),
                );
              },
              child: Text('Task 2'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AvailabilityScreen()),
                );
              },
              child: Text('Task 3'),
            ),
          ],
        ),
      ),
    );
  }
}



