import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:trando_assignment/models/appointment.dart';
import "package:http/http.dart" as http;

class Api {
  final _baseUrl = "http://65.0.74.155:8000/users/appoinments/";
  Future<List<Appointment>> getAppointments() async {
    List<Appointment> appointments = [];
    try {
      final response = await http.get(Uri.parse("$_baseUrl?user_id=d986bfc1-a9ac-46c8-b3da-017f486e0498"));
      var list = jsonDecode(response.body);
      if (response.statusCode == 200) {
        for (var appointment in list) {
          appointments.add(Appointment.fromJSON(appointment));
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return appointments;
  }

  Future<String> postAppointment() async {
    String response = "Some Error Occured!";
    try {
      final res = await http.post(
        Uri.parse(_baseUrl),
        body: {
          "mentor_id": "b8b2b0c5-efc8-4255-9897-389ac4fa7111",
          "user_id": "d986bfc1-a9ac-46c8-b3da-017f486e0498",
          "mentor_plan_id": "07c4d8f3-0b6f-49d9-b889-219c65d52dae",
          "meeting_datetime": "2022-06-11",
          "meeting_purpose": "Testing Purpose",
          "duration": "10"
        },
      );
      response = res.body;
    } catch (e) {
      response = e.toString();
      debugPrint(e.toString());
    }
    return response;
  }
}
