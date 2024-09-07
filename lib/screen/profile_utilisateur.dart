import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
import '../services/sharedPreferences.dart';

class ProfileUtilisateur extends StatefulWidget {

  final User user;
  bool? showHeader;
  ProfileUtilisateur({super.key,required this.user, this.showHeader = true});

  @override
  State<ProfileUtilisateur> createState() => _ProfileUtilisateurState();
}

class _ProfileUtilisateurState extends State<ProfileUtilisateur> {
  final _formkey = GlobalKey<FormState>();
  late FocusNode _passFocusNode;
  late TextEditingController _passwordController;
  bool changePass = false;

  @override
  void initState() {
    // TODO: implement initState
    _passFocusNode = new FocusNode();
    _passwordController = new TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _passFocusNode.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final user = ModalRoute.of(context)!.settings.arguments as User;
    return Scaffold(
        body: SafeArea(
          child: Stack(
              children: [
                Visibility(
                  visible: widget.showHeader!,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        BackButton(color: Colors.white,style: ButtonStyle(foregroundColor: WidgetStateProperty.all<Color>(Colors.white)),),
                        Text("Details Utilisateur",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                ),

                // User profile content
                Padding(
                    padding: EdgeInsets.all(0.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10.0),
                          Center(
                            child: CircleAvatar(
                              radius: 80.0,
                              backgroundImage: NetworkImage(
                                'https://via.placeholder.com/150',
                              ),
                            ),
                          ),
                          SizedBox(height: 16.0),
                          Center(
                            child: Text(
                              'nom',
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          SizedBox(height: 24.0),
                          Expanded(
                              child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: 20.0,
                                        offset: Offset(0, 10),
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                      padding: EdgeInsets.all(24.0),
                                      child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'About',
                                              style: TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 8.0),
                                            Text(
                                              'Email: ',
                                              style: TextStyle(
                                                fontSize: 16.0,
                                              ),
                                            ),
                                            Text(
                                              'Telephone: ',
                                              style: TextStyle(
                                                fontSize: 16.0,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  'Point: ',
                                                  style: TextStyle(
                                                      fontSize: 16.0,
                                                      fontWeight: FontWeight.bold
                                                  ),
                                                ),

                                                SizedBox(height: 30,),
                                              ],
                                            ),

                                            Visibility(
                                              visible: context.read<AppSharedPreferences>().user!.id_user.compareTo(widget.user.id_user!) == 0,
                                              child: TextButton(
                                                  onPressed: (){
                                                    /*setState(() {
                                                  changePass = !changePass;
                                                });*/
                                                    Navigator.of(context).pushNamed("/changepass");
                                                  },
                                                  child: Text("changer mot de opasse",style: TextStyle(color: Colors.blue),)
                                              ),
                                            )
                                          ]
                                      )
                                  )
                              )
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                  style: ButtonStyle(
                                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10),
                                              side: BorderSide(color: Colors.lightGreen)
                                          )
                                      ),
                                      elevation: WidgetStateProperty.all<double>(10),
                                      backgroundColor: WidgetStateProperty.all<Color>(Colors.lightGreen),
                                      foregroundColor: WidgetStateProperty.all<Color>(Colors.white)
                                  ),
                                  onPressed: ()async {
                                    /*var data = {
                                      "phone": context.read<AppSharedPreferences>().user!.phone,
                                      "token": context.read<AppSharedPreferences>().token,
                                    };
                                    await context.read<UserViewModel>().logout(context, data).then((val){
                                      if(val){
                                        Navigator.of(context).popUntil(ModalRoute.withName('/'));
                                        Navigator.of(context).pushNamed("/");
                                        context.read<AppSharedPreferences>().disposed(context);
                                      }
                                    });*/
                                  },
                                  child: Text("Deconnexion")
                              ),
                            ],
                          ),
                        ]
                    )
                )
              ]
          ),
        )
    );
  }
}






