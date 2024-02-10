// import 'package:flow/src/models/user_model.dart';
// import 'package:flutter/material.dart';

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return FractionallySizedBox(
//       heightFactor: 0.94,
//       child: Container(
//         decoration: BoxDecoration(
//           color: Theme.of(context).colorScheme.surfaceVariant,
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Column(
//           children: [
//             AppBar(
//               title: Text(
//                 'Account',
//                 style: Theme.of(context).textTheme.titleMedium!.copyWith(
//                       fontWeight: FontWeight.bold,
//                     ),
//               ),
//               automaticallyImplyLeading: false,
//               actions: [
//                 TextButton(
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                   child: Text(
//                     'Done',
//                     style: Theme.of(context).textTheme.titleMedium!.copyWith(
//                           color: Theme.of(context).colorScheme.primary,
//                           fontWeight: FontWeight.bold,
//                         ),
//                   ),
//                 )
//               ],
//               backgroundColor: Colors.transparent,
//             ),
//             const CircleAvatar(
//               backgroundImage: NetworkImage(
//                 'https://res.cloudinary.com/unimemo-dfd94/image/upload/v1705308971/22487340_d7hjqv.jpg',
//               ),
//               radius: 50,
//             ),
//             const SizedBox(height: 10),
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//               decoration: BoxDecoration(
//                 color: Theme.of(context).colorScheme.background,
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'user.username',
//                     style: Theme.of(context).textTheme.titleLarge,
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
