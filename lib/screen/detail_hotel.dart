import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:reservia/utils/app_style.dart';

class DetailHotel extends StatefulWidget {
 DetailHotel({super.key, required this.urlImage,required this.nom, required this.clim, required this.internet, required this.nbrLits, required this.tv, required this.type, required this.localisation });
 var urlImage;
 var nom;
 var type;
 var nbrLits;
 var localisation;
 bool clim;
 bool internet;
 bool tv;

  @override
  State<DetailHotel> createState() => _DetailHotelState();
}

class _DetailHotelState extends State<DetailHotel> {
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
    final lastDate = DateTime(now.year + 50 );

    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: now,
        lastDate: lastDate);
    setState(() {
      _selectedDateEnd = pickedDate;
    });
  }

  void _submit(){
      final user = FirebaseAuth.instance.currentUser!;
      FirebaseFirestore.instance.collection('reservation').add({
          'image': "urlImage",
          'nom': '_enteredName',
          'prix': '_enteredPrice',
          'etoile': '_enteredStar',
          'type': 'type',
          'nbrLit':'imageUrl',
          'localisation':'_localisation',
          'clim':'ch1',
          'internet':'ch2',
          'tv':'ch3',
          'nbrLits':'_enteredLit'
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.nom,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Styles.bgColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image:  DecorationImage(
                  image: NetworkImage(widget.urlImage),
                  fit: BoxFit.cover),
            ),
          ),
           Card(
             margin: const EdgeInsets.all(20),
             child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              const Text("Détails d'hébergement",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300)),
              const SizedBox(
                height: 5,
              ),
              const Text("Type:",style: TextStyle(),),
              Text("${widget.type}",style: const TextStyle(),),
             
             const  Text("Localisation:",style: TextStyle(),),
              Text("${widget.localisation}",style: const TextStyle(),),
              
              Row(children: [
               const Text(
                "Climatisation: ",
                style: TextStyle(),
              ),Text(
                " ${widget.clim? 'Oui': 'Non'}",
                style: const TextStyle(),
              ),
              ],),
             const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Text(
                "Internet: ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
              ),Text(
                "${widget.internet? 'Oui':'Non'}",
                // style:const TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
              ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
             Row(
              children: [
                 const Text(
                "TV: ",
                // style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ), Text(
                "${widget.tv? 'Oui': 'Non'}",
                // style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
              ),
              ],
             ),
            //  const SizedBox(
            //     height: 10,
            //   ),
              Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Date de début'),
                          Text(_selectedDateStart == null
                              ? 'No date selected'
                              : _selectedDateStart!.day.toString() + '-' + _selectedDateStart!.month.toString() + '-' + _selectedDateStart!.year.toString()),
                          IconButton(
                              onPressed: _dataPickerStart,
                              icon: const Icon(Icons.calendar_month))
                        ],
                      ),
                      Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Date de fin'),
                          Text(_selectedDateEnd == null
                              ? 'No date selected'
                              : _selectedDateEnd!.day.toString() + '-' + _selectedDateEnd!.month.toString() + '-' + _selectedDateEnd!.year.toString()),
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
          )
          ],
        ),
      ),
    );
  }
}
