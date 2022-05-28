import 'package:cheraphy/base/calendar.dart';
import 'package:cheraphy/constants/api.dart';
import 'package:cheraphy/helpers/api_helper.dart';
import 'package:cheraphy/models/calendar.dart';

class CalendarService extends CalendarBase {
  @override
  Future<bool> addNewCalendar(int profId, Calendars calendar) async {
    APIHelper apiHelper = APIHelper();
    var response = await apiHelper.post(calendar.toJson(),
        endpoint: calendarEndpoint + profId.toString());
    return response["success"];
  }

  @override
  Future<bool> deleteCalendarById(int calendarId) async {
    APIHelper apiHelper = APIHelper();
    var response = await apiHelper.delete(
        endpoint: calendarEndpoint + calendarId.toString());
    return response["success"];
  }

  @override
  Future<List<Calendars>> getAllCalendarsByProfessionalId(
      int professionalId) async {
    APIHelper apiHelper = APIHelper();
    var response = await apiHelper.get(
        endpoint: calendarEndpoint + professionalId.toString());
    Calendar calendar = Calendar.fromJson(response);
    return calendar.calendars!;
  }

  @override
  Future<bool> updateCalendar(int calendarId, Calendars calendar) async {
    Map<String, dynamic> rawCalendar = calendar.toJson();
    rawCalendar.removeWhere((key, value) => value == null);
    print(calendarId);
    APIHelper apiHelper = APIHelper();
    var response = await apiHelper.put(
        endpoint: calendarEndpoint + calendarId.toString(),
        params: rawCalendar);

    return response["success"];
  }
}
