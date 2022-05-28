import 'package:cheraphy/models/calendar.dart';

abstract class CalendarBase {
  Future<List<Calendars>> getAllCalendarsByProfessionalId(int professionalId);
  Future<bool> deleteCalendarById(int calendarId);
  Future<bool> addNewCalendar(int profId, Calendars calendar);
  Future<bool> updateCalendar(int calendarId, Calendars calendar);
}
