import 'package:flutter/material.dart';

class Mypage1 extends StatefulWidget {
  const Mypage1({super.key});

  @override
  State<Mypage1> createState() => Mypage1State();
}

class Mypage1State extends State<Mypage1> {
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
