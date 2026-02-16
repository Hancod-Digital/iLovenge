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

  String _pnr = '';
  String get pnr => _pnr;
  set pnr(String value) {
    _pnr = value;
  }

  String _gateNumber = '';
  String get gateNumber => _gateNumber;
  set gateNumber(String value) {
    _gateNumber = value;
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
