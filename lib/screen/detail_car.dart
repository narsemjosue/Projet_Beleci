import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DetailCar extends StatefulWidget {
   DetailCar({super.key, required this.marque, required this.prix, required this.image, required this.assurance, required this.gprs});
  final marque;
  var prix;
  bool assurance;
  bool gprs;
  var image;

  

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
        firstDate: DateTime(_selectedDateStart!.day + 1),
        lastDate: lastDate);
    setState(() {
      _selectedDateEnd = pickedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          widget.marque,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                padding: EdgeInsets.all(20),
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
              child: ElevatedButton(onPressed: (){}, child: const Text("Reserver", style:TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),),
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
