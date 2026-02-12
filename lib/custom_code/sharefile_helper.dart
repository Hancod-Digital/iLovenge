import 'dart:io';
import 'dart:typed_data' show Uint8List;

class SelectedFileForTicket {
  final String storagePath;
  final String? filePath;
  final Uint8List bytes;

  SelectedFileForTicket({
    required this.storagePath,
    this.filePath,
    required this.bytes,
  });
}
