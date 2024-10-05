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
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Text(
            '마이페이지',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          // 세로로 나열
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 395,
              height: 174,
              decoration: BoxDecoration(
                color: Color(0xFFF6F9FF), // 색상 F6F9FF
                borderRadius: BorderRadius.circular(20), // 둥근 테두리 20
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0), // 내용물 여백
                child: Stack(
                  // Stack으로 동그라미와 텍스트를 겹쳐 배치
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center, // 중앙 정렬
                      children: [
                        Text(
                          '김바다', // 이름
                          style: TextStyle(
                            fontSize: 16, // 이름 글씨 크기 16
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8), // 여백 추가
                        Text(
                          '@in002', // 관리자 아이디
                          style: TextStyle(fontSize: 14), // 아이디 글씨 크기 14
                        ),
                      ],
                    ),
                    Positioned(
                      // 오른쪽 위에 동그라미 위치 조정
                      right: 16,
                      top: 16,
                      child: Container(
                        width: 65, // 가로 크기 60
                        height: 25, // 세로 크기 20
                        decoration: BoxDecoration(
                          color: Color(0xFF407BFF), // 색상 407BFF
                          borderRadius: BorderRadius.circular(20), // 둥근 테두리
                        ),
                        alignment: Alignment.center, // 텍스트 중앙 정렬
                        child: const Text(
                          '조사자',
                          style: TextStyle(
                            color: Colors.white, // 흰색 글씨
                            fontSize: 14, // 글씨 크기 14
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20), // 여백 추가
            const Padding(
              padding: EdgeInsets.only(left: 16.0), // "최근 지킨 바다" 여백 추가
              child: Text(
                '최근 지킨 바다',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16), // 여백 추가
            Container(
              width: 395,
              decoration: BoxDecoration(
                color: Color(0xFFFAFAFA), // 색상 FAFAFA
                borderRadius: BorderRadius.circular(10), // 둥근 테두리 10
              ),
              padding: const EdgeInsets.all(16.0), // 내용물 여백
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // 왼쪽 정렬
                children: [
                  _buildDataRow(
                    date: '24.10.04 15:03',
                    location: '송정1길',
                    coordinates: '23.4566, -123.6646',
                  ),
                  _buildDivider(), // 구분선 추가
                  _buildDataRow(
                    date: '24.10.02 11:23',
                    location: '해운대2길',
                    coordinates: '57.5813, -23.5701',
                  ),
                  _buildDivider(), // 구분선 추가
                  _buildDataRow(
                    date: '24.09.28 17:34',
                    location: '광안리',
                    coordinates: '-90.3729, 24.5382',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDataRow(
      {required String date,
      required String location,
      required String coordinates}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // 왼쪽 정렬
      children: [
        Text(
          location, // 해안명
          style: TextStyle(fontSize: 14), // 해안명 글자 크기 14
        ),
        SizedBox(height: 4), // 여백 추가
        Text(
          '날짜: $date',
          style: TextStyle(
              color: Colors.grey[600], fontSize: 10), // 날짜 글자 색상 회색, 글자 크기 10
        ),
        Text(
          '위경도: $coordinates',
          style: TextStyle(
              color: Colors.grey[600], fontSize: 10), // 위경도 글자 색상 회색, 글자 크기 10
        ),
        SizedBox(height: 8), // 여백 추가
      ],
    );
  }

  Widget _buildDivider() {
    return Divider(color: Colors.grey[300]); // 구분선
  }
}
