import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Graph2 extends StatelessWidget {
  const Graph2({super.key});

  @override
  Widget build(BuildContext context) {
    // 예시 데이터 (5가지 분류에 대한 비율)
    final List<double> data = [200, 100, 300, 150, 50]; // 각 분류에 대한 데이터
    final List<String> labels = [
      '폐어구',
      '부표',
      '생활 쓰레기',
      '대형 쓰레기',
      '초목',
    ];

    // 데이터의 총합
    final total = data.reduce((a, b) => a + b);

    return Container(
      width: 395,
      height: 250,
      decoration: BoxDecoration(
        color: const Color(0xFFE6E6E6), // 배경색 설정
        borderRadius: BorderRadius.circular(10), // 테두리 둥글게
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          PieChart(
            PieChartData(
              sections: data.asMap().entries.map((entry) {
                int index = entry.key;
                double value = entry.value;
                double percentage = (value / total) * 100; // 퍼센트 계산
                return PieChartSectionData(
                  value: value,
                  title:
                      '${labels[index]}  ${percentage.toStringAsFixed(1)}%', // 퍼센트 표시
                  color: _getColor(index),
                  radius: 80, // 원의 반지름을 줄임
                  titleStyle: const TextStyle(
                    fontSize: 10, // 글자 크기를 줄임
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                );
              }).toList(),
              borderData: FlBorderData(show: false),
              centerSpaceRadius: 30, // 중앙 공간 크기 조정
              sectionsSpace: 0, // 섹션 간격 조정
            ),
          ),
        ],
      ),
    );
  }

  Color _getColor(int index) {
    switch (index) {
      case 0:
        return Colors.blue; // 폐어구 색상
      case 1:
        return Colors.green; // 부표 색상
      case 2:
        return Colors.orange; // 생활 쓰레기 색상
      case 3:
        return Colors.red; // 대형 쓰레기 색상
      case 4:
        return Colors.purple; // 초목 색상
      default:
        return Colors.grey; // 기본 색상
    }
  }
}
