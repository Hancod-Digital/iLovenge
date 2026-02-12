// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:country_code_picker/country_code_picker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CountryCodePickerWidget extends StatefulWidget {
  const CountryCodePickerWidget({
    super.key,
    this.width,
    this.height,
    this.initialCode,
    required this.onCountryChanged,
    this.enabled,
  });

  final double? width;
  final double? height;
  final String? initialCode;
  final Future Function(String? pickedCode) onCountryChanged;
  final bool? enabled;

  @override
  State<CountryCodePickerWidget> createState() =>
      _CountryCodePickerWidgetState();
}

class _CountryCodePickerWidgetState extends State<CountryCodePickerWidget> {
  String _selectedCode = 'US'; // Default fallback country
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _initCountryCode();
  }

  /// 🛰️ Get user's current country based on GPS
  Future<void> _initCountryCode() async {
    try {
      // Check if location services are enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        debugPrint('📍 Location services disabled, trying IP detection...');
        await _detectCountryViaIP();
        return;
      }

      // Request location permission
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.deniedForever ||
          permission == LocationPermission.denied) {
        debugPrint('📍 Location permission denied, trying IP detection...');
        await _detectCountryViaIP();
        return;
      }

      // Get current position with shorter timeout for VPN scenarios
      Position? position;
      try {
        position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low,
          timeLimit: const Duration(seconds: 5), // Reduced timeout
        );
      } catch (e) {
        debugPrint('📍 Failed to get position: $e, trying IP detection...');
        await _detectCountryViaIP();
        return;
      }

      // Position is already validated by the try-catch above

      // Reverse geocode to get country with null safety
      List<Placemark> placemarks = [];
      try {
        placemarks = await placemarkFromCoordinates(
            position.latitude, position.longitude);
      } catch (e) {
        debugPrint('📍 Geocoding failed: $e, trying IP detection...');
        await _detectCountryViaIP();
        return;
      }

      if (placemarks.isNotEmpty) {
        final placemark = placemarks.first;
        final countryCode = placemark.isoCountryCode;

        if (countryCode != null && countryCode.isNotEmpty) {
          setState(() {
            _selectedCode = countryCode;
          });

          // Find the dial code based on selected country
          final country = CountryCode.fromCountryCode(_selectedCode);
          if (country.dialCode != null) {
            widget.onCountryChanged(country.dialCode!);
          } else {
            _setDefaultCountry();
          }
        } else {
          debugPrint('📍 No valid country code found, trying IP detection...');
          await _detectCountryViaIP();
        }
      } else {
        debugPrint('📍 No placemarks found, trying IP detection...');
        await _detectCountryViaIP();
      }
    } catch (e) {
      debugPrint('❌ GPS detection failed: $e');
      // Try IP-based detection as fallback
      await _detectCountryViaIP();
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  /// Helper method to set default country and call callback
  void _setDefaultCountry() {
    setState(() {
      _selectedCode = widget.initialCode ?? 'US';
    });

    // Call callback with default dial code
    final country = CountryCode.fromCountryCode(_selectedCode);
    if (country.dialCode != null) {
      widget.onCountryChanged(country.dialCode!);
    } else {
      // Ultimate fallback
      widget.onCountryChanged('+1');
    }
  }

  /// 🌐 Fallback method to detect country via IP geolocation
  Future<void> _detectCountryViaIP() async {
    try {
      debugPrint('🌐 Trying IP-based country detection...');
      final response = await http
          .get(
            Uri.parse('http://ip-api.com/json'),
          )
          .timeout(const Duration(seconds: 5));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final countryCode = data['countryCode'] as String?;

        if (countryCode != null && countryCode.isNotEmpty) {
          debugPrint('🌐 IP-based country detected: $countryCode');
          setState(() {
            _selectedCode = countryCode;
          });

          final country = CountryCode.fromCountryCode(countryCode);
          if (country.dialCode != null) {
            widget.onCountryChanged(country.dialCode!);
            return;
          }
        }
      }
    } catch (e) {
      debugPrint('🌐 IP-based detection failed: $e');
    }

    // If IP detection also fails, use default
    _setDefaultCountry();
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Localizations.override(
      context: context,
      locale: const Locale('en'),
      // You can also pass `delegates` if your app uses custom localization delegates.
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: CountryCodePicker(
          enabled: widget.enabled ?? true,
          initialSelection: _selectedCode,
          favorite: const ['+971', 'AE', '+974', 'QA', '+91', 'IN'],
          onChanged: (country) {
            final pickedCode = country.dialCode ?? '+1';
            setState(() {
              _selectedCode = country.code ?? 'US';
            });
            widget.onCountryChanged(pickedCode);
          },
          showCountryOnly: false,
          showFlag: true,
          showOnlyCountryWhenClosed: false,
          alignLeft: true,
          showDropDownButton: true,
          dialogBackgroundColor: Colors.white,
          textStyle: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
          boxDecoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
