// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'bottom_navigator.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'cleaning4.dart';

class Cleaning3 extends StatefulWidget {
  const Cleaning3({super.key, required this.formData}); // formData 추가

  final Map formData; // formData를 저장할 변수 추가

  @override
  State<Cleaning3> createState() => _Cleaning3State();
}

class _Cleaning3State extends State<Cleaning3> {
  int currentStep = 2; // 현재 단계를 저장하는 변수
  String? completion_photo_landscape;
  String? completion_photo_collection_site;
  String? litter_bags_count;
  String? main_litter_type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false, // 기본 뒤로 가기 아이콘을 제거
        backgroundColor: Colors.transparent, // 배경색 투명 설정
        title: SizedBox(
          child: Stack(
            alignment: Alignment.center, // Stack 내의 요소들을 중앙에 정렬
            children: [
              Align(
                alignment: Alignment.centerLeft, // 왼쪽에 아이콘 정렬
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 24, // 아이콘 크기 설정
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(); // 이전 화면으로 돌아가기
                  },
                ),
              ),
              const Align(
                alignment: Alignment.center, // 텍스트 중앙 정렬
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30), // 좌우 여백 추가
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // 왼쪽 정렬
            children: [
              // 동그라미 1, 2, 3과 선 연결 + 텍스트 추가
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
                          child: _buildLine(currentStep > 1), // 1-2 선
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: _buildLine(currentStep > 2), // 2-3 선
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
                          const Text('청소 완료', style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 40),

              // 해안 및 집하 장소
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  '해안 및 집하 장소',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 해안 사진
                  InkWell(
                    onTap: () {
                      // 여기에 카메라를 여는 기능을 구현하면 됩니다.
                      // 예: 촬영 후 photo 경로에 저장
                      setState(() {
                        completion_photo_landscape =
                            "촬영한_사진의_경로"; // 예시로 사진 경로 설정
                      });
                    },
                    borderRadius: BorderRadius.circular(10),
                    child: Stack(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF6F9FF),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(height: 25), // 상단에 파란색 영역을 위한 간격
                              SvgPicture.asset(
                                'assets/icons/camera.svg',
                              ),
                              const SizedBox(height: 5), // 아이콘과 텍스트 사이 간격
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
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          height: 24,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Color(0XFF407BFF),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                '해안',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16), // 두 사진 버튼 사이의 간격
                  // 집하 장소 사진
                  InkWell(
                    onTap: () {
                      // 여기에 카메라를 여는 기능을 구현하면 됩니다.
                      // 예: 촬영 후 photo 경로에 저장
                      setState(() {
                        completion_photo_collection_site =
                            "촬영한_사진의_경로"; // 예시로 사진 경로 설정
                      });
                    },
                    borderRadius: BorderRadius.circular(10),
                    child: Stack(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF6F9FF),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(height: 25), // 상단에 파란색 영역을 위한 간격
                              SvgPicture.asset(
                                'assets/icons/camera.svg',
                              ),
                              const SizedBox(height: 5), // 아이콘과 텍스트 사이 간격
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
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          height: 24,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Color(0XFF407BFF),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                '집하 장소',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // 청소 수거량
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  '청소 수거량',
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
                    const Text(
                      '50L',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        onChanged: (value) {
                          litter_bags_count = value; // 입력한 값을 청소 수거량으로 저장
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none, // 기본 테두리 제거
                          hintText: '0',
                          hintStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 22), // 세로 가운데 정렬
                        ),
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.end, // 텍스트를 오른쪽 정렬
                        keyboardType: TextInputType.number, // 숫자만 입력 가능하도록 설정
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      '개',
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
                          builder: (context) => Cleaning4(
                                formData: {
                                  ...widget.formData, // Cleaning2에서 받은 데이터
                                  'completion_photo_landscape':
                                      completion_photo_landscape, // 촬영한 해안 사진
                                  'completion_photo_collection_site':
                                      completion_photo_collection_site, // 촬영한 집하 장소 사진
                                  'litter_bags_count': double.tryParse(
                                          litter_bags_count ?? '0') ??
                                      0.0, // 변환
                                  'main_litter_type':
                                      main_litter_type, // 선택된 주요 쓰레기
                                },
                              )),
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
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigator(currentIndex: 1),
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
                color: main_litter_type == garbageType
                    ? Colors.white
                    : Colors.black,
              ),
            ),
            if (main_litter_type == garbageType) // 선택된 경우 체크 표시
              const Icon(Icons.check, color: Colors.white),
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
