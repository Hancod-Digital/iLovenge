import 'dart:convert';
import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

String getAirportName(
  String airportCod,
  bool cityOnly,
) {
  final Map<String, String> airports = {
    "SDQ": "Santo Domingo Las Américas, Dominican Republic",
    "MIA": "Miami, USA",
    "LAX": "Los Angeles, USA",
    "SFO": "San Francisco, USA",
    "ORD": "Chicago O'Hare, USA",
    "ATL": "Atlanta, USA",
    "DFW": "Dallas/Fort Worth, USA",
    "DXB": "Dubai, UAE",
    "AUH": "Abu Dhabi, UAE",
    "SHJ": "Sharjah, UAE",
    "DWC": "Dubai Al Maktoum, UAE",
    "DOH": "Hamad, Qatar",
    "RUH": "Riyadh King Khalid, Saudi Arabia",
    "JED": "Jeddah King Abdulaziz, Saudi Arabia",
    "DMM": "Dammam King Fahd, Saudi Arabia",
    "AMM": "Queen Alia, Jordan",
    "BEY": "Beirut Rafic Hariri, Lebanon",
    "BAH": "Bahrain International, Bahrain",
    "KWI": "Kuwait International, Kuwait",
    "MCT": "Muscat International, Oman",
    "LHR": "London Heathrow, UK",
    "LGW": "London Gatwick, UK",
    "STN": "London Stansted, UK",
    "LCY": "London City, UK",
    "MAN": "Manchester, UK",
    "CDG": "Paris Charles de Gaulle, France",
    "ORY": "Paris Orly, France",
    "FRA": "Frankfurt, Germany",
    "MUC": "Munich, Germany",
    "BER": "Berlin Brandenburg, Germany",
    "DUS": "Düsseldorf, Germany",
    "MAD": "Madrid Barajas, Spain",
    "BCN": "Barcelona El Prat, Spain",
    "VIE": "Vienna, Austria",
    "FCO": "Rome Fiumicino, Italy",
    "MXP": "Milan Malpensa, Italy",
    "ZRH": "Zurich, Switzerland",
    "GVA": "Geneva, Switzerland",
    "AMS": "Amsterdam Schiphol, Netherlands",
    "BRU": "Brussels, Belgium",
    "SVO": "Moscow Sheremetyevo, Russia",
    "DME": "Moscow Domodedovo, Russia",
    "LED": "Saint Petersburg Pulkovo, Russia",
    "ATH": "Athens Eleftherios Venizelos, Greece",
    "OSL": "Oslo Gardermoen, Norway",
    "ARN": "Stockholm Arlanda, Sweden",
    "HEL": "Helsinki Vantaa, Finland",
    "JFK": "New York John F. Kennedy, USA",
    "EWR": "Newark Liberty, USA",
    "LGA": "LaGuardia, USA",
    "DEN": "Denver, USA",
    "SEA": "Seattle-Tacoma, USA",
    "BOS": "Boston Logan, USA",
    "YYZ": "Toronto Pearson, Canada",
    "YVR": "Vancouver, Canada",
    "YUL": "Montréal–Trudeau, Canada",
    "YWG": "Winnipeg, Canada",
    "MEX": "Mexico City, Mexico",
    "GRU": "São Paulo Guarulhos, Brazil",
    "GIG": "Rio de Janeiro Galeão, Brazil",
    "EZE": "Buenos Aires Ezeiza, Argentina",
    "BOG": "Bogotá El Dorado, Colombia",
    "LIM": "Lima Jorge Chávez, Peru",
    "SCL": "Santiago Arturo Merino Benítez, Chile",
    "HND": "Tokyo Haneda, Japan",
    "NRT": "Tokyo Narita, Japan",
    "ICN": "Seoul Incheon, South Korea",
    "GMP": "Seoul Gimpo, South Korea",
    "BKK": "Bangkok Suvarnabhumi, Thailand",
    "DMK": "Don Mueang, Thailand",
    "SIN": "Singapore Changi, Singapore",
    "KUL": "Kuala Lumpur, Malaysia",
    "DEL": "Indira Gandhi, India",
    "BOM": "Mumbai Chhatrapati Shivaji, India",
    "BLR": "Kempegowda, India",
    "MAA": "Chennai, India",
    "HYD": "Rajiv Gandhi, India",
    "CCU": "Netaji Subhas Chandra Bose, India",
    "COK": "Cochin, India",
    "TRV": "Trivandrum, India",
    "HKG": "Hong Kong, China",
    "PEK": "Beijing Capital, China",
    "PKX": "Beijing Daxing, China",
    "PVG": "Shanghai Pudong, China",
    "SHA": "Shanghai Hongqiao, China",
    "CAN": "Guangzhou Baiyun, China",
    "SZX": "Shenzhen Bao'an, China",
    "SYD": "Sydney Kingsford Smith, Australia",
    "MEL": "Melbourne, Australia",
    "BNE": "Brisbane, Australia",
    "PER": "Perth, Australia",
    "AKL": "Auckland, New Zealand",
    "WLG": "Wellington, New Zealand",
    "CHC": "Christchurch, New Zealand",
    "CHU": "Chu Lai, Vietnam",
    "HAN": "Hanoi Noi Bai, Vietnam",
    "SGN": "Ho Chi Minh City Tan Son Nhat, Vietnam",
    "JNB": "Johannesburg OR Tambo, South Africa",
    "CPT": "Cape Town, South Africa",
    "CAI": "Cairo International, Egypt",
    "CMN": "Casablanca Mohammed V, Morocco",
    "LOS": "Lagos Murtala Muhammed, Nigeria",
    "NBO": "Nairobi Jomo Kenyatta, Kenya",
    "ADD": "Addis Ababa Bole, Ethiopia",
    "ABJ": "Abidjan Félix Houphouët-Boigny, Côte d'Ivoire",
    "ACC": "Accra Kotoka, Ghana",
    "LFW": "Lomé-Tokoin, Togo",
    "ABV": "Abuja Nnamdi Azikiwe, Nigeria",
    "ABU": "Abuja, Nigeria",
    "KIN": "Kingston Norman Manley, Jamaica",
    "POS": "Port of Spain Piarco, Trinidad and Tobago",
  };
  String airportName =
      airports[upperCaseConvertion(airportCod)] ?? "Unknown Airport";

  // If only city name is needed, split and return the first part
  if (cityOnly) {
    return airportName.split(",")[0]; // Gets "Dubai" from "Dubai, UAE"
  }

  return airportName; // Returns full name
}

