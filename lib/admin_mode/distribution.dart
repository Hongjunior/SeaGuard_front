import 'package:flutter/material.dart';
import '../filter.dart';
import 'chart/graph1.dart';
import 'chart/graph2.dart';
import 'chart/graph3.dart';

class Distribution extends StatefulWidget {
  const Distribution({super.key});

  @override
  State<Distribution> createState() => DistributionState();
}

class DistributionState extends State<Distribution> {
  String selectedDistrict = '필터'; // 기본 텍스트
  String? selectedPeriod; // 기간 선택을 위한 변수 추가

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
            '분포',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Container(
                    width: 120,
                    height: 40, // 고정 세로 크기
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: const Color(0XFFEBEBEB),
                        width: 1,
                      ),
                    ),
                    child: TextButton(
                      onPressed: () {
                        showGeneralDialog(
                          context: context,
                          barrierDismissible: true,
                          barrierLabel: '필터 설정',
                          pageBuilder: (context, anim1, anim2) {
                            return Center(
                              child: SizedBox(
                                width: MediaQuery.of(context)
                                    .size
                                    .width, // 가로 100%
                                height: 410,
                                child: FilterWidget(
                                  onDistrictSelected: (district) {
                                    setState(() {
                                      selectedDistrict =
                                          district; // 선택된 지역 업데이트
                                    });
                                  },
                                  onPeriodSelected: (period) {
                                    setState(() {
                                      // 선택된 기간 업데이트
                                      selectedPeriod = period;
                                    });
                                  },
                                ), // 필터 위젯 호출
                              ),
                            );
                          },
                          transitionBuilder: (context, anim1, anim2, child) {
                            return SlideTransition(
                              position: Tween<Offset>(
                                      begin: const Offset(0, -1),
                                      end: Offset.zero)
                                  .animate(anim1),
                              child: child,
                            );
                          },
                          transitionDuration: const Duration(milliseconds: 300),
                        );
                      },
                      child: Center(
                        child: Text(
                          selectedDistrict, // 선택된 지역 텍스트 표시
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  if (selectedPeriod != null) // 선택된 기간이 있을 경우에만 표시
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedPeriod = null; // 기간을 선택 해제
                        });
                      },
                      child: Container(
                        height: 40, // 고정 세로 크기
                        padding: const EdgeInsets.symmetric(horizontal: 23),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: const Color(0XFFEBEBEB),
                            width: 1,
                          ),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Text(
                            selectedPeriod!, // 선택된 기간 텍스트 표시
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              '실제 수거량 비교',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              '예측수거량 대비',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: 395,
              height: 250,
              child: const Graph1(),
            ),
            const SizedBox(height: 30),
            const Text(
              '쓰레기 유형별 비율',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: 395,
              height: 250,
              child: const Graph2(),
            ),
            const SizedBox(height: 30),
            const Text(
              '총 수거량 변화추세',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: 395,
              height: 250,
              child: const Graph3(),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
