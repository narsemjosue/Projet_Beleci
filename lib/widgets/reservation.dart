import 'package:flutter/material.dart';


class Reservation extends StatelessWidget {
  const Reservation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 20,),
          Dismissible(
            key: GlobalKey(),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
              width: double.infinity,
              
              decoration: BoxDecoration(
                color: const Color.fromARGB(106, 198, 196, 196),
                borderRadius: BorderRadius.circular(20)
              ),
              child:  Padding(
                padding:  const EdgeInsets.all(20),
                child: Row(
                    //  crossAxisAlignment: CrossAxisAlignment.baseline,
                    children:[
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          image: const DecorationImage(image: AssetImage('assets/images/img_0.png',),
                        )
                        ),
                      ),
                      const SizedBox(width: 20,),
                      const Column(
                        children: [
                          Text("Rav4 Toyota",style:TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          Text("Du 12-01-2024",style:TextStyle(fontSize: 15, fontWeight: FontWeight.w400),),
                          Text("Au 18-01-2024",style:TextStyle(fontSize: 15, fontWeight: FontWeight.w400),),
                          Text("15000f/jour",style:TextStyle(fontSize: 15, fontWeight: FontWeight.w600),textAlign: TextAlign.start,),
                        ],
                      )
                    ] 
                  ),
              ),
            ),
          ),
        ],
      );
  }
}