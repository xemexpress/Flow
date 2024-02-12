import 'package:flow/src/constants/constants.dart';

class AppwriteConstants {
  // IP Address
  // static const String endPoint = 'http://localhost:80/v1';
  static String endPoint = IPConstants.endPoint;

  // General
  static const String projectId = '65b91426b4b2fcbfb459';
  static const String databaseId = '65bb639423e466afdeb1';

  // Collections
  static const String usersCollectionId = '65bb63a19c5de28ff6c8';
  static const String productsCollectionId = '65c256a95bf682e11534';

  // Storage
  static const String imagesBucketId = '65c72d6e502f380e09d2';

  // Events
  static String productDeleteEvent =
      'databases.*.collections.${AppwriteConstants.productsCollectionId}.documents.*.delete';
  static String productUpdateEvent =
      'databases.*.collections.${AppwriteConstants.productsCollectionId}.documents.*.update';
  static String productCreateEvent =
      'databases.*.collections.${AppwriteConstants.productsCollectionId}.documents.*.create';
}
