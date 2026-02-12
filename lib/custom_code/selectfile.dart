import 'dart:typed_data' show Uint8List;

class SelectedFile {
  final String storagePath;

  final String? filePath;

  final Uint8List bytes;

  SelectedFile({
    required this.storagePath,
    this.filePath,
    required this.bytes,
  });
}
