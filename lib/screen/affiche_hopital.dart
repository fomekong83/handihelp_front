import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class AfficheHopital extends StatefulWidget {
  const AfficheHopital({super.key});

  @override
  State<AfficheHopital> createState() => _AfficheHopitalState();
}

class _AfficheHopitalState extends State<AfficheHopital> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            CircularPercentIndicator(radius: 20,percent: 0.5,),
          ],
        ),
      ),
    );
  }
}
