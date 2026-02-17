import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/api_requests/api_manager.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _fcmToken = '';
  String get fcmToken => _fcmToken;
  set fcmToken(String value) {
    _fcmToken = value;
  }

  String _currentTripId = '';
  String get currentTripId => _currentTripId;
  set currentTripId(String value) {
    _currentTripId = value;
  }

  String _depDate = '';
  String get depDate => _depDate;
  set depDate(String value) {
    _depDate = value;
  }

  String _depTime = '';
  String get depTime => _depTime;
  set depTime(String value) {
    _depTime = value;
  }

  String _arrivalTime = '';
  String get arrivalTime => _arrivalTime;
  set arrivalTime(String value) {
    _arrivalTime = value;
  }

  String _arrivalAirportName = '';
  String get arrivalAirportName => _arrivalAirportName;
  set arrivalAirportName(String value) {
    _arrivalAirportName = value;
  }

  String _pnr = '';
  String get pnr => _pnr;
  set pnr(String value) {
    _pnr = value;
  }

  String _airline = '';
  String get airline => _airline;
  set airline(String value) {
    _airline = value;
  }

  String _flightNumber = '';
  String get flightNumber => _flightNumber;
  set flightNumber(String value) {
    _flightNumber = value;
  }

  String _flightClass = '';
  String get flightClass => _flightClass;
  set flightClass(String value) {
    _flightClass = value;
  }

  String _departureAirport = '';
  String get departureAirport => _departureAirport;
  set departureAirport(String value) {
    _departureAirport = value;
  }

  String _departureTimezone = '';
  String get departureTimezone => _departureTimezone;
  set departureTimezone(String value) {
    _departureTimezone = value;
  }

  String _departureTerminal = '';
  String get departureTerminal => _departureTerminal;
  set departureTerminal(String value) {
    _departureTerminal = value;
  }

  String _seat = '';
  String get seat => _seat;
  set seat(String value) {
    _seat = value;
  }

  String _arrivalAirport = '';
  String get arrivalAirport => _arrivalAirport;
  set arrivalAirport(String value) {
    _arrivalAirport = value;
  }

  String _arrivalTimezone = '';
  String get arrivalTimezone => _arrivalTimezone;
  set arrivalTimezone(String value) {
    _arrivalTimezone = value;
  }

  String _arrivalTerminal = '';
  String get arrivalTerminal => _arrivalTerminal;
  set arrivalTerminal(String value) {
    _arrivalTerminal = value;
  }

  String _departureAirportName = '';
  String get departureAirportName => _departureAirportName;
  set departureAirportName(String value) {
    _departureAirportName = value;
  }

  String _gateNumber = '';
  String get gateNumber => _gateNumber;
  set gateNumber(String value) {
    _gateNumber = value;
  }

  String _beltNumber = '';
  String get beltNumber => _beltNumber;
  set beltNumber(String value) {
    _beltNumber = value;
  }

  bool _Internet = true;
  bool get Internet => _Internet;
  set Internet(bool value) {
    _Internet = value;
  }

  bool _seatMissing = false;
  bool get seatMissing => _seatMissing;
  set seatMissing(bool value) {
    _seatMissing = value;
  }

  String _sharedFileBase64 = '';
  String get sharedFileBase64 => _sharedFileBase64;
  set sharedFileBase64(String value) {
    _sharedFileBase64 = value;
  }

  String _sharedFileName = '';
  String get sharedFileName => _sharedFileName;
  set sharedFileName(String value) {
    _sharedFileName = value;
  }

  int _loungReviewCount = 0;
  int get loungReviewCount => _loungReviewCount;
  set loungReviewCount(int value) {
    _loungReviewCount = value;
  }

  String _tripStatus = '';
  String get tripStatus => _tripStatus;
  set tripStatus(String value) {
    _tripStatus = value;
  }
}
