import 'dart:io';
import 'package:image/image.dart' as img;

void main() async {
  final inputPath = 'assets/icon/Fortune Icon_tran.png';
  if (!await File(inputPath).exists()) {
    print('Input file not found');
    return;
  }
  final bytes = await File(inputPath).readAsBytes();
  final image = img.decodePng(bytes);
  if (image == null) {
    print('Failed to decode');
    return;
  }
  print('Current size: ${image.width}x${image.height}');
}
