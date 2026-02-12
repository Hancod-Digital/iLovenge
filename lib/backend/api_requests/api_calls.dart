import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Edge Functions Group Code

class EdgeFunctionsGroup {
  static String getBaseUrl() =>
      'https://fjlihsqbnpyfaiktbuyt.supabase.co/functions/v1/';
  static Map<String, String> headers = {
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZqbGloc3FibnB5ZmFpa3RidXl0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ5NTI0NDAsImV4cCI6MjA1MDUyODQ0MH0._uCw1JxUgHqEUMywvxufKVfSnW1bx_3sfjE-276XGEg',
  };
  static ParsePDFCall parsePDFCall = ParsePDFCall();
}

class ParsePDFCall {
  Future<ApiCallResponse> call({
    String? pdfLink = '',
  }) async {
    final baseUrl = EdgeFunctionsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "pdfUrl": "${escapeStringForJson(pdfLink)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Parse PDF',
      apiUrl: '${baseUrl}pdf-ocr',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZqbGloc3FibnB5ZmFpa3RidXl0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ5NTI0NDAsImV4cCI6MjA1MDUyODQ0MH0._uCw1JxUgHqEUMywvxufKVfSnW1bx_3sfjE-276XGEg',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? arrTimeZone(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.ArrivalAirportTimezone''',
      ));
  String? depTimeZone(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.DepartureAirportTimezone''',
      ));
}

/// End Edge Functions Group Code

/// Start Supabase RPC Group Code

class SupabaseRPCGroup {
  static String getBaseUrl() => 'https://fjlihsqbnpyfaiktbuyt.supabase.co';
  static Map<String, String> headers = {
    'apikey':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZqbGloc3FibnB5ZmFpa3RidXl0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ5NTI0NDAsImV4cCI6MjA1MDUyODQ0MH0._uCw1JxUgHqEUMywvxufKVfSnW1bx_3sfjE-276XGEg',
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZqbGloc3FibnB5ZmFpa3RidXl0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ5NTI0NDAsImV4cCI6MjA1MDUyODQ0MH0._uCw1JxUgHqEUMywvxufKVfSnW1bx_3sfjE-276XGEg',
    'Content-Type': 'application/json',
    'Access-Control-Allow-Origin': '*',
  };
  static UseDashBoardCall useDashBoardCall = UseDashBoardCall();
  static UploadTripCall uploadTripCall = UploadTripCall();
  static EditTripCall editTripCall = EditTripCall();
}

class UseDashBoardCall {
  Future<ApiCallResponse> call({
    String? userId = '',
  }) async {
    final baseUrl = SupabaseRPCGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "authenticationuserid": "${escapeStringForJson(userId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'useDashBoard',
      apiUrl: '${baseUrl}/rest/v1/rpc/get_user_dashboard_data',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZqbGloc3FibnB5ZmFpa3RidXl0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ5NTI0NDAsImV4cCI6MjA1MDUyODQ0MH0._uCw1JxUgHqEUMywvxufKVfSnW1bx_3sfjE-276XGEg',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZqbGloc3FibnB5ZmFpa3RidXl0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ5NTI0NDAsImV4cCI6MjA1MDUyODQ0MH0._uCw1JxUgHqEUMywvxufKVfSnW1bx_3sfjE-276XGEg',
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UploadTripCall {
  Future<ApiCallResponse> call({
    dynamic? ticketDataJson,
  }) async {
    final baseUrl = SupabaseRPCGroup.getBaseUrl();

    final ticketData = _serializeJson(ticketDataJson);
    final ffApiRequestBody = '''
${ticketData}''';
    return ApiManager.instance.makeApiCall(
      callName: 'uploadTrip',
      apiUrl: '${baseUrl}/rest/v1/rpc/add_trip',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZqbGloc3FibnB5ZmFpa3RidXl0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ5NTI0NDAsImV4cCI6MjA1MDUyODQ0MH0._uCw1JxUgHqEUMywvxufKVfSnW1bx_3sfjE-276XGEg',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZqbGloc3FibnB5ZmFpa3RidXl0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ5NTI0NDAsImV4cCI6MjA1MDUyODQ0MH0._uCw1JxUgHqEUMywvxufKVfSnW1bx_3sfjE-276XGEg',
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EditTripCall {
  Future<ApiCallResponse> call({
    dynamic? tripDetailsJson,
  }) async {
    final baseUrl = SupabaseRPCGroup.getBaseUrl();

    final tripDetails = _serializeJson(tripDetailsJson);
    final ffApiRequestBody = '''
${tripDetails}''';
    return ApiManager.instance.makeApiCall(
      callName: 'editTrip',
      apiUrl: '${baseUrl}/rest/v1/rpc/edit_trip',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZqbGloc3FibnB5ZmFpa3RidXl0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ5NTI0NDAsImV4cCI6MjA1MDUyODQ0MH0._uCw1JxUgHqEUMywvxufKVfSnW1bx_3sfjE-276XGEg',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZqbGloc3FibnB5ZmFpa3RidXl0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ5NTI0NDAsImV4cCI6MjA1MDUyODQ0MH0._uCw1JxUgHqEUMywvxufKVfSnW1bx_3sfjE-276XGEg',
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Supabase RPC Group Code

class GetTicketDetailsCall {
  static Future<ApiCallResponse> call({
    String? ticketLink = '',
  }) async {
    final ffApiRequestBody = '''
{
    "pdfUrl":"${ticketLink}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getTicketDetails',
      apiUrl: 'https://fjlihsqbnpyfaiktbuyt.supabase.co/functions/v1/pdf-ocr',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.TEXT,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? pnr(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.PNR''',
      ));
  static String? depDateTime(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DepartureDateTime''',
      ));
  static String? airLine(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.Airline''',
      ));
  static String? flightNbr(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.FlightNumber''',
      ));
  static String? cabinClass(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.CabinClass''',
      ));
  static String? depAirport(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DepartureAirport''',
      ));
  static String? depTerminal(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DepartureTerminal''',
      ));
  static String? arrAirport(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.ArrivalAirport''',
      ));
  static String? arrTerminal(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.ArrivalTerminal''',
      ));
  static String? arrDateTime(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.ArrivalDateTime''',
      ));
  static String? arrTimeZone(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.ArrivalAirportTimezone''',
      ));
  static String? depTimeZone(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.DepartureAirportTimezone''',
      ));
}

class TimeZonesCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'timeZones',
      apiUrl: 'https://www.timeapi.io/api/timezone/availabletimezones',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? timezones(dynamic response) => (getJsonField(
        response,
        r'''$''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? times(dynamic response) => (getJsonField(
        response,
        r'''$''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetAirportCall {
  static Future<ApiCallResponse> call({
    String? airport = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getAirport',
      apiUrl: 'https://api.api-ninjas.com/v1/airports?iata=${airport}',
      callType: ApiCallType.GET,
      headers: {
        'X-Api-Key': '6CpVVSao7jmbzvi4bsIqCw==MWYQgCpLwCLcKjMj',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
