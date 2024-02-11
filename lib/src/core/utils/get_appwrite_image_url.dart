import 'package:flow/src/constants/constants.dart';

String getAppwriteImageUrl(String imageId) {
  return '${AppwriteConstants.endPoint}/storage/buckets/${AppwriteConstants.imagesBucketId}/files/$imageId/view?project=${AppwriteConstants.projectId}&mode=admin';
}