String upperCaseConvertion(String airportCode) {
  return airportCode.toUpperCase();
}

String formatDateTime(DateTime dateTime) {
  return dateTime.toUtc().toIso8601String();
}

DateTime? parseDateTime(String? dateString) {
  // Gracefully handle null/empty inputs
  // log('--- $dateString');
  if (dateString == null || dateString.isEmpty) {
    return null;
  }

  // Normalize whitespace and trim stray trailing slash/backslash artifacts.
  final normalized = dateString.trim().replaceAll(RegExp(r'\s+'), ' ');
  final cleaned = normalized.replaceAll(RegExp(r'[\\\\/]+$'), '').trim();

  // Handle month-year strings like "Feb 2026" or "February 2026"
  final monthYearRegex = RegExp(r'^[A-Za-z]{3,9}\s+\d{4}$');
  if (monthYearRegex.hasMatch(cleaned)) {
    try {
      final dt = DateFormat('MMM yyyy').parseLoose(cleaned, true);
      return DateTime.utc(dt.year, dt.month, 1).toLocal();
    } catch (_) {
      try {
        final dt = DateFormat('MMMM yyyy').parseLoose(cleaned, true);
        return DateTime.utc(dt.year, dt.month, 1).toLocal();
      } catch (_) {
        // fall through
      }
    }
  }

  // Try fast path first (handles ISO-8601, RFC3339, etc.)
  try {
    return DateTime.parse(cleaned).toLocal();
  } catch (_) {
    // Fallback to a set of common non‑ISO formats we see from OCR / APIs.
    const patterns = [
      'yyyy-MM-dd HH:mm',
      'yyyy-MM-dd HH:mm:ss',
      'yyyy-MM-dd hh:mm a',
      'yyyy-MM-dd h:mm a',
      'dd-MM-yyyy HH:mm',
      'dd-MM-yyyy HH:mm:ss',
      'MM/dd/yyyy HH:mm',
      'MM/dd/yyyy HH:mm:ss',
      'dd MMM yyyy HH:mm',
      'dd MMM yyyy hh:mm a',
      "yyyy-MM-dd'T'HH:mm:ssZ",
      "yyyy-MM-dd'T'HH:mm:ss.SSSZ",
      'MMM dd, yyyy',
      'MMM dd yyyy',
      'MMMM dd, yyyy',
    ];

    for (final pattern in patterns) {
      try {
        return DateFormat(pattern).parse(cleaned, true).toLocal();
      } catch (_) {
        // keep trying
      }
    }

    // Log once if nothing matched to aid debugging.
    print("--++--++--++$dateString");
    print("Error parsing date -- : FormatException: unsupported format");
    return null;
  }
}

