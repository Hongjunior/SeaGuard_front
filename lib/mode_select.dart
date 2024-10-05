import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'investigation1.dart';
import 'cleaning1.dart';

class ModeSelect extends StatelessWidget {
  const ModeSelect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // 기본 뒤로 가기 아이콘 제거
        backgroundColor: Colors.transparent, // AppBar 배경 투명하게 설정
        title: Align(
          alignment: Alignment.centerLeft, // 왼쪽에 아이콘 배치
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white, // 아이콘 색상 설정
              size: 24, // 아이콘 크기 설정
            ),
            onPressed: () {
              Navigator.of(context).pop(); // 뒤로 가기 동작
            },
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                '바다환경지키미',
                style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 22),
              SvgPicture.asset('assets/images/goodboy.svg'),
              const SizedBox(height: 45),
              // 조사모드 버튼
              SizedBox(
                width: 330,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Investigation1()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    '조사 모드',
                    style: TextStyle(fontSize: 20, color: Color(0xFF008CFF)),
                  ),
                ),
              ),
              const SizedBox(height: 35),
              // 청소모드 버튼
              SizedBox(
                width: 330,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Cleaning1()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    '청소 모드',
                    style: TextStyle(fontSize: 20, color: Color(0xFF008CFF)),
                  ),
                ),
              ),
              const SizedBox(height: 35),
              // 운전자모드 버튼
              SizedBox(
                width: 330,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    // 로그인 처리 로직 추가 가능
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    '운전자 모드',
                    style: TextStyle(fontSize: 20, color: Color(0xFF008CFF)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
