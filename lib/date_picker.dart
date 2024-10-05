import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  final Function(String) onDateSelected;

  const DatePicker({super.key, required this.onDateSelected});

  @override
  State<DatePicker> createState() => DatePickerState();
}

class DatePickerState extends State<DatePicker> {
  DateTime selectedDate = DateTime.now();
  String timestamp = '';

  String formatTimestamp(DateTime dateTime) {
    // 서버에서 요구하는 ISO 8601 형식으로 날짜를 포맷
    return DateFormat('yyyy-MM-ddTHH:mm:ss').format(dateTime);
  }

  String formatDisplayDate(DateTime dateTime) {
    // 사용자에게 보여줄 날짜 형식 (예: '2024-10-05 00:00')
    return DateFormat('yyyy년 MM월 dd일 HH:mm').format(dateTime);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      locale: const Locale('ko', 'KR'),
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
      initialTime: TimeOfDay.fromDateTime(DateTime.now()), // 현재 시간을 초기값으로 설정
    );

    if (!mounted) return;

    if (pickedTime != null) {
      setState(() {
        // 현재 날짜와 선택된 시간으로 timestamp 생성
        timestamp = formatTimestamp(DateTime(
          selectedDate.year,
          selectedDate.month,
          selectedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        ));
      });
      widget.onDateSelected(timestamp); // 선택된 날짜 및 시간을 외부로 전달
    } else {
      // 만약 시간이 선택되지 않았다면 현재 시간을 timestamp로 설정
      timestamp = formatTimestamp(DateTime.now());
      widget.onDateSelected(timestamp);
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
                    ? formatDisplayDate(DateTime.parse(timestamp))
                    : formatDisplayDate(DateTime.now()), // 초기값도 현재 시간으로 설정
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
