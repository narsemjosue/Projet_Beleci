import 'package:reservia/utils/app_style.dart';
import 'package:reservia/widgets/user_image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';

final _firebase = FirebaseAuth.instance;

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _form = GlobalKey<FormState>();
  var _isLogin = true;
  var _enteredEmail = '';
  var _enteredPassword = '';
  var _enteredUsername = '';
  File? _selectedImage;
  var _isAutheticating = false;
  void _submit() async{
    final isValid = _form.currentState!.validate();
    
    if(!isValid || !_isLogin && _selectedImage == null){
      return;
    }

    _form.currentState!.save();

    try{
      setState(() {
        _isAutheticating = true;
      });
      if(_isLogin){
        //log use in
           await _firebase.signInWithEmailAndPassword(
          email: _enteredEmail, password: _enteredPassword);
          // print(userCredentials);
          }
      else{
        // create new user
          final userCredentials = await _firebase.createUserWithEmailAndPassword(
          email: _enteredEmail, password: _enteredPassword);
        final storageRef = FirebaseStorage.instance
            .ref()
            .child('user_images')
            .child('${userCredentials.user!.uid}.jpg');
            await storageRef.putFile(_selectedImage!);
            final imageUrl = await storageRef.getDownloadURL();

            FirebaseFirestore.instance.
            collection('users').
            add({
              'idUser':userCredentials.user!.uid,
              'username': _enteredUsername,
              'email': _enteredEmail,
              'image_url': imageUrl,
            });
        }
    }
    on FirebaseAuthException catch(error){
      if(error.code == 'email-already-in-use'){
        // ..
      }
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.message?? 'Authentication failed.'),
        ),
      );
      setState(() {
        _isAutheticating = false;
      });
    }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 100,),
              Text(_isLogin? "Connexion" : "Inscription", style:  const TextStyle(fontSize: 24, fontWeight: FontWeight.w400, color: Color.fromARGB(255, 113, 2, 102)),),
                Card(
                margin: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Padding(
                    padding:  const EdgeInsets.all(16),
                    child: Form(
                      key: _form,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if(!_isLogin)
                           UserImagePicker(onPickImage: (pickedImage){
                            _selectedImage = pickedImage;
                           },),
                          TextFormField(
                            decoration:  const InputDecoration(
                              labelText: 'Adresse Email'
                            ),
                            keyboardType: TextInputType.emailAddress,
                            autocorrect: false,
                            textCapitalization: TextCapitalization.none,
                            validator: (value){
                              if(value == null || value.trim().isEmpty || !value.contains("@")){
                                return 'Please enter a valid email adress.';
                              }
                              return null;
                            },
                            onSaved: (value){
                              _enteredEmail = value!;
                            },
                          ),
                          if(!_isLogin)
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: "Nom d'utilisateur"
                              ),
                              enableSuggestions: false,
                              validator: (value){
                                if(value == null|| value.isEmpty||value.trim().length<4){
                                  return 'Please enter at least 4 characters.';
                                }
                                return null;
                              },
                              onSaved: (value){
                                _enteredUsername= value!;
                              },
                            ),
                          TextFormField(
                            decoration:  const InputDecoration(
                              labelText: 'Mot de passe',
                            ),
                            // keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                              validator: (value){
                              if(value == null || value.trim().length < 6){
                                return 'Password must be at least 6 characters long.';
                              }
                              return null;
                            },
                            onSaved: (value){
                              _enteredPassword = value!;
                            },
                          ),
                          const SizedBox(height: 12,),
                          if(_isAutheticating)
                            const CircularProgressIndicator(),
                          if(!_isAutheticating)
                            ElevatedButton(
                              onPressed: _submit, 
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(255, 246, 242, 242),
                              ),
                              child:  Text(_isLogin? "Connexion" : "Inscription")
                            ),
                          if(!_isAutheticating)
                            TextButton(onPressed: (){
                              setState(() {
                                _isLogin = !_isLogin;
                              });
                            }, 
                              child: Text(_isLogin? "S'inscrire" : "J'ai déja un compte. Se connecter")
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}