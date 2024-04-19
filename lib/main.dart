import 'package:flutter/material.dart';
import 'package:petshop/Ui/taskselector/taskselection.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'petshop',
      theme: ThemeData.dark(),
      home:  TaskSelectionScreen(),
    );
  }
}
