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
                          image: const DecorationImage(image:NetworkImage('https://th.bing.com/th/id/R.b769ff89b218e1c012cd03acd4e03779?rik=tk9MV4qM7ZkQUw&pid=ImgRaw&r=0'),
                          fit: BoxFit.fitHeight
                        )
                        ),
                      ),
                      const SizedBox(width: 40,),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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