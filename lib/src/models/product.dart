// class Product {
//   String barcode;
//   String brand;
//   String name;
//   String profilePhoto;
//   String email;
//   String uid;
//
//   Product(
//       {required this.name,
//         required this.email,
//         required this.uid,
//         required this.profilePhoto});
//
//   Map<String, dynamic> toJson() => {
//     "name": name,
//     "profilePhoto": profilePhoto,
//     "email": email,
//     "uid": uid,
//   };
//
//   static Product fromSnap(DocumentSnapshot snap) {
//     var snapshot = snap.data() as Map<String, dynamic>;
//     return Product(
//       email: snapshot['email'],
//       profilePhoto: snapshot['profilePhoto'],
//       uid: snapshot['uid'],
//       name: snapshot['name'],
//     );
//   }
// }