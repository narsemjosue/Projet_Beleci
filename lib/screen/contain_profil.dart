import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:reservia/screen/add_screen.dart';
import 'package:reservia/utils/app_style.dart';
import 'package:reservia/utils/building_screen.dart';

class ContainProfil extends StatefulWidget {
  const ContainProfil({super.key});

  @override
  State<ContainProfil> createState() => _ContainProfilState();
}

class _ContainProfilState extends State<ContainProfil> {

  Map <String, dynamic> user = {} ;

  void getUser() async {
String identifiant = FirebaseAuth.instance.currentUser!.uid;
    
       await FirebaseFirestore.instance
                  .collection('users')
                  .doc(identifiant).get().then((value){
                      user = value.data()!;
                  });
  }
  String nom = '';
    String image = '';
  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    getUser();
     nom = user['username'];
     image = user['image_url'];
    
  }
 

  @override
  Widget build(BuildContext context) {              
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Styles.bgColor,
          title: Text(nom),
          actions: [
            IconButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                icon: Icon(
                  Icons.exit_to_app,
                  color: Styles.primaryColor,
                ))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(.0),
          child: Column(
            verticalDirection: VerticalDirection.down,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                    color: Styles.bgColor,
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(image:NetworkImage(image.toString()), fit: BoxFit.cover ),
                    ),
              ),
              const SizedBox(height: 30,),
             Container(
                color: const Color.fromARGB(5, 89, 138, 244),
                height: 300,
                child:  ListView(children: [
                  Container(
                    height: 1,
                    color: Colors.grey,
                  ),
                ListTile(leading: const Icon(Icons.people),
                  title: const Text("Editer le Profil"), 
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                  return const Building_Screen();
                })),
                ),
                Container(
                  height: 1,
                  color: Colors.grey,
                ), ListTile(leading:const Icon(Icons.question_answer_outlined),
                    title:const Text("Contacter le Service Clients"),
                
                 onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                  return const Building_Screen();
                })),
                ),
                Container(
                  height: 1,
                  color: Colors.grey,
                ), ListTile(title: const Text("Devenir Partenaire"),
                leading: const Icon(Icons.handyman),
                 onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                  return const Building_Screen();
                })),
                ),
                Container(
                  height: 1,
                  color: Colors.grey,
                ), ListTile(title: const Text("Parametres"),
                leading: const Icon(Icons.settings),
                 onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                  return const Building_Screen();
                })),
                ),
                Container(
                  height: 1,
                  color: Colors.grey,
                ), 
                if(user['username']=='Admin')
                  ListTile(title: const Text("Ajouter un Véhicule / Hébergement"),
                  leading: const Icon(Icons.add),
                  onTap:  (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return const AddScreen();
                  }));
                  },
                  ),
                Container(
                  height: 1,
                  color: Colors.grey,
                ),
             ]),
             ),
            ],
          ),
        ));
  }
}
