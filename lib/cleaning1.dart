// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'bottom_navigator.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'cleaning2.dart';

class Cleaning1 extends StatefulWidget {
  const Cleaning1({super.key});

  @override
  State<Cleaning1> createState() => _Cleaning1State();
}

class _Cleaning1State extends State<Cleaning1> {
  String? collection_photo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                  '청소 모드',
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                // 여기에 카메라를 여는 기능을 구현하면 됩니다.
                // 예: 촬영 후 photo 경로에 저장
                setState(() {
                  collection_photo = "촬영한_사진의_경로"; // 예시로 사진 경로 설정
                });
              },
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: 300, // 가로 300
                height: 300, // 세로 300
                decoration: BoxDecoration(
                  color: const Color(0xFFF6F9FF),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color(0xFF407BFF), // 테두리 색상 407BFF
                    width: 2, // 테두리 굵기 2
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/camera.svg',
                      width: 48, // 가로 48
                      height: 48, // 세로 48
                    ),
                    const SizedBox(height: 10), // 아이콘과 텍스트 사이 간격
                    const Text(
                      '사진 촬영하기',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0XFF407BFF),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20), // 컨테이너와 버튼 사이 간격

            // 청소 시작 버튼
            SizedBox(
              width: 300, // 버튼의 너비
              height: 62, // 버튼의 높이
              child: ElevatedButton(
                onPressed: () {
                  // 사진 정보를 가지고 다음 페이지로 이동
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Cleaning2(
                        formData: {
                          collection_photo: collection_photo,
                        },
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF407BFF), // 버튼 배경색
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // 둥근 모서리 10
                  ),
                ),
                child: const Text(
                  '현장 조사 및 청소 시작',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigator(currentIndex: 1),
    );
  }
}
