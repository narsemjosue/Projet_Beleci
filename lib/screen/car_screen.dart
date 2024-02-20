import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:reservia/screen/detail_car.dart';
import 'package:reservia/utils/app_layout.dart';
import 'package:reservia/utils/app_style.dart';

class CarScreen extends StatelessWidget {
  const CarScreen({super.key,});

// final Map<String, dynamic> car;

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('car').snapshots(),
        builder: (ctx, carSnapshots) {
          final loadCar = carSnapshots.data!.docs;
           if(loadCar.isEmpty){
            return const Center(child:  Text('Nothing here!'));
          }
          return ListView.builder(
            scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(bottom: 40, left: 13, right: 13),
              itemCount: loadCar.length,
              itemBuilder: (ctx, index) {
                final hot = loadCar[index].data();
                return Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 17, top:5),
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
                      height: 350,
                      width: size.width*0.6,
                      decoration: BoxDecoration(
                     color: Styles.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Styles.primaryColor,
                          offset: Offset(4.0, 4.0),
                          blurRadius: 15,
                          spreadRadius: 1
                        ),
                         BoxShadow(
                          color: Colors.white,
                          offset: Offset(-4.0, -4.0),
                          blurRadius: 15,
                          spreadRadius: 1
                        )
                      ]
                      ),
                      
                      child:InkWell(
                         onTap: (){
                         var mark = hot['marque'];
                          Navigator.of(context).push(MaterialPageRoute(builder: (ctx){return   DetailCar(marque: mark,assurance: hot['assurance'],gprs: hot['gprs'],prix: hot['prix'],image: hot["image"],);}));
                         },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Container(
                              height: 180,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Styles.primaryColor,
                                image: DecorationImage(
                                    image: NetworkImage(hot['image']),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(hot["marque"],  style: Styles.headLineStyle2.copyWith(color: Styles.kakiColor),),
                            const SizedBox( height: 5,),
                            Text(
                              hot['typeCar'] ,
                              style: Styles.headLineStyle3.copyWith(
                                  color:const Color.fromARGB(255, 255, 255, 255)),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "${hot['prix']}\$/Day",
                           
                              style: Styles.headLineStyle2
                                  .copyWith(color: Styles.kakiColor),
                            ),
                          ],
                        ),
                      ),


                    ),
                  ],
                );
              
                 
              });
        });
  }
}