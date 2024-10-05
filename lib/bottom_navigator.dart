import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'investigation1.dart';
import 'cleaning1.dart';
import 'driver1.dart';
import 'mypage1.dart';

class BottomNavigator extends StatefulWidget {
  final int currentIndex;

  const BottomNavigator({super.key, required this.currentIndex});

  @override
  BottomNavigatorState createState() => BottomNavigatorState();
}

class BottomNavigatorState extends State<BottomNavigator> {
  void _onItemTapped(int index) {
    Widget newScreen;

    // 각 인덱스에 따라 화면을 설정합니다.
    switch (index) {
      case 0:
        newScreen = const Investigation1();
        break;
      case 1:
        newScreen = const Cleaning1();
        break;
      case 2:
        newScreen = const Driver1();
        break;
      case 3:
        newScreen = const Mypage1();
        break;
      default:
        return;
    }

    if (widget.currentIndex != index) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => newScreen),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Divider(
          height: 1,
          thickness: 1,
          color: Colors.grey, // 선의 색상
        ),
        Container(
          color: Colors.transparent,
          height: 70.0, // 세로 높이 설정
          child: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/investigation.svg',
                  color:
                      widget.currentIndex == 0 ? const Color(0xFF407BFF) : null,
                ),
                label: '조사 모드',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/cleaning.svg',
                  color:
                      widget.currentIndex == 1 ? const Color(0xFF407BFF) : null,
                ),
                label: '청소 모드',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/driver.svg',
                  color:
                      widget.currentIndex == 2 ? const Color(0xFF407BFF) : null,
                ),
                label: '운전자 모드',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/mypage.svg',
                  color:
                      widget.currentIndex == 3 ? const Color(0xFF407BFF) : null,
                ),
                label: '마이페이지',
              ),
            ],
            currentIndex: widget.currentIndex,
            selectedItemColor: const Color(0xFF407BFF),
            onTap: _onItemTapped,
            backgroundColor:
                Colors.transparent, // BottomNavigationBar 자체 배경색을 투명으로 설정
            type: BottomNavigationBarType.fixed, // 모든 항목을 고정된 형태로 표시
            elevation: 0, // 그림자 제거
            selectedLabelStyle: const TextStyle(
                fontSize: 12.0, fontWeight: FontWeight.bold), // 선택된 항목의 글씨 스타일
            unselectedLabelStyle: const TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.bold), // 선택되지 않은 항목의 글씨 스타일
          ),
        ),
      ],
    );
  }
}
