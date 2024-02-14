// import 'package:flutter/material.dart';
// import 'package:reservia/screen/detail_hotel.dart';
// import 'package:reservia/utils/app_layout.dart';
// import 'package:reservia/utils/app_style.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'dart:io';

// class HotelScr extends StatelessWidget {
//   const HotelScr({super.key, required this.hotel});

// final Map<String, dynamic> hotel;


//   @override
//   Widget build(BuildContext context) {
//     final size = AppLayout.getSize(context);
//     return Container(
//       width: size.width*0.6,
//       height: 350,
//       padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
//       margin: const EdgeInsets.only(right: 17, top:5),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(24),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.shade200,
//             blurRadius: 2,
//             spreadRadius: 5
//           ),
//         ],
//         color: Styles.primaryColor,
//       ),
//       child: InkWell(
//         onTap: (){
//           Navigator.of(context).push(MaterialPageRoute(builder: (ctx){return  DetailHotel(urlImage: );}));
//         },
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               height: 180,
//               decoration:  BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//                 color: Styles.primaryColor,
//                 image: DecorationImage(image: AssetImage('assets/images/${hotel['image']}',),
//                             fit: BoxFit.cover
//                           ),
//               ),
//             ),
//             const SizedBox(height:10 ,),
//             Text(hotel['place'] , style: Styles.headLineStyle2.copyWith(color:Styles.kakiColor ),),
//             const SizedBox(height: 5,),
//             Text(hotel['destination'], style: Styles.headLineStyle3.copyWith(color:Colors.white ),),
//             const SizedBox(height: 8,),
//             Text("\$${hotel['price']}/Night", style: Styles.headLineStyle2.copyWith(color:Styles.kakiColor ),),
        
//           ],
//         ),
//       ),

//     );
//   }
// }