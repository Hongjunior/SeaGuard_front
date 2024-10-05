// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'bottom_navigator.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Cleaning4 extends StatefulWidget {
  final Map<String, dynamic> formData; // 이전 페이지에서 넘겨받은 데이터

  const Cleaning4({super.key, required this.formData});

  @override
  State<Cleaning4> createState() => _Cleaning4State();
}

class _Cleaning4State extends State<Cleaning4> {
  int currentStep = 3; // 현재 단계를 저장하는 변수
  bool _isImageVisible = false; // 이미지 표시 여부

  @override
  Widget build(BuildContext context) {
    // 이전 페이지에서 넘겨받은 이미지 URL 불러오기
    String collection_photo =
        widget.formData['collection_photo'] ?? 'YOUR_IMAGE_URL_HERE';
    String completion_photo_landscape =
        widget.formData['completion_photo_landscape'] ?? 'YOUR_IMAGE_URL_HERE';
    String completion_photo_collection_site =
        widget.formData['completion_photo_collection_site'] ??
            'YOUR_IMAGE_URL_HERE';

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildSteps(),
            const SizedBox(height: 40),

            // 사진 표시를 위한 Row 추가
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildImageRowWithSvg(collection_photo, 'assets/change.svg',
                    completion_photo_landscape),
              ],
            ),
            const SizedBox(height: 20),

            const Center(
              // Center 위젯으로 감싸서 중앙 정렬
              child: Text(
                '청소 확인하기',
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
            _buildHorizontalFieldDisplay('청소 수거량',
                '50L  ${widget.formData['calculated_litter_amount'] ?? '0'} 개'),
            _buildHorizontalFieldDisplay(
                '주요 쓰레기', widget.formData['main_litter_type'] ?? '선택 필요'),

            // 집하 장소 이미지 표시
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // 전체 Column의 정렬은 왼쪽
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '집하 장소',
                        style: TextStyle(fontSize: 18),
                      ),
                      // 오른쪽 끝에 아이콘을 위치
                      IconButton(
                        icon: Icon(
                          _isImageVisible
                              ? Icons.keyboard_arrow_up_rounded
                              : Icons.keyboard_arrow_down_rounded,
                          size: 24,
                        ),
                        onPressed: () {
                          setState(() {
                            _isImageVisible = !_isImageVisible; // 이미지 표시 상태 토글
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 8), // 텍스트와 이미지 사이의 간격
                  if (_isImageVisible) // 이미지가 표시될 경우만
                    Center(
                      // 이미지 컨테이너를 중앙에 배치
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF6F9FF),
                          borderRadius: BorderRadius.circular(10), // 둥근 테두리
                          image: DecorationImage(
                            image: NetworkImage(
                              completion_photo_collection_site.isEmpty
                                  ? 'YOUR_IMAGE_URL_HERE'
                                  : completion_photo_collection_site,
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
                onPressed: () {},
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
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigator(currentIndex: 1),
    );
  }

  // 두 사진을 가로로 보여주고 가운데에 change.svg를 넣는 함수
  Widget buildImageRowWithSvg(
      String firstImageUrl, String secondImageUrl, String svgPath) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildImageContainer(firstImageUrl),
        const SizedBox(width: 20),
        SvgPicture.asset(
          'assets/icons/change.svg',
        ),
        const SizedBox(width: 20),
        _buildImageContainer(secondImageUrl),
      ],
    );
  }

  // 두 사진을 가로로 보여주는 위젯
  Widget _buildImageContainer(String imageUrl) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: const Color(0xFFF6F9FF),
        borderRadius: BorderRadius.circular(10), // 둥근 테두리
        image: DecorationImage(
          image: NetworkImage(
              imageUrl.isEmpty ? 'YOUR_IMAGE_URL_HERE' : imageUrl), // 이미지 URL
          fit: BoxFit.cover,
        ),
      ),
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
                const Text('청소 완료', style: TextStyle(fontSize: 16)),
              ],
            ),
          ],
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
