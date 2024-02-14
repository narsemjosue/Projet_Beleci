import 'package:firebase_storage/firebase_storage.dart';
import 'package:reservia/widgets/user_image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';


class AddScreenCar extends StatefulWidget {
  const AddScreenCar({super.key});

  @override
  State<AddScreenCar> createState() => _AddScreenCarState();
}

class _AddScreenCarState extends State<AddScreenCar> {
  final _form =  GlobalKey<FormState>();
 
  var _enteredMark = '';
  var _enteredMatricule = '';
  var _enteredPrice = '';
  File? _selectedImage; 
  var _isAutheticating = false;
  bool ch2 = false;
  bool ch3 = false;
  void _submit(){
    //  setState(() {
    //   _isAutheticating = true;
    // });
    if(_form.currentState!.validate() && _selectedImage != null){
      final user = FirebaseAuth.instance.currentUser!;
      _form.currentState!.save();
       
       final storageRef = FirebaseStorage.instance
            .ref()
            .child('user_images')
            .child(_selectedImage.toString()+'.jpg');
             storageRef.putFile(_selectedImage!);
            final imageUrl =  storageRef.getDownloadURL();
      
         FirebaseFirestore.instance.collection('car').add({
          'idPaterner': user.uid,
          'matricule': _enteredMatricule,
          'marque': _enteredMark,
          'prix': _enteredPrice,
          'image':imageUrl,
          'gprs':ch2,
          'assurance':ch3,
        });
      
       
       Navigator.of(context).pop();
   
    }
    


  }
  

  @override
  Widget build(BuildContext context) {
    return  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(
                    top: 30, bottom: 20, left: 20, right: 20),
                width: 200,
                // child: Image.asset('assets/images/img_0.png'),
              ),
              Card(
                margin: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Form(
                      key: _form,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          UserImagePicker(
                            onPickImage: (pickedImage) {
                              _selectedImage = pickedImage;
                            },
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Marque',
                            ),
                            validator: (value) {
                              if (value == null ) {
                                return 'Champ requis';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _enteredMark = value!;
                            },
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                         
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Matricule',
                              ),
                              validator: (value) {
                                if (value == null ) {
                                  return 'Champ requis';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _enteredMatricule = value!;
                              },
                            ),
                          const SizedBox(
                            height: 12,
                          ),
                          TextFormField(
                            decoration:
                                const InputDecoration(labelText: 'Prix'),
                            validator: (value) {
                              if (value == null 
                                  ) {
                                return 'Champ requis';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _enteredPrice = value!;
                            },
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                        
                            Row(
                          children: [
                        
                         Text("GPRS"),
                          Checkbox(value: ch2, onChanged: (val){
                          setState(() {
                            ch2 = val!;
                          });
                         }),
                         Text("Assurance",),
                          Checkbox(value: ch3, onChanged: (val){
                          setState(() {
                            ch3 = val!;
                          });
                         }),
                         ],),
                          const SizedBox(
                            height: 12,
                          ),
                          if (_isAutheticating)
                            const CircularProgressIndicator(),
                          if (!_isAutheticating)
                            ElevatedButton(
                                onPressed:(){
                                  setState((){
                                  _submit();
                                });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 246, 242, 242),
                                ),
                                child: const Text("Valider")),
                          
                           
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
  }
}
