// ignore_for_file: non_constant_identifier_names, prefer_is_empty

import 'package:flutter/material.dart';
import 'bottom_navigator.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'date_picker.dart';
import 'investigation2.dart';

class Investigation1 extends StatefulWidget {
  const Investigation1({super.key});

  @override
  State<Investigation1> createState() => _Investigation1State();
}

class _Investigation1State extends State<Investigation1> {
  int currentStep = 1; // 현재 단계를 저장하는 변수
  String coast_name = '';
  String coast_length = '';
  String timestamp = '';
  String latitude = '';
  String longitude = '';

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30), // 좌우 여백 추가
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 동그라미 1, 2, 3과 선 연결 + 텍스트 추가
              Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 12, // 동그라미와의 간격 조정
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
                      // 동그라미 1과 텍스트
                      Column(
                        children: [
                          _buildCircle('1', currentStep >= 1),
                          const SizedBox(height: 10),
                          const Text('해안 조사', style: TextStyle(fontSize: 16)),
                        ],
                      ),
                      const SizedBox(width: 100),
                      // 동그라미 2와 텍스트
                      Column(
                        children: [
                          _buildCircle('2', currentStep >= 2),
                          const SizedBox(height: 10),
                          const Text('오염 평가', style: TextStyle(fontSize: 16)),
                        ],
                      ),
                      const SizedBox(width: 100),
                      // 동그라미 3과 텍스트
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

              // 해안명
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '해안명',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 10),
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
                            'assets/icons/search.svg',
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            onChanged: (value) => setState(() {
                              coast_name = value;
                            }),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: '해안명 검색',
                              hintStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                            ),
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // 해안 길이
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '해안 길이',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 10),
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
                            'assets/icons/length.svg',
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            onChanged: (value) => setState(() {
                              coast_length = value;
                            }),
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
                          'm',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 16),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // 일시
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '일시',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 10),
                  DatePicker(
                    onDateSelected: (String selectedTimestamp) {
                      setState(() {
                        timestamp = selectedTimestamp; // 선택된 날짜 저장
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // 위경도
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '위경도',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 10),
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
                            'assets/icons/location.svg',
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            onChanged: (value) {
                              // 위도와 경도를 콤마로 구분하여 입력받음
                              List<String> latLng = value.split(',');
                              if (latLng.length > 0) {
                                latitude = latLng[0].trim(); // 위도
                              }
                              if (latLng.length > 1) {
                                longitude = latLng[1].trim(); // 경도
                              }
                            },
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: '00.0000 , 00.0000', // 플레이스홀더 텍스트
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
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),

                  // 다음 버튼
                  SizedBox(
                    width: 395,
                    height: 46,
                    child: ElevatedButton(
                      onPressed: () {
                        // 타임스탬프가 비어 있는지 체크
                        if (coast_name.isEmpty ||
                            coast_length.isEmpty ||
                            timestamp.isEmpty ||
                            latitude.isEmpty ||
                            longitude.isEmpty) {
                          // 경고 메시지 표시
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('모든 필드를 입력해주세요.'),
                              backgroundColor: Color(0xFF407BFF),
                            ),
                          );
                          return; // 함수 종료
                        }

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Investigation2(
                              formData: {
                                'coast_name': coast_name,
                                'coast_length':
                                    double.tryParse(coast_length) ?? 0.0,
                                'timestamp': timestamp,
                                'latitude': double.tryParse(latitude) ?? 0.0,
                                'longitude': double.tryParse(longitude) ?? 0.0,
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
                  const SizedBox(height: 40),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigator(currentIndex: 0),
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
