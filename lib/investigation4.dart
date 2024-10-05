import 'package:flutter/material.dart';
import 'bottom_navigator.dart';

class Investigation4 extends StatefulWidget {
  const Investigation4({super.key});

  @override
  State<Investigation4> createState() => _Investigation4State();
}

class _Investigation4State extends State<Investigation4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false, // 기본 뒤로 가기 아이콘을 제거
        title: SizedBox(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 24,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(); // 이전 화면으로 돌아가기
                  },
                ),
              ),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  '전경 사진 촬영',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(), // 빈 컨테이너를 반환
      bottomNavigationBar: const BottomNavigator(currentIndex: 0),
    );
  }
}
