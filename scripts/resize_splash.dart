import 'dart:io';
import 'package:image/image.dart' as img;

void main() {
  final imageFile = File('assets/icon/Fortune Icon_tran.png');
  if (!imageFile.existsSync()) {
    print('Image not found');
    return;
  }

  final bytes = imageFile.readAsBytesSync();
  final image = img.decodeImage(bytes);

  if (image == null) {
    print('Failed to decode image');
    return;
  }

  // [사용자 요청] 아이콘이 너무 작아졌으므로 캔버스 크기를 1.5배로 조정
  // 1.5배 캔버스에 아이콘을 배치하면 약 66% 크기로 보이며, 안드로이드 12 Safe Zone 내에 안정적으로 위치함
  final int newSize = (image.width * 1.5).toInt();
  final int offsetX = (newSize - image.width) ~/ 2;
  final int offsetY = (newSize - image.height) ~/ 2;

  // 투명 배경을 가진 새로운 이미지 생성
  // image 4.x 버전에서는 기본적으로 투명하게 생성되거나 numChannels를 명시할 수 있음
  final newImage = img.Image(width: newSize, height: newSize, numChannels: 4);
  
  // Draw the original image onto the center of the new image
  img.compositeImage(newImage, image, dstX: offsetX, dstY: offsetY);

  final resizedFile = File('assets/icon/FortuneAlarm-splash.png');
  resizedFile.writeAsBytesSync(img.encodePng(newImage));

  print('Created assets/icon/FortuneAlarm-splash.png with 1.5x padding (standard adaptive icon)');
}
