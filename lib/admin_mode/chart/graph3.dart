import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Graph3 extends StatelessWidget {
  const Graph3({super.key});

  @override
  Widget build(BuildContext context) {
    // 예시 데이터: 월별 총 수거량
    final List<double> values = [100, 150, 200, 300, 250, 400]; // 월별 수거량
    final List<String> months = ['1월', '2월', '3월', '4월', '5월', '6월']; // 월 이름

    return Container(
      width: 350, // 그래프의 너비를 줄임
      height: 200, // 그래프의 높이를 줄임
      decoration: BoxDecoration(
        color: const Color(0xFF1E2530), // 배경색 설정
        borderRadius: BorderRadius.circular(10), // 테두리 둥글게
      ),
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false), // 배경 눈금 없애기
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40, // 왼쪽 여백 추가
                getTitlesWidget: (value, meta) {
                  return Text(
                    value.toInt().toString(), // Y축 값을 문자열로 변환하여 표시
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  );
                },
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
                getTitlesWidget: (value, meta) {
                  final monthIndex = value.toInt();
                  // 유효한 인덱스 범위 확인
                  if (monthIndex >= 0 && monthIndex < months.length) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 10.0), // 위쪽 여백 추가
                      child: Text(
                        months[monthIndex],
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    );
                  } else {
                    return const SizedBox(); // 유효하지 않은 인덱스일 경우 빈 위젯 반환
                  }
                },
              ),
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false), // 상단 표기 없애기
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false), // 오른쪽 표기 없애기
            ),
          ),
          borderData: FlBorderData(show: false), // 테두리 없애기
          minX: 0, // X축 최소값을 0으로 설정
          maxX: (values.length - 1).toDouble(), // X축 최대값을 values.length - 1로 설정
          minY: 0,
          maxY: values.reduce((a, b) => a > b ? a : b) + 100, // Y축 최대값 여유 있게 설정
          lineBarsData: [
            LineChartBarData(
              spots: values.asMap().entries.map((entry) {
                int index = entry.key;
                double value = entry.value;
                return FlSpot(index.toDouble(), value);
              }).toList(),
              isCurved: true,
              color: Color(0xFF0DBFE3), // 단일 색상으로 설정
              belowBarData: BarAreaData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}
