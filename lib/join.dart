import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'login.dart';

class JoinScreen extends StatefulWidget {
  const JoinScreen({super.key});

  @override
  JoinScreenState createState() => JoinScreenState();
}

class JoinScreenState extends State<JoinScreen> {
  String selectedValue = '가입 유형'; // 기본 선택값

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '바다환경지키미',
              style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 80),
            Container(
              width: 395,
              height: 248,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  // 첫 번째 입력 필드 - 이름
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '이름',
                            hintStyle: const TextStyle(
                              color: Color(0xFF999999),
                              fontSize: 16,
                            ),
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 16),
                            prefixIcon: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: SvgPicture.asset(
                                'assets/icons/name.svg',
                              ),
                            ),
                          ),
                          style: const TextStyle(
                            color: Color(0xFF407BFF),
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // 첫 번째 가로 선
                  Container(
                    height: 1,
                    color: const Color(0xFFCEE5FF),
                  ),
                  // 두 번째 입력 필드 - 아이디
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '아이디',
                            hintStyle: const TextStyle(
                              color: Color(0xFF999999),
                              fontSize: 16,
                            ),
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 16),
                            prefixIcon: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: SvgPicture.asset(
                                'assets/icons/id.svg',
                              ),
                            ),
                          ),
                          style: const TextStyle(
                            color: Color(0xFF407BFF),
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // 두 번째 가로 선
                  Container(
                    height: 1,
                    color: const Color(0xFFCEE5FF),
                  ),
                  // 세 번째 입력 필드 - 비밀번호
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '비밀번호',
                            hintStyle: const TextStyle(
                              color: Color(0xFF999999),
                              fontSize: 16,
                            ),
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 16),
                            prefixIcon: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: SvgPicture.asset(
                                'assets/icons/pw.svg',
                              ),
                            ),
                          ),
                          style: const TextStyle(
                            color: Color(0xFF407BFF),
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // 세 번째 가로 선
                  Container(
                    height: 1,
                    color: const Color(0xFFCEE5FF),
                  ),
                  // 네 번째 입력 필드 - 비밀번호 확인
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '비밀번호 확인',
                            hintStyle: const TextStyle(
                              color: Color(0xFF999999),
                              fontSize: 16,
                            ),
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 16),
                            prefixIcon: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: SvgPicture.asset(
                                'assets/icons/pw.svg',
                              ),
                            ),
                          ),
                          style: const TextStyle(
                            color: Color(0xFF407BFF),
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 45),
            Container(
              width: 395, // 외부 컨테이너의 너비를 고정
              height: 53,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 18), // 왼쪽 여백
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SvgPicture.asset(
                      'assets/icons/info.svg',
                    ),
                  ),
                  const Text(
                    '필수',
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF407BFF),
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(width: 16), // 텍스트와 드롭다운 사이에 간격 추가
                  SizedBox(
                    width: 273, // 드롭다운 너비를 아이콘, 텍스트가 차지하는 부분을 제외한 크기로 설정
                    child: DropdownButtonHideUnderline(
                      child: DropdownButtonFormField<String>(
                        value: selectedValue,
                        icon: const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: Color(0xFF979797), // 아이콘 색상 통일
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        style: const TextStyle(
                          fontSize: 16,
                          fontFamily: 'Paperlogy', // 기본 글씨체 설정
                          color: Colors.black,
                        ),
                        dropdownColor: Colors.white, // 드롭다운 열었을 때 색상 설정
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedValue = newValue!;
                          });
                        },
                        items: <String>[
                          '가입 유형',
                          '바다환경 조사',
                          '바다환경 청소',
                          '수거차량 운전',
                          '관리자'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 22),
            Container(
              width: 395, // 외부 컨테이너의 너비를 고정
              height: 53,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 18), // 왼쪽 여백
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SvgPicture.asset(
                      'assets/icons/check.svg',
                    ),
                  ),
                  const Text(
                    '필수',
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF407BFF),
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(width: 16), // 필수와 인증 약관 텍스트 사이에 간격 추가
                  const Text(
                    '인증 약관 전체 동의',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(), // 남은 공간을 차지하여 아이콘을 오른쪽으로 이동
                  const Padding(
                    padding: EdgeInsets.only(right: 24), // 오른쪽 여백
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Color(0xFF979797), // 아이콘 색상 통일
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 80),
            // 가입하기 버튼
            SizedBox(
              width: 395,
              height: 53,
              child: ElevatedButton(
                onPressed: () {
                  // 다시 로그인 페이지로 이동
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  '가입하기',
                  style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF0053F4),
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
