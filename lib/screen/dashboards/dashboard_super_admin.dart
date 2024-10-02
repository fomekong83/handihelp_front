import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:handihelp/dialog_recherche/recherche_hopital.dart';
import 'package:handihelp/providers/super_admin_menu_provider.dart';
import 'package:handihelp/screen/profile_utilisateur.dart';
import 'package:handihelp/services/app_colors.dart';
import 'package:handihelp/services/sharedPreferences.dart';
import 'package:provider/provider.dart';

import '../lecteur_video360_screen.dart';
import '../super_admin/ajouter_directeur.dart';

class DashboardSuperAdmin extends StatefulWidget {
  const DashboardSuperAdmin({super.key});

  @override
  State<DashboardSuperAdmin> createState() => _DashboardSuperAdminState();
}

class _DashboardSuperAdminState extends State<DashboardSuperAdmin> {

  Widget _buildButton(IconData icon, String label) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context){
                return AlertDialog(
                  content: RechercheHopital(teachers: []),
                );
              }
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          padding: EdgeInsets.symmetric(vertical: 1.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.orange),
            SizedBox(height: 4.0),
            Text(
              label,
              style: GoogleFonts.poppins(
                color: Colors.grey[600],
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageSection() {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Image.asset("assets/images/avatar.png"),
                      Text("Profil Patient")
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Image.asset("assets/images/avatar.png"),
                      Text("visualisation")
                    ],
                  ),
                ),
              ),

            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Image.asset("assets/images/avatar.png"),
                      Text("Profil Patient")
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Image.asset("assets/images/avatar.png"),
                      Text("visualisation")
                    ],
                  ),
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }


  Widget hopitaux()=>Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'NOM PATIENT: ELYSA',
          style: GoogleFonts.poppins(
            color: Colors.grey[600],
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 8.0),
        Row(
          children: [
            SizedBox(width: 8.0),
            Text(
              '18-08-2024',
              style: GoogleFonts.poppins(
                color: Colors.grey[600],
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        SizedBox(height: 02.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildButton(FontAwesomeIcons.search, 'Search'),
          ],
        ),
        Text(
          'Search',
          style: GoogleFonts.poppins(
            color: Colors.grey[100],
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 8.0),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 1,
            itemBuilder: (context,child){
              return InkWell(
                onTap: (){
                  Navigator.of(context).pushNamed("/affiche_hopital");
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Image.asset("assets/images/avatar.png"),
                        Text("visualisation")
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ),
  );

  Widget home()=>Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("Medical",textAlign: TextAlign.left,),
      Divider(),
      Wrap(
        alignment: WrapAlignment.start,
        runSpacing: 8.0,
        spacing: 8.0,
        children: [
          InkWell(
            onTap: (){
              Navigator.of(context).pushNamed("/liste_hopitaux");
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20.0),
              ),
              width: 100,
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(FontAwesomeIcons.a, color: Colors.orange),
                  SizedBox(height: 4.0),
                  Text(
                    "Hopitaux",
                    style: GoogleFonts.poppins(
                      color: Colors.grey[600],
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.of(context).pushNamed("/liste_directeur");
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20.0),
              ),
              width: 100,
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(FontAwesomeIcons.a, color: Colors.orange),
                  SizedBox(height: 4.0),
                  Text(
                    "Directeur",
                    style: GoogleFonts.poppins(
                      color: Colors.grey[600],
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.of(context).pushNamed("/liste_Specialiter");
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20.0),
              ),
              width: 100,
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(FontAwesomeIcons.a, color: Colors.orange),
                  SizedBox(height: 4.0),
                  Text(
                    "specialites",
                    style: GoogleFonts.poppins(
                      color: Colors.grey[600],
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.of(context).pushNamed("/liste_examens");
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20.0),
              ),
              width: 100,
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(FontAwesomeIcons.a, color: Colors.orange),
                  SizedBox(height: 4.0),
                  Text(
                    "Examens",
                    style: GoogleFonts.poppins(
                      color: Colors.grey[600],
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.of(context).pushNamed("/liste_handicapes");
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20.0),
              ),
              width: 100,
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(FontAwesomeIcons.a, color: Colors.orange),
                  SizedBox(height: 4.0),
                  Text(
                    "Handicapes",
                    style: GoogleFonts.poppins(
                      color: Colors.grey[600],
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      SizedBox(height: 20,),
      Text("Activites"),
      Divider(),
      Wrap(
        children: [
          Container(
            width: 100,
            height: 100,
            child: InkWell(
              onTap: (){
                Navigator.of(context).pushNamed("/liste_exercices");
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20.0),
                ),
                width: 50,
                height: 50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(FontAwesomeIcons.a, color: Colors.orange),
                    SizedBox(height: 4.0),
                    Text(
                      "Exercices",
                      style: GoogleFonts.poppins(
                        color: Colors.grey[600],
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      /*Container(
        height: 180,
        width: 200,
        //child: Video360Player(videoUrl: 'https://cdn.bitmovin.com/content/assets/playhouse-vr/m3u8s/105560.m3u8',),
        child: Video360Player(videoUrl: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',),
      )*/

    ],
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Consumer<SuperAdminMenuProvider>(
      builder: (context,superAdminMenuProvider,child){
        return Scaffold(
          //backgroundColor: Colors.white,
          bottomNavigationBar: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: superAdminMenuProvider.menu == -1 ? AppColor.d_red : Colors.grey,
                      foregroundColor: Colors.white,
                      //shadowColor: Colors.greenAccent,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)
                      ),
                      //minimumSize: Size(100, 40), //////// HERE
                    ),
                    onPressed: () {
                      superAdminMenuProvider.changerMenu(-1);
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.house),
                        Text("Acceuil"),
                      ],
                    )
                ),

                TextButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: superAdminMenuProvider.menu == 1 ? AppColor.d_red : Colors.grey,
                      foregroundColor: Colors.white,
                      //shadowColor: Colors.greenAccent,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)
                      ),
                      //minimumSize: Size(100, 40), //////// HERE
                    ),
                    onPressed: () {
                      superAdminMenuProvider.changerMenu(1);
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.add),
                        Text("Directeur"),
                      ],
                    )
                ),
                TextButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: superAdminMenuProvider.menu == 2 ? AppColor.d_red : Colors.grey,
                      foregroundColor: Colors.white,
                      //shadowColor: Colors.greenAccent,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)
                      ),
                      //minimumSize: Size(100, 40), //////// HERE
                    ),
                    onPressed: () {
                      superAdminMenuProvider.changerMenu(2);
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.person),
                        Text("Profile"),
                      ],
                    )
                ),
              ],
            ),
          ),
          appBar: AppBar(
            title: const Text('SUPER ADMIN'),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
            leading: SizedBox.shrink()
          ),
          body: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if(superAdminMenuProvider.menu == -1) Expanded(child: home()),

                if(superAdminMenuProvider.menu == 0) hopitaux(),

                if(superAdminMenuProvider.menu == 1) Expanded(child: AjouterDirecteur()),

                if(superAdminMenuProvider.menu == 2) Expanded(child: ProfileUtilisateur(user: context.read<AppSharedPreferences>().user!,showHeader: false,))
              ],
            ),
          ),
        );
      },
    );
  }
}



