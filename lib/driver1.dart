import 'package:flutter/material.dart';

class Driver1 extends StatefulWidget {
  const Driver1({super.key});

  @override
  State<Driver1> createState() => Driver1State();
}

class Driver1State extends State<Driver1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Driver1'),
      ),
      body: const Center(
        child: Text('Driver1 Page'),
      ),
    );
  }
}
