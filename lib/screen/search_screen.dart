import 'package:flutter/material.dart';
import 'package:reservia/utils/app_layout.dart';
import 'package:reservia/utils/app_style.dart';
import 'package:reservia/widgets/double_text_widget.dart';
import 'package:reservia/widgets/icon_text_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          const SizedBox(height: 40,),
          Text('What are \n you looking for?', style: Styles.headLineStyle1.copyWith(fontSize: 35),),
          const SizedBox(height: 20,),
          FittedBox(
            child: Container(
              padding: const EdgeInsets.all(3.5),
              child: Row(
                children: [
                  /* airline ticket*/
                  Container(
                    width: size.width*.44,
                    padding: EdgeInsets.symmetric(vertical: 7),
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.horizontal(left: Radius.circular(50)),
                    color:  Colors.white,
                  ),
                    child: Center(child: Text("Airline ticket")),
                  ),
                   Container(
                    width: size.width*.44,
                    padding: EdgeInsets.symmetric(vertical: 7),
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.horizontal(right: Radius.circular(50)),
                    color:  Colors.transparent,
                    ),
                    child: Center(child: Text("Hotel")),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: const Color(0xFFF4F6FD),
              ),
            ),
          ),
          const SizedBox(height: 25,),
          const AppIconText(icon: Icons.flight_takeoff_rounded, text: 'Departure'),  
          const SizedBox(height: 25,),
          const AppIconText(icon: Icons.flight_land_rounded, text: 'Arrival'),
          const SizedBox(height:25),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 18, horizontal: 15
            ),
            decoration: BoxDecoration(
              color: const Color(0xD91130CE),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text('find tickets', style: Styles.textStyle.copyWith(color: Colors.white),),
            ),
          ),
          const SizedBox(height: 40,),
          const AppDoubleTextWidget(bigText: 'Upcoming Flights', smalText: 'View all'),
          const SizedBox(height:15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                // color: Colors.amber,
                height: 425,
                width: size.width*0.42,
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 1,
                      spreadRadius: 1
                    )
                  ]
                ),
                child: Column(
                  children: [
                    Container(
                      // color: Colors.blue,
                      height: 190,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: const DecorationImage(image: AssetImage("assets/images/img_7.jpg"),
                        fit: BoxFit.cover
                        )
                      ),
                    ),
                    // const SizedBox(height: 12,),
                    Text(
                      "20% discount on the early booking of this flight.",
                      style: Styles.headLineStyle2,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Stack(
                    children: [
                      
                  Container(
                    width: size.width*.44,
                    height: 210,
                    decoration: BoxDecoration(
                      color: const Color(0xFF3AB8B8),
                      borderRadius: BorderRadius.circular(18)
                    ),
                    padding: const EdgeInsets.symmetric(vertical:15, horizontal: 15 ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Discount\n for survey", style: Styles.headLineStyle2.copyWith(fontWeight: FontWeight.bold, color: Colors.white),),
                        const SizedBox(height: 10,),
                        Text("Take the survey about our services and get discout", style: Styles.headLineStyle2.copyWith(fontWeight: FontWeight.w500, color: Colors.white, fontSize: 18),),

                      ],
                    ),
                  ),
                  Positioned(
                    right: -45,
                    top: -40,
                    child: Container(
                      padding: EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 18, color: const Color(0xFF189999)),
                        color: Colors.transparent,
                      ),
                    ),
                  )
                
                    ],
                  ),
                  const SizedBox(height: 15,),
                  Container(
                    width: size.width*.44,
                    height: 190,
                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                    decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: const Color(0xFFEC6545),
                    ),
                    child: Column(
                      children: [
                        Text("Take love", style: Styles.headLineStyle2.copyWith(color: Colors.white, fontWeight: FontWeight.bold),textAlign:TextAlign.center ,),
                        const SizedBox(height: 5,),
                        RichText(text: const TextSpan(
                          children: [
                            TextSpan(
                              text: '🥰',
                              style: TextStyle(fontSize: 28)
                            ),
                            TextSpan(
                              text: '🥰',
                              style: TextStyle(fontSize: 40)
                            ),
                            TextSpan(
                              text: '🥰',
                              style: TextStyle(fontSize: 28)
                            )
                          ]
                        ))

                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}