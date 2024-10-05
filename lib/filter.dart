import 'package:flutter/material.dart';

class FilterWidget extends StatefulWidget {
  final Function(String) onDistrictSelected; // 선택된 지역을 전달할 콜백
  final Function(String) onPeriodSelected; // 선택된 기간을 전달할 콜백

  const FilterWidget({
    Key? key,
    required this.onDistrictSelected,
    required this.onPeriodSelected,
  }) : super(key: key);

  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  bool isRegionSelected = true; // 지역 선택 여부
  bool isPeriodSelected = false; // 기간 선택 여부
  List<String> districts = [
    "전체", // 전체 옵션 추가
    "동래구",
    "해운대구",
    "서구",
    "중구",
    "부산진구",
    "연제구",
    "남구",
    "금정구",
    "동구",
    "사하구",
    "사상구",
    "강서구",
    "영도구",
    "북구",
    "기장군",
  ]; // 부산의 모든 구 리스트

  DateTime? startDate; // 시작 날짜
  DateTime? endDate; // 종료 날짜

  // 날짜 형식 포맷 함수
  String formatDate(DateTime date) {
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }

  Future<void> _selectDateRange(BuildContext context) async {
    // 시작 날짜 선택
    final DateTime? pickedStartDate = await showDatePicker(
      context: context,
      initialDate: startDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedStartDate != null && pickedStartDate != startDate) {
      // 종료 날짜 선택
      final DateTime? pickedEndDate = await showDatePicker(
        context: context,
        initialDate: endDate ?? pickedStartDate,
        firstDate: pickedStartDate,
        lastDate: DateTime(2101),
      );

      if (pickedEndDate != null && pickedEndDate != endDate) {
        setState(() {
          startDate = pickedStartDate;
          endDate = pickedEndDate;
        });

        // 선택된 기간을 전달 (형식: 'YYYY-MM-DD - YYYY-MM-DD')
        String formattedPeriod =
            "${formatDate(startDate!)} - ${formatDate(endDate!)}";
        widget.onPeriodSelected(formattedPeriod);
        Navigator.pop(context); // 팝업 닫기
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Material(
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              const SizedBox(height: 5),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.black),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Container(
                color: Colors.white,
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isRegionSelected = true;
                            isPeriodSelected = false;
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            '지역',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color:
                                  isRegionSelected ? Colors.black : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isPeriodSelected = true;
                            isRegionSelected = false;
                          });
                          // 기간 선택 시 달력 호출
                          _selectDateRange(context);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            '기간',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color:
                                  isPeriodSelected ? Colors.black : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 2,
                      color: isRegionSelected ? Colors.black : Colors.grey,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 2,
                      color: isPeriodSelected ? Colors.black : Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Wrap(
                  spacing: 16.0,
                  runSpacing: 8.0,
                  children: [
                    // "전체" 버튼 추가
                    GestureDetector(
                      onTap: () {
                        widget.onDistrictSelected("전체"); // 선택된 지역을 전달
                        Navigator.pop(context); // 팝업 닫기
                      },
                      child: Container(
                        width: 392, // 전체 버튼의 너비
                        height: 40, // 고정 세로 크기
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: const Color(0XFFEBEBEB),
                            width: 1,
                          ),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: const Text(
                            "전체",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    // 기존 지역 목록 생성
                    ...districts.skip(1).map(
                      (district) {
                        return GestureDetector(
                          onTap: () {
                            widget.onDistrictSelected(district); // 선택된 지역을 전달
                            Navigator.pop(context); // 팝업 닫기
                          },
                          child: Container(
                            width: 120,
                            height: 40, // 고정 세로 크기
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
                                district,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // 선택된 기간 표시 추가
              if (startDate != null && endDate != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    '선택된 기간: ${formatDate(startDate!)} - ${formatDate(endDate!)}',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
