import 'package:flutter/material.dart';
import 'package:reservia/widgets/reservation.dart';

class ReservationScreen extends StatelessWidget {
  const ReservationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Mes Reservations"),
      ),
      body:const SingleChildScrollView(
        child:  Column(
          children: [
            Reservation(),
            Reservation(),
            Reservation(),
            Reservation(),
          ],
        ),
      )
    );
  }
}