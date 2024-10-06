import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math'; // 랜덤 기능을 위한 import
import 'admin_navigator.dart';

class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  State<Admin> createState() => AdminState();
}

class AdminState extends State<Admin> {
  bool isSearchActive = false; // 검색창 활성화 여부
  TextEditingController searchController = TextEditingController();

  final List<String> names = [
    '김철수',
    '이영희',
    '박민수',
    '정하나',
    '최지훈',
    '이수정',
    '강태우',
    '박상희',
  ]; // 예시 한글 이름 목록

  final List<String> roles = [
    '청소',
    '조사',
    '운반',
  ]; // 역할 목록

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            const Text(
              '회원 관리',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Spacer(), // 회원 관리 글자와 검색창 사이의 간격 유지
            if (isSearchActive)
              SizedBox(
                width: 280, // 검색창의 너비를 고정
                height: 50, // 검색창의 높이를 고정
                child: TextField(
                  controller: searchController,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: "이름/아이디 검색",
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        setState(() {
                          searchController.clear();
                          isSearchActive = false; // 검색창 닫기
                        });
                      },
                    ),
                    filled: true,
                    fillColor: const Color(0xFFF6F9FF),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
          ],
        ),
        actions: [
          if (!isSearchActive)
            IconButton(
              onPressed: () {
                setState(() {
                  isSearchActive = true; // 검색창 활성화
                });
              },
              icon: SvgPicture.asset(
                'assets/icons/search2.svg',
              ),
            ),
          const SizedBox(width: 10), // 두 아이콘 사이 간격
          IconButton(
            onPressed: () {
              // 사용자 추가 기능을 추가할 곳
            },
            icon: SvgPicture.asset(
              'assets/icons/user_plus.svg',
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView.builder(
          itemCount: 21, // 첫 번째 항목 + 랜덤 항목 20개
          itemBuilder: (context, index) {
            if (index == 0) {
              // 첫 번째 항목: 제목
              return const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        '이름', // 왼쪽: 이름
                        style: TextStyle(
                          fontSize: 16, // 글씨 크기 16
                          fontWeight: FontWeight.w600, // 폰트 웨이트 600
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Text(
                      '아이디', // 가운데: 아이디
                      style: TextStyle(
                        fontSize: 16, // 글씨 크기 16
                        fontWeight: FontWeight.w600, // 폰트 웨이트 600
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        '역할', // 오른쪽: 역할
                        style: TextStyle(
                          fontSize: 16, // 글씨 크기 16
                          fontWeight: FontWeight.w600, // 폰트 웨이트 600
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              // 랜덤 항목
              final random = Random();
              final name = names[random.nextInt(names.length)];
              final id = 'user${index - 1}'; // 예시 영어 아이디
              final role = roles[random.nextInt(roles.length)];

              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Align(
                  child: Container(
                    width: 370, // 가로 350
                    height: 50, // 세로 40
                    decoration: BoxDecoration(
                      color: const Color(0xFFF6F9FF), // 배경색 F6F9FF
                      borderRadius: BorderRadius.circular(10), // 둥글기 10
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey, // 그림자 색상
                          blurRadius: 4, // 흐림 정도
                          offset: Offset(0, 1), // 그림자의 위치
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            name, // 랜덤 이름
                            style: const TextStyle(
                              fontSize: 12, // 글씨 크기 12
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Text(
                          id, // 랜덤 아이디
                          style: const TextStyle(
                            fontSize: 12, // 글씨 크기 12
                            color: Colors.black,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text(
                            role, // 랜덤 역할
                            style: const TextStyle(
                              fontSize: 12, // 글씨 크기 12
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
      bottomNavigationBar: const AdminNavigator(currentIndex: 2),
    );
  }
}
