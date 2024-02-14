import 'package:flutter/material.dart';
import 'package:reservia/utils/app_style.dart';

class AppDoubleTextWidget extends StatelessWidget {
  final String bigText;
  final String smalText;
  const AppDoubleTextWidget({super.key, required this.bigText, required this.smalText});

  @override
  Widget build(BuildContext context) {
    return  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(bigText, style: Styles.headLineStyle2,),
                    InkWell(
                      onTap: (){
                        print('You are tapped');
                      },
                      child: Text(smalText, style: Styles.textStyle.copyWith(color: Styles.primaryColor),))
                  ],
                );
  }
}