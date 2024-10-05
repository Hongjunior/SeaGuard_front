import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'distribution.dart';
import 'statistics.dart';
import 'admin.dart';

class AdminNavigator extends StatefulWidget {
  final int currentIndex;

  const AdminNavigator({super.key, required this.currentIndex});

  @override
  AdminNavigatorState createState() => AdminNavigatorState();
}

class AdminNavigatorState extends State<AdminNavigator> {
  void _onItemTapped(int index) {
    Widget newScreen;

    // 각 인덱스에 따라 화면을 설정합니다.
    switch (index) {
      case 0:
        newScreen = const Distribution();
        break;
      case 1:
        newScreen = const Statistics();
        break;
      case 2:
        newScreen = const Admin();
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
                  'assets/icons/wifi.svg',
                  color:
                      widget.currentIndex == 0 ? const Color(0xFF407BFF) : null,
                ),
                label: '분포 모드',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/bar.svg',
                  color:
                      widget.currentIndex == 1 ? const Color(0xFF407BFF) : null,
                ),
                label: '통계 모드',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/mypage.svg',
                  color:
                      widget.currentIndex == 2 ? const Color(0xFF407BFF) : null,
                ),
                label: '관리 모드',
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
