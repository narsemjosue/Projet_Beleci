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
  void setupPushNotifications() async {
    // final fcm = FirebaseMessaging.instance;
    //  await fcm.requestPermission();
    // //  final token = await fcm.getToken();
    // // print(token);
    // fcm.subscribeToTopic('chat');
  }
  @override
  void initState() {
    super.initState();

    setupPushNotifications();
  }

  @override
  Widget build(BuildContext context) {
    final authenticatedUser = FirebaseAuth.instance.currentUser!;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Styles.bgColor,
          title: Text("Narsem Josué"
            // authenticatedUser.email.toString()
            ),
          actions: [
            IconButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  print(authenticatedUser.uid);
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
                    image:const DecorationImage(image:NetworkImage('https://scontent-fra5-1.xx.fbcdn.net/v/t1.6435-9/125275584_1271472433230869_5278274844304975916_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=be3454&_nc_ohc=EaTqB5hgHj0AX8ZRU1I&_nc_ht=scontent-fra5-1.xx&oh=00_AfB6DXITlQ_HBW9XCnFOIUiBCbFGG87QpLDhiYT0kCfwNw&oe=65FAA6D9'), fit: BoxFit.fitWidth ),
                    ),
              ),
              const SizedBox(height: 30,),
             Container(
                color: Color.fromARGB(5, 89, 138, 244),
                height: 300,
                child:  ListView(children: [
                  Container(
                    height: 1,
                    color: Colors.grey,
                  ),
                ListTile(leading: Icon(Icons.people),
                  title: Text("Editer le Profil"), 
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                  return Building_Screen();
                })),
                ),
                Container(
                  height: 1,
                  color: Colors.grey,
                ), ListTile(leading:Icon(Icons.question_answer_outlined),
                    title:Text("Contacter le Service Clients"),
                
                 onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                  return Building_Screen();
                })),
                ),
                Container(
                  height: 1,
                  color: Colors.grey,
                ), ListTile(title: Text("Devenir Partenaire"),
                leading: Icon(Icons.handyman),
                 onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                  return Building_Screen();
                })),
                ),
                Container(
                  height: 1,
                  color: Colors.grey,
                ), ListTile(title: Text("Parametres"),
                leading: Icon(Icons.settings),
                 onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                  return Building_Screen();
                })),
                ),
                Container(
                  height: 1,
                  color: Colors.grey,
                ), ListTile(title: Text("Ajouter un Véhicule / Hébergement"),
                leading: Icon(Icons.add),
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
              // const SizedBox(height: 50,),
              // ElevatedButton.icon(onPressed: (){
              //   Navigator.of(context).push(MaterialPageRoute(builder: (context){
              //     return const AddScreen();
              //   }));
              // },  
              // label:  const Text("Ajouter un Véhicule / Hébergement"),
              // icon: Icon(Icons.add),
              // ),
          
            ],
          ),
        ));
  }
}
