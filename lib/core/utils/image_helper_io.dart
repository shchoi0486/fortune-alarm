import 'dart:io';
import 'package:flutter/widgets.dart';

ImageProvider? getPlatformFileImageProvider(String path) {
  return FileImage(File(path));
}
