import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:reservia/screen/car_screen.dart';
import 'package:reservia/screen/hotel_screen.dart';
import 'package:reservia/utils/app_style.dart';
import 'package:reservia/widgets/double_text_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor:Styles.bgColor,
      body: ListView(
        children: [
           Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                const SizedBox(height: 40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text('Good morning', style: Styles.headLineStyle3,),
                         const SizedBox(height: 5,),
                         Text('Reservia.com', style: Styles.headLineStyle1,),
                      ],
                    ),
                    Container(
                      height:50, 
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: const DecorationImage(image: AssetImage('assets/images/img_0.png',),
                          fit: BoxFit.cover
                        ),
                      ),
                    )
                  ]
                ),
                const SizedBox(height: 25,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFF4F6FD),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    children: [
                      const Icon(FluentSystemIcons.ic_fluent_search_regular, color: Color(0xFFBFC205),),
                      Text("Search", style: Styles.headLineStyle4,),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(children: [
              const SizedBox(height: 15,),
          const SizedBox(height: 15,),
          StreamBuilder(
          stream:FirebaseAuth.instance.authStateChanges() , 
          builder: (ctx, snapshot){
            if(ConnectionState.waiting == true){
              return const Center(child:  Text('Nothing here!'));

            }
            if(!snapshot.hasData){
              return const Center(child:  Text('Nothing here!'));
            }
            return Column(
              children: [
                  Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const AppDoubleTextWidget(bigText: 'Hotels', smalText: 'View all'),
          ),
          const SizedBox(height: 15,),
          SizedBox(
            height:370,
            child: HotelScreen()),
            Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
             child: const AppDoubleTextWidget(bigText: 'Cars', smalText: 'View all'),
           ),
           const SizedBox(height: 15,),
             const SizedBox(
            height:370,
            child: CarScreen()),
              ],
            );
          },
        ),
          
           ]
           ),
          )
        ],
      ),
    );
  }
}