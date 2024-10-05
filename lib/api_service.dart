// ignore_for_file: non_constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> saveData(
    String investigator_name,
    String investigation_serial_number,
    String coast_name,
    num coast_length,
    String timestamp,
    num latitude,
    num longitude,
    num estimated_litter_amount,
    int main_litter_type) async {
  final url = 'https://ca91-211-50-45-46.ngrok-free.app/investigation/';
  final response = await http.post(
    Uri.parse(url),
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode({
      'investigator_name': investigator_name,
      'investigation_serial_number': investigation_serial_number,
      'coast_name': coast_name,
      'coast_length': coast_length,
      'timestamp': timestamp,
      'latitude': latitude,
      'longitude': longitude,
      'estimated_litter_amount': estimated_litter_amount,
      'main_litter_type': main_litter_type,
    }),
  );

  if (response.statusCode == 200) {
    if (kDebugMode) {
      print('Data saved successfully!');
    }
  } else {
    if (kDebugMode) {
      print('Failed to save data: ${response.body}');
    }
  }
}
