import 'package:flutter/material.dart';
import 'package:reservia/utils/app_style.dart';

class Building_Screen extends StatelessWidget {
  const Building_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
                    backgroundColor: Styles.bgColor,
                    body: Center(
                      child: Text('Page en construction', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),),
                    ),
                  );
  }
}