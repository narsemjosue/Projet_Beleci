import 'package:flutter/material.dart';

class Building_Screen extends StatelessWidget {
  const Building_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://cdn.website-editor.net/e8f5cd6e90bc4db8be5abdce2c648e09/dms3rep/multi/Page+en+cours+de+construction.PNG')),
              ))),
    );
  }
}
