import 'package:reservia/utils/app_style.dart';
import 'package:reservia/widgets/add_screen_car.dart';
import 'package:reservia/widgets/add_screen_hotel.dart';
import 'package:flutter/material.dart';


class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  var _isHotel = true;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Styles.bgColor,
      body: SingleChildScrollView(
            child: Center(
              child: Column(
                                // mainAxisSize: MainAxisSize.min,
                                children: [
                                  const SizedBox(height: 100,),
                                  Text(!_isHotel
                                            ? 'Ajouter un véhicule.'
                                            : 'Ajouter un hébergement.', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w400),),
                                 
                                  if(_isHotel)
                                    const AddScreenHotel(),
                                  if(!_isHotel)
                                    const AddScreenCar(),
                                    TextButton(
                                        onPressed: () {
                                          setState(() {
                                            _isHotel = !_isHotel;
                                          });
                                        },
                                        child: Text(_isHotel
                                            ? 'Ajouter un véhicule.'
                                            : 'Ajouter un hébergement.')),
                                ],
                              ),
            ),                     
      ),
    );
                  
  }
}
