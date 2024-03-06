// ignore_for_file: prefer_typing_uninitialized_variables, duplicate_ignore

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:reservia/screen/reservation_screen.dart';

// ignore: must_be_immutable
class DetailCar extends StatefulWidget {
   DetailCar({super.key, required this.marque, required this.prix, required this.image, required this.assurance, required this.gprs, required this.identifiant});
  // ignore: prefer_typing_uninitialized_variables
  final marque;
  var prix;
  bool assurance;
  bool gprs;
  var image;
  var identifiant;
  

  @override
  State<DetailCar> createState() => _DetailCarState();
}

class _DetailCarState extends State<DetailCar> {
   DateTime? _selectedDateStart;
   DateTime? _selectedDateEnd;
    void _dataPickerStart() async {
    final now = DateTime.now();
    final lastDate = DateTime(now.year + 50);

    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: now,
        lastDate: lastDate);
    setState(() {
      _selectedDateStart = pickedDate;
    });
  }
  void _dataPickerEnd() async {
    final now = DateTime.now();
    final lastDate = DateTime(now.year + 50);

    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate:now,
        lastDate: lastDate);
    setState(() {
      _selectedDateEnd = pickedDate;
    });
  }

  void _submit(){
      final user = FirebaseAuth.instance.currentUser!;
      FirebaseFirestore.instance.collection('reservationCar').add({
          'idUser': user.uid,
          'dated': _selectedDateStart,
          'datef':_selectedDateEnd, 
          'marque': widget.marque,
          'prix':widget.prix,
          'image':widget.image,
          'gprs':widget.gprs,
          'assurance':widget.identifiant,
        });

        Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
          return const ReservationScreen();
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          widget.marque,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image:  DecorationImage(
                    image: NetworkImage(
                      widget.image,
                      
                    ),
                    fit: BoxFit.cover),
              ),
            ),
            Card(
              margin: const EdgeInsets.all(20),
              child:  Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Informations du vehicule",
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300)
                          ),
                    const SizedBox(
                        height: 10,
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       const Text(
                        "Prix",
                        // style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                      Text(widget.prix),
                    ],),
                    
                    const SizedBox(
                        height: 10,
                      ),
                   Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       const Text(
                        "Assurance ",
                        // style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                      Text( 
                      " ${widget.assurance? 'Oui': 'Non'}",
                      )
                    ],
                   ),
                    const SizedBox(
                        height: 10,
                      ),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       const Text(
                        "GPRS ",
                        // style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                      Text( 
                      " ${widget.gprs? 'Oui': 'Non'}",
                      )
                    ],
                   ),
                    const SizedBox(
                        height: 10,
                      ),
                      Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Date de début'),
                          Text(_selectedDateStart == null
                              ? 'No date selected'
                              : '${_selectedDateStart!.day}-${_selectedDateStart!.month}-${_selectedDateStart!.year}'),
                          IconButton(
                              onPressed: _dataPickerStart,
                              icon: const Icon(Icons.calendar_month))
                        ],
                      ),
                      Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Date de fin'),
                          Text(_selectedDateEnd == null
                              ? 'No date selected'
                              : '${_selectedDateEnd!.day}-${_selectedDateEnd!.month}-${_selectedDateEnd!.year}'),
                          IconButton(
                              onPressed: _dataPickerEnd,
                              icon: const Icon(Icons.calendar_month))
                        ],
                      )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:110),
              child: ElevatedButton(onPressed: _submit, child: const Text("Reserver", style:TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),),
            ),
             const SizedBox(
                        height: 15,
                      ),
          ],
        ),
      ),
    );
  }
}
