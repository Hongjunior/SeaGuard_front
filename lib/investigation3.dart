// ignore_for_file: use_build_context_synchronously, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'bottom_navigator.dart';
import 'investigation4.dart';
import 'api_service.dart';

class Investigation3 extends StatefulWidget {
  final Map<String, dynamic> formData; // 이전 페이지에서 넘겨받은 데이터

  const Investigation3({super.key, required this.formData});

  @override
  State<Investigation3> createState() => _Investigation3State();
}

class _Investigation3State extends State<Investigation3> {
  int currentStep = 3; // 현재 단계를 저장하는 변수

  @override
  Widget build(BuildContext context) {
    // 이전 페이지에서 넘겨받은 이미지 URL 불러오기
    String photo = widget.formData['photo'] ?? 'YOUR_IMAGE_URL_HERE';

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false, // 기본 뒤로 가기 아이콘을 제거
        backgroundColor: Colors.transparent, // 배경색 투명 설정
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
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildSteps(),
            const SizedBox(height: 40),
            const Center(
              child: Text(
                '조사 확인하기',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 20),

            // 필드 데이터를 가로로 보여주기
            _buildHorizontalFieldDisplay(
              '해안명',
              (widget.formData['coast_name'] == null ||
                      widget.formData['coast_name'].isEmpty)
                  ? '입력 필요'
                  : widget.formData['coast_name'],
            ),
            _buildHorizontalFieldDisplay(
              '해안 길이',
              (widget.formData['coast_length'] == null ||
                      widget.formData['coast_length'].isEmpty)
                  ? '0 m'
                  : '${widget.formData['coast_length']} m',
            ),
            _buildHorizontalFieldDisplay(
                '일시', widget.formData['timestamp'] ?? '선택 필요'),
            _buildHorizontalFieldDisplay(
              '위경도',
              '${(widget.formData['latitude'] == null || widget.formData['latitude'].isEmpty) ? '0' : widget.formData['latitude']} , '
                  '${(widget.formData['longitude'] == null || widget.formData['longitude'].isEmpty) ? '0' : widget.formData['longitude']}',
            ),
            _buildHorizontalFieldDisplay('수거 예측량',
                '${widget.formData['estimated_litter_amount'] ?? '0'} L'),
            _buildHorizontalFieldDisplay('주요 쓰레기',
                widget.formData['main_litter_type']?.toString() ?? '선택 필요'),

            // 오염 정도 이미지 표시
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '오염 정도',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 8), // 텍스트와 이미지 사이의 간격
                  Center(
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF6F9FF),
                        borderRadius: BorderRadius.circular(10), // 둥근 테두리
                        image: DecorationImage(
                          image: NetworkImage(
                            photo.isEmpty ? 'YOUR_IMAGE_URL_HERE' : photo,
                          ),
                          fit: BoxFit.cover, // 이미지 비율에 맞게 채우기
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),

            // 조사 완료 버튼
            SizedBox(
              width: 395,
              height: 46,
              child: ElevatedButton(
                onPressed: () async {
                  // 필요한 데이터를 formData에서 가져옵니다.
                  String coast_name = widget.formData['coast_name'] ?? '입력 필요';
                  num coast_length = (widget.formData['coast_length'] != null)
                      ? double.tryParse(widget.formData['coast_length']) ??
                          0 // 문자열을 숫자로 변환
                      : 0; // 기본값 설정
                  String timestamp = widget.formData['timestamp'] ?? '선택 필요';
                  num latitude =
                      (widget.formData['latitude'] ?? 0) as num; // 숫자형으로 변환
                  num longitude =
                      (widget.formData['longitude'] ?? 0) as num; // 숫자형으로 변환
                  num estimated_litter_amount =
                      (widget.formData['estimated_litter_amount'] ?? 0)
                          as num; // 숫자형으로 변환
                  int main_litter_type = (widget.formData['main_litter_type'] ??
                      1) as int; // 정수형으로 변환, 기본값 설정

                  // saveData 함수를 호출하여 데이터를 저장합니다.
                  await saveData(
                    coast_name,
                    widget.formData['investigation_serial_number'] ??
                        'INV123456', // 조사 일련번호 추가
                    coast_name,
                    coast_length,
                    timestamp,
                    latitude,
                    longitude,
                    estimated_litter_amount,
                    main_litter_type,
                  );

                  // 데이터 전송 후 페이지 이동
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Investigation4()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF407BFF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  '해안 조사 완료',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40)
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigator(currentIndex: 0),
    );
  }

  // 동그라미 단계 표시하는 함수
  Widget _buildSteps() {
    return Stack(
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
                const Text('조사 완료', style: TextStyle(fontSize: 16)),
              ],
            ),
          ],
        ),
      ],
    );
  }

  // 필드를 가로로 보여주는 위젯
  Widget _buildHorizontalFieldDisplay(String title, String value) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 18,
                  color: Color(0XFF37474F),
                ),
              ),
            ],
          ),
        ),
        const Divider(
          // Divider 추가
          color: Color(0xFFCEE5FF),
          thickness: 1, // 선의 굵기
        ),
      ],
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
