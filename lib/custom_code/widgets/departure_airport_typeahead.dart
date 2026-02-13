import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';

class DepartureAirportTypeAhead extends StatefulWidget {
  const DepartureAirportTypeAhead({
    super.key,
    required this.controller,
    required this.airportNameController,
    required this.decoration,
    this.pageSize = 10,
    this.countryFilter,
    this.onSelected,
  });

  final TextEditingController controller;
  final TextEditingController airportNameController;
  final InputDecoration decoration;
  final int pageSize;
  final String? countryFilter;
  final void Function(AirportDataViewStruct airport)? onSelected;

  @override
  State<DepartureAirportTypeAhead> createState() =>
      _DepartureAirportTypeAheadState();
}

class _DepartureAirportTypeAheadState extends State<DepartureAirportTypeAhead> {
  Timer? _resolveDebounce;
  String _lastResolvedCode = '';

  Future<List<AirportDataViewStruct>> _fetchAirports(String query) async {
    final trimmed = query.trim();
    if (trimmed.length < 2) return [];

    final response = await SupabaseRPCGroup.getAirportDataCall.call(
      pageNumber: 1,
      pageSize: widget.pageSize,
      searchTerm: trimmed,
      countryFilter: widget.countryFilter,
    );

    if (!response.succeeded) return [];
    log(response.bodyText);
    return GetAirportDataCall.airports(response.jsonBody) ?? [];
  }

  Future<void> _tryResolveManual(String query) async {
    final trimmed = query.trim();
    if (!(trimmed.length == 3 || trimmed.length == 4)) return;

    final upper = trimmed.toUpperCase();
    if (_lastResolvedCode == upper) return;

    final response = await SupabaseRPCGroup.getAirportDataCall.call(
      pageNumber: 1,
      pageSize: widget.pageSize,
      searchTerm: trimmed,
      countryFilter: widget.countryFilter,
    );

    if (!response.succeeded) return;
    final results = GetAirportDataCall.airports(response.jsonBody) ?? [];
    if (results.isEmpty) return;

    final match = results.firstWhere(
      (a) =>
          a.iataCode.toUpperCase() == upper ||
          a.icaoCode.toUpperCase() == upper,
      orElse: () => AirportDataViewStruct(),
    );
    if (match.iataCode.isEmpty && match.icaoCode.isEmpty) return;

    _lastResolvedCode =
        match.iataCode.isNotEmpty ? match.iataCode.toUpperCase() : upper;
    _handleSelection(match);
  }

  String _buildDisplay(AirportDataViewStruct airport) {
    final code =
        airport.iataCode.isNotEmpty ? airport.iataCode : airport.icaoCode;
    final name = airport.airportName;
    final city = airport.city;
    final country = airport.country;
    final parts = <String>[
      if (name.isNotEmpty) name,
      if (city.isNotEmpty) city,
      if (country.isNotEmpty) country,
    ];
    return code.isNotEmpty ? '$code - ${parts.join(', ')}' : parts.join(', ');
  }

  void _handleSelection(AirportDataViewStruct airport) {
    final code =
        airport.iataCode.isNotEmpty ? airport.iataCode : airport.icaoCode;
    widget.controller.text = code;
    widget.airportNameController.text = airport.airportName;
    widget.onSelected?.call(airport);
  }

  @override
  Widget build(BuildContext context) {
    return TypeAheadField<AirportDataViewStruct>(
      controller: widget.controller,
      suggestionsCallback: _fetchAirports,
      debounceDuration: const Duration(milliseconds: 300),
      itemBuilder: (context, item) {
        return ListTile(
          title: Text(
            item.airportName.isNotEmpty ? item.airportName : item.iataCode,
          ),
          subtitle: Text(
            _buildDisplay(
              item,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.black),
          ),
        );
      },
      onSelected: _handleSelection,
      emptyBuilder: (context) => const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('No airports found'),
      ),
      loadingBuilder: (context) => const Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(child: CircularProgressIndicator()),
      ),
      errorBuilder: (context, error) => const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('Error loading airports'),
      ),
      builder: (context, controller, focusNode) {
        return TextFormField(
          controller: controller,
          focusNode: focusNode,
          decoration: widget.decoration,
          validator: (value) => value?.isEmpty == true ? 'Required' : null,
          onChanged: (value) {
            _resolveDebounce?.cancel();
            _resolveDebounce = Timer(
              const Duration(milliseconds: 400),
              () => _tryResolveManual(value),
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _resolveDebounce?.cancel();
    super.dispose();
  }
}
