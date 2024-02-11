import 'dart:io';
import 'package:appwrite/appwrite.dart';
import 'package:flow/src/constants/constants.dart';
import 'package:flow/src/core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

final storageAPIProvider = Provider((ref) {
  final client = ref.watch(appwriteClientProvider);

  return StorageAPI(
    storage: Storage(client),
  );
});

abstract class IStorageAPI {
  FutureEither<List<String>> uploadImages(List<File> file);
}

class StorageAPI implements IStorageAPI {
  final Storage _storage;

  StorageAPI({
    required Storage storage,
  }) : _storage = storage;

  @override
  FutureEither<List<String>> uploadImages(List<File> files) async {
    final List<String> imageLinks = [];

    try {
      for (var file in files) {
        final uploadedImage = await _storage.createFile(
          bucketId: AppwriteConstants.imagesBucketId,
          fileId: ID.unique(),
          file: InputFile.fromPath(
            path: file.path,
          ),
        );

        imageLinks.add(getAppwriteImageUrl(uploadedImage.$id));
      }

      return right(imageLinks);
    } on AppwriteException catch (e, stackTrace) {
      return left(
        Failure(
          message: e.message != null
              ? 'Image Upload Error: ${e.message}'
              : "Some unexpected error occurred when uploading images",
          stackTrace: stackTrace,
        ),
      );
    } catch (e, stackTrace) {
      return left(
        Failure(
          message: e.toString(),
          stackTrace: stackTrace,
        ),
      );
    }
  }
}
