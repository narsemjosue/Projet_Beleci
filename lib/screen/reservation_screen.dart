import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:reservia/models/hotel.dart';
import 'package:reservia/widgets/reservation_hotel.dart';

class ReservationScreen extends StatelessWidget {
  const ReservationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mes Reservations'),),
      body: Column(
        children: [
          const Text('Hotels'),
          Container(
            color: Colors.grey,
            width: double.infinity,
            height: 1,
          ),
          const ReservationHotelScreen(),
          const SizedBox(height: 20,),
           const Text('Véhicules'),
          Container(
            color: Colors.grey,
            width: double.infinity,
            height: 1,
          ),
          const ReservationHotelScreen(),
        ],
      ),
    );
  }
}