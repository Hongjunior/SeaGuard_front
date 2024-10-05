import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Graph1 extends StatelessWidget {
  const Graph1({super.key});

  @override
  Widget build(BuildContext context) {
    // 예시 데이터 (해안명과 수거량 및 예측량)
    List<LitterData> litterData = [
      LitterData('해안 A', 200, 300), // 수거량, 예측량
      LitterData('해안 B', 350, 450),
      LitterData('해안 C', 450, 600),
      LitterData('해안 D', 300, 400),
    ];

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF203859), // 배경색
        borderRadius: BorderRadius.circular(10), // 둥글게
      ),
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: 600, // y축 최대값 설정
          minY: 0, // y축 최소값 설정
          gridData: FlGridData(show: false), // 눈금 숨기기
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (double value, TitleMeta meta) {
                  final index = value.toInt();
                  if (index < 0 || index >= litterData.length) {
                    return const Text('');
                  }
                  return Text(litterData[index].coastName);
                },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40, // 여백 확보
                getTitlesWidget: (double value, TitleMeta meta) {
                  return Container(
                    margin: const EdgeInsets.only(right: 8.0), // 오른쪽 여백
                    child: Text('${value.toInt()} m'),
                  );
                },
              ),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: false, // 오른쪽 제목 숨기기
              ),
            ),
          ),
          borderData: FlBorderData(show: false), // 테두리 숨기기
          barGroups: litterData.map((data) {
            return BarChartGroupData(
              x: litterData.indexOf(data),
              barRods: [
                BarChartRodData(
                  toY: data.collectedVolume, // 수거량
                  color: const Color(0xFF00FECD), // 막대 색상
                  width: 15, // 막대 너비
                ),
                BarChartRodData(
                  toY: data.predictedVolume, // 예측량
                  color: const Color(0xFFFF2873), // 예측량 색상
                  width: 15, // 막대 너비
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}

// 가상의 LitterData 클래스 (해안명과 수거량, 예측량 저장)
class LitterData {
  final String coastName; // 해안명
  final double collectedVolume; // 수거량
  final double predictedVolume; // 예측량

  LitterData(this.coastName, this.collectedVolume, this.predictedVolume);
}
