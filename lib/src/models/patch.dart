// class Patch {
//   String id;
//   String productId; // Reference to the related product
//   String locationId;
//   DateTime dateOfManufacture;
//   int quantity;
//   String remarks;

//   Patch({
//     required this.id,
//     required this.productId,
//     required this.location,
//     required this.dateOfManufacture,
//     required this.quantity,
//     required this.remarks,
//   });

//   // Factory constructor for creating a new Patch instance from a map.
//   factory Patch.fromJson(Map<String, dynamic> json) {
//     return Patch(
//       id: json['id'],
//       productId: json['productId'],
//       location: json['location'],
//       dateOfManufacture: DateTime.parse(json['dateOfManufacture']),
//       quantity: json['quantity'],
//       remarks: json['remarks'],
//     );
//   }

//   // Method for converting Patch instance to a map.
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'productId': productId,
//       'location': location,
//       'dateOfManufacture': dateOfManufacture.toIso8601String(),
//       'quantity': quantity,
//       'remarks': remarks,
//     };
//   }
// }
