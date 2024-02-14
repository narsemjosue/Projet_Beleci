import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:reservia/screen/add_screen.dart';
import 'package:reservia/utils/app_style.dart';

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
          title: Text(authenticatedUser.email.toString()),
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            verticalDirection: VerticalDirection.down,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      color: Styles.bgColor,
                      borderRadius: BorderRadius.circular(100)),
                      child: const Center(child: Text("Profil", style: TextStyle(color: Color.fromARGB(255, 13, 9, 9), fontSize: 35, fontWeight: FontWeight.bold),)),
                ),
              ),
              const SizedBox(height: 100,),
              Text("Nom d'utilisateur", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),),
              Text("Nom d'utilisateur", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),),
              Text("Nom d'utilisateur", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),),
              Text("Nom d'utilisateur", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),),
              const SizedBox(height: 50,),
              TextButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return const AddScreen();
                }));
              }, child: const Text("Hébergement un bien"))
          
            ],
          ),
        ));
  }
}
