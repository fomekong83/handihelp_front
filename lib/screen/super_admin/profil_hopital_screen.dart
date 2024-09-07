import 'package:flutter/material.dart';
import 'package:handihelp/services/app_colors.dart';

class ProfilHopitalScreen extends StatefulWidget {
  const ProfilHopitalScreen({super.key});

  @override
  State<ProfilHopitalScreen> createState() => _ProfilHopitalScreenState();
}

class _ProfilHopitalScreenState extends State<ProfilHopitalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOPITAL EFOULAN"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text("Apropos"),
              ),
              Card(
                color: AppColor.d_grey,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("contact: "),
                      Text("email: "),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text("Medecin"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
