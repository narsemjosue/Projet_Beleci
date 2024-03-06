import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ReservationHotelScreen extends StatelessWidget {
  const ReservationHotelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    SizedBox(
      height: 500,
      child: StreamBuilder(
      stream: FirebaseFirestore.instance.collection('reservationHotel').snapshots(),
      builder: (ctx, carSnapshots) {
        final loadCar = carSnapshots.data!.docs;
        if(carSnapshots.data!.docs.isEmpty){
          return const Center(child: Text('Pas de reservation d\'hebergement en cours'),);
        }
        return ListView.builder(
           shrinkWrap: true,
             itemCount: loadCar.length,
             itemBuilder: (ctx, index) {
              final hot = loadCar[index].data();
             
            
        return Column(
          children: [
            Dismissible(
                onDismissed: (d){
                  FirebaseFirestore.instance
                  .collection('reservationHotel')
                  .doc(loadCar[index].id).delete();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Reservation annulée', style: TextStyle(color: Colors.white),))
                   );
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
                              Text(hot['nom'].toString(),style:const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                              const Text("" ,style:TextStyle(fontSize: 15, fontWeight: FontWeight.w400),),
                              const Text('',style:TextStyle(fontSize: 15, fontWeight: FontWeight.w400),),
                              const Text("15000f/jour",style:TextStyle(fontSize: 15, fontWeight: FontWeight.w600),),
                            ],
                          )
                        ] 
                      ),
                  ),
                ),
              ),
              const SizedBox(height: 5,)
          ],
        );
              }
              
              
        );}
        
        ),
    );
  }  
}