String timmingsSorting(String times) {
  // Convert JSON string to Map
  Map<String, dynamic> schedule = jsonDecode(times);

  // Find the longest day name for consistent padding
  int maxDayLength =
      schedule.keys.map((e) => e.length).reduce((a, b) => a > b ? a : b);

  // Format the output with proper alignment
  String formattedSchedule = schedule.entries.map((entry) {
    return "${entry.key.padRight(maxDayLength)}: ${entry.value['from']} - ${entry.value['to']}";
  }).join("\n");

  return formattedSchedule;
}

DateTime convertTimeToDateTime(String time) {
  DateTime today = DateTime.now();
  List<String> parts = time.split(":");

  return DateTime(
    today.year,
    today.month,
    today.day,
    int.parse(parts[0]), // Hours
    int.parse(parts[1]), // Minutes
    int.parse(parts[2]), // Seconds
  );
}

bool checkDubicateCard(
  List<UserCardViewRow>? cards,
  int cardId,
) {
  if (cards == null || cards.isEmpty) {
    return false;
  }

  return cards.any((card) => card.cardId == cardId);
}

String notificationDate(DateTime dateTime) {
  // final Duration difference = DateTime.now().difference(dateTime);

  // if (difference.inSeconds < 60) {
  //   return '${difference.inSeconds} seconds ago';
  // } else if (difference.inMinutes < 60) {
  //   return '${difference.inMinutes} minutes ago';
  // } else if (difference.inHours < 24) {
  //   return '${difference.inHours} hours ago';
  // } else if (difference.inDays == 1) {
  //   return 'Yesterday';
  // } else if (difference.inDays < 7) {
  //   return '${difference.inDays} days ago';
  // } else {
  //   return DateFormat('dd MMM').format(dateTime); // Example: "12 Jun"
  // }
  final now = DateTime.now();

  bool isSameDay(DateTime d1, DateTime d2) {
    return d1.year == d2.year && d1.month == d2.month && d1.day == d2.day;
  }

  if (isSameDay(dateTime, now)) {
    return DateFormat('hh:mm a').format(dateTime); // e.g. 07:30 AM
  } else if (isSameDay(dateTime, now.subtract(const Duration(days: 1)))) {
    return 'Yesterday ${DateFormat('hh:mm a').format(dateTime)}';
  } else {
    return DateFormat('d MMM hh:mm a').format(dateTime); // e.g. 25 Jun 07:30 AM
  }
}

DateTime getPastDate(int daysAgo) {
  return DateTime.now().subtract(Duration(days: daysAgo));
}

