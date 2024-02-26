import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ReservationCarScreen extends StatelessWidget {
  const ReservationCarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    SizedBox(
      height: 500,
      child: StreamBuilder(
      stream: FirebaseFirestore.instance.collection('reservationCar').snapshots(),
      builder: (ctx, carSnapshots) {
        final loadCar = carSnapshots.data!.docs;
        return ListView.builder(
           shrinkWrap: true,
             itemCount: loadCar.length,
             itemBuilder: (ctx, index) {
              final hot = loadCar[index].data();
             
            
            return Column(
              children: [
                Dismissible(
                 onDismissed: (d){
                  print(hot['datef']);
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
                              image:  DecorationImage(image:NetworkImage(hot['image']),
                              fit: BoxFit.fitHeight
                            )
                            ),
                          ),
                          const SizedBox(width: 40,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(hot['marque'].toString(),style:const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                              const Text("" ,style:TextStyle(fontSize: 15, fontWeight: FontWeight.w400),),
                              Text('12-2-2024',style:TextStyle(fontSize: 15, fontWeight: FontWeight.w400),),
                              Text('${hot['prix']} \$',style:const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),textAlign: TextAlign.start,),
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