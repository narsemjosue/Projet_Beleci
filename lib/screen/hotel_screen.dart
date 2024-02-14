import 'package:flutter/material.dart';
import 'package:reservia/utils/app_layout.dart';
import 'package:reservia/screen/detail_hotel.dart';
import 'package:reservia/utils/app_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class HotelScreen extends StatelessWidget {
const HotelScreen({super.key,});
  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('hotel').snapshots(),
        builder: (ctx, snapshots) {
          final loadCar = snapshots.data!.docs;
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
                      borderRadius: BorderRadius.circular(24),),
                      
                      child:InkWell(
                         onTap: (){
                         var mark = hot['image'];
                          Navigator.of(context).push(MaterialPageRoute(builder: (ctx){return  DetailHotel(urlImage: mark,nom: hot['nom'],clim: hot['clim'],internet: hot["internet"],nbrLits: hot['nbrLits'],tv: hot['tv'],type: hot['type'],localisation: hot['localisation'],);}));
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
                            Text(hot["nom"],  style: Styles.headLineStyle2.copyWith(color: Styles.kakiColor),),
                            const SizedBox( height: 5,),
                            Text(
                              hot['type'] ,
                              style: Styles.headLineStyle3.copyWith(
                                  color: Color.fromARGB(255, 255, 255, 255)),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "${hot['prix']}\$/Night",
                           
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
