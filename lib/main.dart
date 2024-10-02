import 'package:flutter/material.dart';
import 'package:handihelp/providers/super_admin_menu_provider.dart';
import 'package:handihelp/screen/affiche_hopital.dart';
import 'package:handihelp/screen/dashboards/dashboard_super_admin.dart';
import 'package:handihelp/screen/login/otp_screen.dart';
import 'package:handihelp/screen/login/phone_login.dart';
import 'package:handihelp/screen/social_page.dart';
import 'package:handihelp/screen/super_admin/ajouter_directeur.dart';
import 'package:handihelp/screen/super_admin/ajouter_exercice.dart';
import 'package:handihelp/screen/super_admin/ajouter_hopital.dart';
import 'package:handihelp/screen/super_admin/liste_directeur_screen.dart';
import 'package:handihelp/screen/super_admin/liste_examens_screen.dart';
import 'package:handihelp/screen/super_admin/liste_exercice_screen.dart';
import 'package:handihelp/screen/super_admin/liste_handicapes_screen.dart';
import 'package:handihelp/screen/super_admin/liste_hopitaux_screen.dart';
import 'package:handihelp/screen/super_admin/liste_specialiter_screen.dart';
import 'package:handihelp/screen/super_admin/profil_hopital_screen.dart';
import 'package:handihelp/services/sharedPreferences.dart';
import 'package:provider/provider.dart';

import 'model_Services/hopital_view_model.dart';
import 'screen/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>AppSharedPreferences()),
        ChangeNotifierProvider(create: (context)=>SuperAdminMenuProvider()),


        ChangeNotifierProvider(create: (context)=>HopitalViewModel()),
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => MyHomePage(title: "HandiHelp"),
          '/social': (context) => SocialPage(),
          '/telephone_login': (context) => PhoneLogin(),
          '/code_otp': (context) => OtpScreen(),
          '/super_admin': (context) => DashboardSuperAdmin(),
          '/affiche_hopital': (context) => AfficheHopital(),

          //SUPER ADMIN ROUTES
          '/liste_hopitaux': (context)=> ListeHopitauxScreen(),
          '/liste_directeur': (context)=> ListeDirecteurScreen(),
          '/liste_Specialiter': (context)=> ListeSpecialitesScreen(),
          '/liste_examens': (context)=> ListeExamensScreen(),
          '/liste_handicapes': (context)=> ListeHandicapesScreen(),
          '/liste_exercices': (context)=> ListeExercicesScreen(),
          '/voir_hopital': (context)=> ProfilHopitalScreen(),
          '/ajouter_hopital': (context)=> AjouterHopital(),
          '/ajouter_directeur': (context)=> AjouterDirecteur(),
          '/ajouter_exercice': (context)=> AjouterExercice(),
        },
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: WelcomePage()
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
