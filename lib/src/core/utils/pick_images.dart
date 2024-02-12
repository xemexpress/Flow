import 'dart:io';

import 'package:image_picker/image_picker.dart';

Future<List<File>> pickImages() async {
  final ImagePicker picker = ImagePicker();
  final imageFiles = await picker.pickMultiImage();

  return imageFiles
      .map(
        (image) => File(image.path),
      )
      .toList();
}