bool isWithinThreeHours(
  String supabaseTimeStr,
  int minutes,
  String? departureDateStr,
) {
  try {
    final departureDate =
        DateFormat('yyyy-MM-dd').parseStrict(departureDateStr ?? '');
    final departureTimeParts = supabaseTimeStr.split(':');
    final departureHour = int.parse(departureTimeParts[0]);
    final departureMinute = int.parse(departureTimeParts[1]);

    // 1. Create a DateTime object in the DEVICE'S LOCAL TIMEZONE.
    //    This is correct because your data is now "Asia/Kolkata".
    final departureDateTimeAsLocal = DateTime(
      departureDate.year,
      departureDate.month,
      departureDate.day,
      departureHour,
      departureMinute,
    );

    // 2. Convert that local time to UTC for a reliable comparison.
    final departureDateTimeInUtc = departureDateTimeAsLocal.toUtc();

    // 3. Get the current time, also in UTC.
    final nowInUtc = DateTime.now().toUtc();

    // 4. Check if the departure time has already passed.
    if (nowInUtc.isAfter(departureDateTimeInUtc)) {
      return false;
    }

    final difference = departureDateTimeInUtc.difference(nowInUtc);
    print("Time until departure: ${difference.inMinutes} minutes.");

    return difference.inMinutes <= minutes;
  } catch (e) {
    print('Error parsing date/time: $e');
    return false;
  }
}

bool isWithinOneHours(String supabaseTimeStr) {
  final supabaseTime = TimeOfDay(
    hour: int.parse(supabaseTimeStr.split(':')[0]),
    minute: int.parse(supabaseTimeStr.split(':')[1]),
  );
  final now = DateTime.now();
  DateTime supabaseDateTime = DateTime(
    now.year,
    now.month,
    now.day,
    supabaseTime.hour,
    supabaseTime.minute,
  );
  if (supabaseTime.hour < now.hour ||
      (supabaseTime.hour == now.hour && supabaseTime.minute < now.minute)) {
    supabaseDateTime = supabaseDateTime.add(const Duration(days: 1));
  }
  final differenceInMinutes = supabaseDateTime.difference(now).inMinutes;
  return differenceInMinutes >= 0 && differenceInMinutes <= 60;
}

bool isDateWithinNextSixDays(String dateStr) {
  // try {
  //   final DateFormat format = DateFormat('yyyy-MM-dd');
  //   final DateTime departureDate = format.parseStrict(dateStr);

  //   final DateTime now = DateTime.now();
  //   final DateTime today = DateTime(now.year, now.month, now.day);

  //   if (departureDate.isAtSameMomentAs(today)) {
  //     return false;
  //   }
  //   // ---------------------------------------------

  //   if (departureDate.isBefore(today)) {
  //     return false;
  //   }

  //   final DateTime oneWeekFromToday = today.add(const Duration(days: 7));

  //   return departureDate.isBefore(oneWeekFromToday);
  // } catch (e) {
  //   print('Error parsing date in isDateWithinNextSixDays: $e');

  //   return false;
  // }
  try {
    // തീയതിയും സമയവും ഒരുമിച്ച് പാഴ്സ് ചെയ്യാൻ DateFormat അപ്ഡേറ്റ് ചെയ്യുക
    // ഉദാഹരണ ഫോർമാറ്റ്: "2023-10-27 01:05:00"
    final DateFormat format = DateFormat('yyyy-MM-dd HH:mm:ss');
    final DateTime departureDateTime = format.parseStrict(dateStr);

    final DateTime now = DateTime.now();

    // ഒന്നാമത്തെ വ്യവസ്ഥ: നൽകിയിരിക്കുന്ന departureDateTime ഇപ്പോഴത്തെ സമയത്തിന് ശേഷമായിരിക്കണം.
    if (!departureDateTime.isAfter(now)) {
      return false;
    }

    // രണ്ടാമത്തെ വ്യവസ്ഥ: departureDateTime-യുടെ തീയതി ഭാഗം അടുത്ത 6 കലണ്ടർ ദിവസങ്ങളിൽ ഒന്നായിരിക്കണം.
    // (അതായത്, നാളെ, മറ്റന്നാൾ, ..., ഇന്നേക്ക് 6 ദിവസം കഴിഞ്ഞുള്ള ദിവസം വരെ).
    // ഇന്നത്തെ ദിവസം പരിഗണിക്കില്ല.

    final DateTime todayAtMidnight = DateTime(now.year, now.month, now.day);
    final DateTime departureDateAtMidnight = DateTime(
        departureDateTime.year, departureDateTime.month, departureDateTime.day);

    // നാളെത്തെ ദിവസം (00:00 സമയം)
    final DateTime firstPossibleDate =
        todayAtMidnight.add(const Duration(days: 1));
    // ഇന്നേക്ക് 7 ദിവസം കഴിഞ്ഞുള്ള ദിവസം (00:00 സമയം) - ഈ ദിവസത്തിന് മുൻപായിരിക്കണം.
    final DateTime firstInvalidDate =
        todayAtMidnight.add(const Duration(days: 7));

    // departureDateAtMidnight നാളെക്കും (firstPossibleDate)
    // ഇന്നേക്ക് 7 ദിവസം കഴിഞ്ഞുള്ള ദിവസത്തിനും (firstInvalidDate) ഇടയിലാണോ എന്ന് പരിശോധിക്കുക.
    // അതായത്, departureDateAtMidnight >= firstPossibleDate AND departureDateAtMidnight < firstInvalidDate

    if (departureDateAtMidnight.isBefore(firstPossibleDate)) {
      // തീയതി ഇന്നോ അതിനു മുൻപോ ആണെങ്കിൽ false റിട്ടേൺ ചെയ്യുക.
      return false;
    }

    if (!departureDateAtMidnight.isBefore(firstInvalidDate)) {
      // തീയതി ഇന്നേക്ക് 7 ദിവസമോ അതിനുശേഷമോ ആണെങ്കിൽ false റിട്ടേൺ ചെയ്യുക.
      return false;
    }

    // എല്ലാ വ്യവസ്ഥകളും ശരിയാണെങ്കിൽ true റിട്ടേൺ ചെയ്യുക.
    return true;
  } catch (e) {
    // പാഴ്സിംഗിൽ പിശക് സംഭവിച്ചാൽ ലോഗ് ചെയ്യുക.
    print('Error parsing date in isDateWithinNextSixDays: $e');
    return false;
  }
}

