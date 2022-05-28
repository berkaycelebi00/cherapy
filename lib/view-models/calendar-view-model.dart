import 'package:cheraphy/base/calendar.dart';
import 'package:cheraphy/models/calendar.dart';
import 'package:cheraphy/services/calendar-service.dart';
import 'package:flutter/material.dart';

class CalendarViewModel extends CalendarBase with ChangeNotifier {
  List<Calendars> calendars = [];
  CalendarService calendarService = CalendarService();
  @override
  Future<bool> addNewCalendar(int profId, Calendars calendar) async {
    var success = await calendarService.addNewCalendar(profId, calendar);
    return success;
  }

  @override
  Future<bool> deleteCalendarById(int calendarId) async {
    var success = await calendarService.deleteCalendarById(calendarId);
    return success;
  }

  @override
  Future<List<Calendars>> getAllCalendarsByProfessionalId(
      int professionalId) async {
    calendars =
        await calendarService.getAllCalendarsByProfessionalId(professionalId);
    return calendars;
  }

  @override
  Future<bool> updateCalendar(int calendarId, Calendars calendar) async {
    var success = await calendarService.updateCalendar(calendarId, calendar);
    return success;
  }
}
