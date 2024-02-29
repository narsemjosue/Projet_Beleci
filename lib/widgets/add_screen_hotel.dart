import 'package:firebase_storage/firebase_storage.dart';
import 'package:reservia/widgets/user_image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';


class AddScreenHotel extends StatefulWidget {
  const AddScreenHotel({super.key});

  @override
  State<AddScreenHotel> createState() => _AddScreenHotelState();
}

class _AddScreenHotelState extends State<AddScreenHotel> {
  final _form =  GlobalKey<FormState>();
  var type = 'Appartement meublé';
  bool ch1 = false;
  bool ch2 = false;
  bool ch3 = false;
  var _enteredName = '';
  var _enteredLit = '';
  var _localisation = '';
  var _enteredPrice = '';
  var _enteredStar = '';
  File? _selectedImage; 
  var _isAutheticating = false;

  void _addHotel() async{
    // setState(() {
    //   _isAutheticating = true;
    // });
    if(_form.currentState!.validate() && _selectedImage != null){
      final user = FirebaseAuth.instance.currentUser!;
      _form.currentState!.save();
       
       final storageRef = FirebaseStorage.instance
            .ref()
            .child('user_images')
            .child('${_enteredName+_localisation+type}.jpg');
             storageRef.putFile(_selectedImage!);
            final imageUrl =  await storageRef.getDownloadURL();
      
         FirebaseFirestore.instance.collection('hotel').add({
          'idPaterner': user.uid,
          'nom': _enteredName,
          'prix': _enteredPrice,
          'etoile': _enteredStar,
          'type': type,
          'image':imageUrl,
          'localisation':_localisation,
          'clim':ch1,
          'internet':ch2,
          'tv':ch3,
          'nbrLits':_enteredLit
        });
      
       
       Navigator.of(context).pop();
   
    }
    


  }
  

  @override
  Widget build(BuildContext context) {
    return  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
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
                              decoration:
                                  const InputDecoration(labelText: 'Nom'),
                              validator: (value) {
                                if (value == null )
                                     {
                                      
                                  return 'Champ requis.';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _enteredName = value!;
                              },
                            ),

                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            decoration:
                                const InputDecoration(labelText: 'Prix'),
                                keyboardType: TextInputType.number,
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
                            height: 5,
                          ),
                          
                            TextFormField(
                              decoration: const InputDecoration(
                                  labelText: "Nombre d'étoile"),
                                  keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value == null ) {
                                  return 'Champ requis.';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _enteredStar = value!;
                              },
                            ),
                            const SizedBox(height:5),
                            TextFormField(
                              decoration: const InputDecoration(
                                  labelText: "Nombre de Lits"),
                                  keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value == null ) {
                                  return 'Champ requis.';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _enteredLit = value!;
                              },
                            ),
                            const SizedBox(height:5),
                            TextFormField(
                              decoration: const InputDecoration(
                                  labelText: "Localisation",),
                              validator: (value) {
                                if (value == null ) {
                                  return 'Champ requis.';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _localisation = value!;
                              },
                            ),
                          const SizedBox(
                            height: 12,
                          ),
                           Container(
                            alignment: Alignment.topLeft,
                            child: const Text('Veuillez choisir le type', style:TextStyle(fontWeight: FontWeight.w400, fontSize: 16),)),
                         Row(
                          children: [
                           Radio(value: 'Appartement meublé', groupValue: type, onChanged: (value){
                              setState(() {
                                type = value!;
                              });
                           }),
                           Text('Appartement meublé')
                          ],
                         ),
                          Row(
                          children: [
                           Radio(value: "Maison de vaccance", groupValue: type, onChanged: (value){
                            setState(() {
                                type = value!;
                              });
                           }),
                             Text('Maison de vacance/villa')
                          ],
                         ),
                          Row(
                          children: [
                           Radio(value: "Hotel, chambre d'hôte", groupValue: type, onChanged: (value){
                            setState(() {
                                type = value!;
                              });
                           }),
                             Text("Hotel, chambre d'hôte")
                          ],
                         ),
                         Row(
                          children: [
                          Text("Climatisation"),
                          Checkbox(value: ch1, onChanged: (val){
                          setState(() {
                            ch1 = val!;
                          });
                         }),
                         Text("Internet"),
                          Checkbox(value: ch2, onChanged: (val){
                          setState(() {
                            ch2 = val!;
                          });
                         }),
                         Text("TV"),
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
                                  _addHotel();
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