bool isDepartureWithinMinutes(
  String departureAtStr,
  int minutes,
) {
  try {
    // The format "2025-08-21T17:01:00+00:00" is the standard ISO 8601 format.
    // Dart's DateTime.parse can handle it directly without any modification.
    final departureDateTime = DateTime.parse(departureAtStr);

    // Get the current time in UTC for a correct, timezone-agnostic comparison.
    final now = DateTime.now().toUtc();

    // 1. Check if the flight has already departed. If so, it's not within the future window.
    if (now.isAfter(departureDateTime)) {
      return false;
    }

    // 2. Calculate the difference between the departure time and now.
    final difference = departureDateTime.difference(now);
    // log('--- ${difference.inMinutes.toString()}');
    // 3. Return true if the flight is departing within the specified number of minutes.
    // log('--- ${difference.inMinutes <= minutes}');
    return difference.inMinutes <= minutes;
  } catch (e) {
    log('--- $e');
    return false; // Return false if the string format is invalid.
  }
}

bool isSeatWindowActive(
  String departureAtStr,
  String arrivalAtStr,
  int minutesBeforeDeparture, [
  int minutesAfterArrival = 0,
]) {
  try {
    final departureDateTime = DateTime.parse(departureAtStr).toUtc();
    final arrivalDateTime = DateTime.parse(arrivalAtStr).toUtc();
    final now = DateTime.now().toUtc();

    if (!arrivalDateTime.isAfter(departureDateTime)) {
      return false;
    }

    final windowStart =
        departureDateTime.subtract(Duration(minutes: minutesBeforeDeparture));
    final windowEnd =
        arrivalDateTime.add(Duration(minutes: minutesAfterArrival));

    final isOnOrAfterStart =
        now.isAtSameMomentAs(windowStart) || now.isAfter(windowStart);
    final isOnOrBeforeEnd =
        now.isAtSameMomentAs(windowEnd) || now.isBefore(windowEnd);

    return isOnOrAfterStart && isOnOrBeforeEnd;
  } catch (e) {
    log('--- $e');
    return false;
  }
}

bool isArrivalAfterMinutes(
  String arrivalAtStr,
  int minutes,
) {
  try {
    final arrivalDateTime = DateTime.parse(arrivalAtStr);
    final now = DateTime.now().toUtc();

    if (now.isBefore(arrivalDateTime)) {
      return false;
    }

    final difference = now.difference(arrivalDateTime);
    return difference.inMinutes >= minutes;
  } catch (e) {
    log('--- $e');
    return false;
  }
}
