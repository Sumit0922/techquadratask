import 'dart:io';

import 'package:flutter/material.dart';

class infoscreen extends StatelessWidget {
  final String petImage;
  final String petName;
  final String petType;
  final String petBreed;
  final String petDob;
  final String petGender;
  final String petWeight;
  final String petDescription;

  const infoscreen({
    required this.petImage,
    required this.petName,
    required this.petType,
    required this.petBreed,
    required this.petDob,
    required this.petGender,
    required this.petWeight,
    required this.petDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pet Details'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.file(
              File(petImage),
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20.0),
            Text('Name: $petName'),
            SizedBox(height: 10.0),
            Text('Type: $petType'),
            SizedBox(height: 10.0),
            Text('Breed: $petBreed'),
            SizedBox(height: 10.0),
            Text('Date of Birth: $petDob'),
            SizedBox(height: 10.0),
            Text('Gender: $petGender'),
            SizedBox(height: 10.0),
            Text('Weight: $petWeight'),
            SizedBox(height: 10.0),
            Text('Description: $petDescription'),
          ],
        ),
      ),
    );
  }
}
