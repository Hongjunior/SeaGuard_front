// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  final Function(String) onDateSelected; // 날짜 선택 콜백 추가

  const DatePicker({super.key, required this.onDateSelected}); // 콜백을 받도록 생성자 수정

  @override
  State<DatePicker> createState() => DatePickerState();
}

class DatePickerState extends State<DatePicker> {
  DateTime selectedDate = DateTime.now();
  String timestamp = ''; // timestamp 변수를 추가

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      locale: const Locale('ko', 'KR'), // 한국어 로케일 설정
    );

    if (!mounted) return;

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
      _selectTime(context); // 날짜가 선택되면 시간 선택 함수 호출
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(selectedDate), // 현재 시간을 초기값으로 설정
    );

    if (!mounted) return;

    if (pickedTime != null) {
      setState(() {
        // 선택된 날짜와 시간으로 timestamp 생성
        timestamp = DateFormat('yy.MM.dd (EEE) HH:mm', 'ko_KR').format(
          DateTime(
            selectedDate.year,
            selectedDate.month,
            selectedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          ),
        );
      });
      widget.onDateSelected(timestamp); // 선택된 날짜 및 시간을 외부로 전달
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: Container(
        width: 395,
        height: 62,
        decoration: BoxDecoration(
          color: const Color(0xFFF6F9FF),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SvgPicture.asset(
                'assets/icons/calendar.svg',
              ),
            ),
            Expanded(
              child: Text(
                timestamp.isNotEmpty
                    ? timestamp
                    : DateFormat('yy.MM.dd (EEE) HH:mm', 'ko_KR')
                        .format(DateTime.now()),
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
