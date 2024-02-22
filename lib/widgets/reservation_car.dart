import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ReservationCarScreen extends StatelessWidget {
  const ReservationCarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    Container(
      height: 250,
      child: StreamBuilder(
      stream: FirebaseFirestore.instance.collection('reservationCar').snapshots(),
      builder: (ctx, carSnapshots) {
        final loadCar = carSnapshots.data!.docs;
        return ListView.builder(
           
             itemCount: loadCar.length,
             itemBuilder: (ctx, index) {
              final hot = loadCar[index].data();
             
            
               return Dismissible(
            onDismissed: (d){
              
            },
            key: GlobalKey(),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
              width: double.infinity,
              
              decoration: const BoxDecoration(
                color:  Color.fromARGB(106, 198, 196, 196),
                // borderRadius: BorderRadius.circular(20)
              ),
              child:  Padding(
                padding:  const EdgeInsets.all(0),
                child: Row(
                    //  crossAxisAlignment: CrossAxisAlignment.baseline,
                    children:[
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0),
                          image:  DecorationImage(image:NetworkImage(hot['urlImage']),
                          fit: BoxFit.fitHeight
                        )
                        ),
                      ),
                      const SizedBox(width: 40,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(hot['nom'].toString(),style:TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          Text("" ,style:TextStyle(fontSize: 15, fontWeight: FontWeight.w400),),
                          Text('',style:TextStyle(fontSize: 15, fontWeight: FontWeight.w400),),
                          Text("15000f/jour",style:TextStyle(fontSize: 15, fontWeight: FontWeight.w600),textAlign: TextAlign.start,),
                        ],
                      )
                    ] 
                  ),
              ),
            ),
          );
              }
              
              
        );}
        
        ),
    );
  }  
}