// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'login.dart';

void main() async {
  runApp(const SeaGuardApp());
}

class SeaGuardApp extends StatelessWidget {
  const SeaGuardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '바다 환경 지킴이',
      theme: ThemeData(
        primarySwatch: createMaterialColor(const Color(0xFF407BFF)), // 기본 색상 변경
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: createMaterialColor(const Color(0xFF407BFF)),
        ).copyWith(
          secondary: const Color(0xFF407BFF), // 강조 색상 변경 (accentColor 대신)
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color(0xFF407BFF), // 검색할 때 커서 색상
          selectionColor: Color(0xFF407BFF), // 선택된 텍스트 배경 색상
          selectionHandleColor: Color(0xFF407BFF), // 텍스트 핸들 색상
        ),
        scaffoldBackgroundColor: const Color(0xFF407BFF), // 배경색 설정
        fontFamily: 'Paperlogy', // 앱 전체에 적용할 폰트 지정
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ko', ''), // 한국어 지원
        Locale('en', ''), // 영어 지원
      ],
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('바다환경지킴이'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '바다를 보호합시다!',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // 로그인 화면으로 이동
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              child: const Text('로그인'),
            ),
          ],
        ),
      ),
    );
  }
}

// 커스텀 MaterialColor 생성 함수
MaterialColor createMaterialColor(Color color) {
  List<double> strengths = <double>[.05]; // List 타입을 명시적으로 설정
  Map<int, Color> swatch = {};
  final int r = color.red; // red, green, blue 속성을 사용하는 것으로 변경
  final int g = color.green;
  final int b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}
