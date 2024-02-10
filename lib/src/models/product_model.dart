import 'package:flutter/foundation.dart';

class Product {
  final String id;
  final String name;
  final String barcode;
  final int quantity;
  final List<String> followers;
  final List<String> imageLinks;
  final List<String> patches;
  final List<String> tags;
  final String remarks;
  final DateTime createdAt;
  final DateTime updatedAt;

  Product({
    required this.id,
    required this.name,
    required this.barcode,
    required this.quantity,
    required this.followers,
    required this.imageLinks,
    required this.patches,
    required this.tags,
    required this.remarks,
    required this.createdAt,
    required this.updatedAt,
  });

  Product copyWith({
    String? id,
    String? name,
    String? barcode,
    int? quantity,
    List<String>? staffInCharge,
    List<String>? imageLinks,
    List<String>? patches,
    List<String>? tags,
    String? remarks,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      barcode: barcode ?? this.barcode,
      quantity: quantity ?? this.quantity,
      followers: staffInCharge ?? this.followers,
      imageLinks: imageLinks ?? this.imageLinks,
      patches: patches ?? this.patches,
      tags: tags ?? this.tags,
      remarks: remarks ?? this.remarks,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'barcode': barcode,
      'quantity': quantity,
      'staffInCharge': followers,
      'imageLinks': imageLinks,
      'patches': patches,
      'tags': tags,
      'remarks': remarks,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['\$id'] as String,
      name: map['name'] as String,
      barcode: map['barcode'] as String,
      quantity: map['quantity'] as int,
      followers: List<String>.from(map['followers']),
      imageLinks: List<String>.from(map['imageLinks']),
      patches: List<String>.from(map['patches']),
      tags: List<String>.from(map['tags']),
      remarks: map['remarks'] as String,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int),
    );
  }

  @override
  String toString() {
    return 'ProductModel(id: $id, name: $name, barcode: $barcode, quantity: $quantity, staffInCharge: $followers, imageLinks: $imageLinks, patches: $patches, tags: $tags, remarks: $remarks, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.barcode == barcode &&
        other.quantity == quantity &&
        listEquals(other.followers, followers) &&
        listEquals(other.imageLinks, imageLinks) &&
        listEquals(other.patches, patches) &&
        listEquals(other.tags, tags) &&
        other.remarks == remarks &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        barcode.hashCode ^
        quantity.hashCode ^
        followers.hashCode ^
        imageLinks.hashCode ^
        patches.hashCode ^
        tags.hashCode ^
        remarks.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
