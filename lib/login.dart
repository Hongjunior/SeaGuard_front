import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_svg/flutter_svg.dart';
import 'mode_select.dart';
import 'join.dart';
import 'admin_mode/statistics.dart'; // 관리자 페이지 import

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    final response = await http.post(
      Uri.parse(
          'https://ca91-211-50-45-46.ngrok-free.app/users/login/'), // 백엔드 로그인 URL
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': _usernameController.text,
        'password': _passwordController.text,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      String role = data['role']; // role 필드로 역할을 확인

      if (role == 'admin') {
        // 사용자가 관리자일 경우 관리자 페이지로 이동
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Statistics(),
          ),
        );
      } else {
        // 일반 사용자일 경우 모드 선택 페이지로 이동
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ModeSelect(),
          ),
        );
      }
    } else {
      // 로그인 실패 처리
      print('로그인 실패: ${response.statusCode}');
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('로그인 실패'),
          content: const Text('아이디 또는 비밀번호가 잘못되었습니다.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('확인'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/images/cleaning.svg'),
              const SizedBox(height: 25),
              const Text(
                '바다환경지키미',
                style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 45),
              // 아이디 입력 필드
              SizedBox(
                width: 300,
                height: 44,
                child: TextField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    hintText: '아이디를 입력해 주세요',
                    hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.white, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.white, width: 1),
                    ),
                    contentPadding: EdgeInsets.fromLTRB(13, 10, 0, 10),
                    filled: false,
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 13),
              // 비밀번호 입력 필드
              SizedBox(
                width: 300,
                height: 44,
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: '비밀번호를 입력해 주세요',
                    hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.white, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.white, width: 1),
                    ),
                    contentPadding: EdgeInsets.fromLTRB(13, 10, 0, 10),
                    filled: false,
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              // 아이디/비밀번호 찾기 버튼
              SizedBox(
                width: 300,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    child: const Text(
                      '아이디 / 비밀번호 찾기',
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // 로그인 버튼
              SizedBox(
                width: 300,
                height: 48,
                child: ElevatedButton(
                  onPressed: _login, // 로그인 함수 호출
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0053F4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    '로그인',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // 회원가입 버튼
              SizedBox(
                width: 300,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    // 회원가입 페이지로 이동
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const JoinScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    '회원가입',
                    style: TextStyle(fontSize: 18, color: Color(0xFF0053F4)),
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
