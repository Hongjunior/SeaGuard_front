// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'bottom_navigator.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'investigation3.dart';

class Investigation2 extends StatefulWidget {
  const Investigation2({super.key, required this.formData});

  final Map formData;

  @override
  State<Investigation2> createState() => _Investigation2State();
}

class _Investigation2State extends State<Investigation2> {
  int currentStep = 2;
  String? photo;
  String? estimated_litter_amount;
  String? main_litter_type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
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
                    Navigator.of(context).pop();
                  },
                ),
              ),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  '조사 모드',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 12,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: _buildLine(currentStep > 1),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: _buildLine(currentStep > 2),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          _buildCircle('1', currentStep >= 1),
                          const SizedBox(height: 10),
                          const Text('해안 조사', style: TextStyle(fontSize: 16)),
                        ],
                      ),
                      const SizedBox(width: 100),
                      Column(
                        children: [
                          _buildCircle('2', currentStep >= 2),
                          const SizedBox(height: 10),
                          const Text('오염 평가', style: TextStyle(fontSize: 16)),
                        ],
                      ),
                      const SizedBox(width: 100),
                      Column(
                        children: [
                          _buildCircle('3', currentStep >= 3),
                          const SizedBox(height: 10),
                          const Text('조사 완료', style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 40),

              // 오염 정도
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  '오염 정도',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    photo = "촬영한_사진의_경로"; // 예시로 사진 경로 설정
                  });
                },
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF6F9FF),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/camera.svg',
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        '사진 촬영하기',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0XFF407BFF),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // 수거 예측량
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  '수거 예측량',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                width: 395,
                height: 62,
                decoration: BoxDecoration(
                  color: const Color(0xFFF6F9FF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: SvgPicture.asset(
                        'assets/icons/inbox.svg',
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        onChanged: (value) {
                          estimated_litter_amount = value; // 입력한 값을 수거 예측량으로 저장
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: '0',
                          hintStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'L',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 18),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // 주요 쓰레기 선택
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  '주요 쓰레기 선택',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              _buildGarbageOption('폐어구류 (그물, 밧줄, 양식자재 등)'),
              const SizedBox(height: 10),
              _buildGarbageOption('부표류 (스티로폼, 인증, 플라스틱 등)'),
              const SizedBox(height: 10),
              _buildGarbageOption('생활 쓰레기류 (음료수병, 포장비닐, 캔 등)'),
              const SizedBox(height: 10),
              _buildGarbageOption('대형 쓰레기류 (냉장고, 타이어 등)'),
              const SizedBox(height: 10),
              _buildGarbageOption('초목류 (자연목, 인공목 등)'),

              const SizedBox(height: 40),

              // 다음 버튼
              SizedBox(
                width: 395,
                height: 46,
                child: ElevatedButton(
                  onPressed: () {
                    // formData에 추가된 모든 데이터를 Investigation3으로 전달
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Investigation3(
                          formData: {
                            ...widget.formData, // Investigation1에서 받은 데이터
                            'photo': photo, // 촬영한 사진
                            'estimated_litter_amount': double.tryParse(
                                    estimated_litter_amount ?? '0') ??
                                0.0, // 변환
                            'main_litter_type': main_litter_type, // 선택된 주요 쓰레기
                          },
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF407BFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    '다음',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(height: 40)
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigator(currentIndex: 0),
    );
  }

  // 선택된 쓰레기 항목 표시
  Widget _buildGarbageOption(String garbageType) {
    return GestureDetector(
      onTap: () {
        setState(() {
          main_litter_type = garbageType; // 선택된 쓰레기 저장
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: main_litter_type == garbageType
              ? const Color(0xFF407BFF)
              : const Color(0xFFF6F9FF),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              garbageType,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: main_litter_type == garbageType
                    ? Colors.white
                    : Colors.black,
              ),
            ),
            if (main_litter_type == garbageType)
              const Icon(
                Icons.check,
                color: Colors.white,
              ),
          ],
        ),
      ),
    );
  }

  // 동그라미 생성 함수
  Widget _buildCircle(String number, bool isActive) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive
            ? const Color(0xFF407BFF)
            : const Color(0xFFCEE5FF), // 단계에 따라 색상 변경
      ),
      child: Center(
        child: Text(
          number,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  // 선 생성 함수
  Widget _buildLine(bool isActive) {
    return Container(
      width: 140,
      height: 5.5,
      color: isActive
          ? const Color(0xFF407BFF)
          : const Color(0xFFCEE5FF), // 단계에 따라 색상 변경
    );
  }
}
