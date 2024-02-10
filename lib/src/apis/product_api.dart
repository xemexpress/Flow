import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flow/src/constants/constants.dart';
import 'package:flow/src/core/core.dart';
import 'package:flow/src/models/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

final productAPIProvider = Provider((ref) {
  final databases = ref.watch(appwriteDatabasesProvider);
  final realtime = ref.watch(appwriteRealtimeProvider);

  return ProductAPI(
    db: databases,
    realtime: realtime,
  );
});

abstract class IProductAPI {
  FutureEither<Document> createProduct(Product product);
  Future<List<Document>> getProducts();
  Stream<RealtimeMessage> getLatestProducts();
}

class ProductAPI implements IProductAPI {
  final Databases _db;
  final Realtime _realtime;

  ProductAPI({
    required Databases db,
    required Realtime realtime,
  })  : _db = db,
        _realtime = realtime;

  @override
  FutureEither<Document> createProduct(Product product) async {
    try {
      final productDocument = await _db.createDocument(
        databaseId: AppwriteConstants.databaseId,
        collectionId: AppwriteConstants.productsCollectionId,
        documentId: ID.unique(),
        data: product.toMap(),
      );

      return Right(productDocument);
    } on AppwriteException catch (e, stackTrace) {
      return left(
        Failure(
          message: e.message ??
              "Some unexpected error occurred when creating product",
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

  @override
  Future<List<Document>> getProducts() async {
    return (await _db.listDocuments(
      databaseId: AppwriteConstants.databaseId,
      collectionId: AppwriteConstants.productsCollectionId,
    ))
        .documents;
  }

  @override
  Stream<RealtimeMessage> getLatestProducts() {
    return _realtime.subscribe(
      [
        'databases.${AppwriteConstants.databaseId}.collections.${AppwriteConstants.productsCollectionId}.documents',
      ],
    ).stream;
  }
}
