import 'package:flutter/material.dart';
import 'package:reservia/widgets/reservation_car.dart';
import 'package:reservia/widgets/reservation_hotel.dart';

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({super.key});

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
   int _selectedIndex=0;
  static final List<Widget>_widgetOptions =<Widget>[
    const ReservationHotelScreen(),
    const ReservationCarScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mes Reservations'),
      ),
      
      body: Column(
        children: [
          
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton.icon(onPressed: (){
                    setState(() {
                     _selectedIndex = 0;
                    });
                  }, icon: const Icon(Icons.hotel), label: const Text('Hebergements',style: TextStyle(color: Colors.black),), style: const ButtonStyle(iconColor:MaterialStatePropertyAll(Color.fromARGB(255, 32, 31, 29)))),
                  ElevatedButton.icon(onPressed: (){
                    setState(() {
                     _selectedIndex = 1;
                    });
                  }, icon: const Icon(Icons.car_crash ,), label: const Text('Véhicules',style: TextStyle(color: Colors.black)),style: const ButtonStyle(iconColor:MaterialStatePropertyAll(Color.fromARGB(255, 32, 31, 29)))),
                
                ],
              ),
               const SizedBox(height: 20,),
             _widgetOptions[_selectedIndex],
        
          
        ],
      ),
    );
  }
}