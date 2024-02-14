import 'package:reservia/screen/auth_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:reservia/screen/contain_profil.dart';


class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(    
      body: StreamBuilder(
          stream:FirebaseAuth.instance.authStateChanges() , 
          builder: (ctx, snapshot){
            // if(snapshot.connectionState == ConnectionState.waiting){
            //   return const SplashScreen();
            // }
            if(snapshot.hasData){
              return const ContainProfil();
            }
            return const AuthScreen();
          },
        ),
       
    );
  }
}