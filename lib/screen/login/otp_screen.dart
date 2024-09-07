import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../services/app_colors.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {

  final _formkey = GlobalKey<FormState>();
  late TextEditingController _phoneController;
  late FocusNode _phoneFocusNode;
  @override
  void initState() {
    _phoneController = new TextEditingController();
    _phoneFocusNode = new FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _phoneFocusNode.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final numero = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Wrap(
                  children: [
                    Center(
                      child: RichText(
                        //textAlign: TextAlign.center,
                        text: TextSpan(
                          text: "Un code de verification a ete envoyer au ",
                            style: TextStyle(fontWeight: FontWeight.normal,color: Colors.black),

                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${numero}",style: TextStyle(fontWeight: FontWeight.w900,color: Colors.black)),
                        TextButton(onPressed: ()=>Navigator.pop(context), child: Text("Changer",style: TextStyle(color: Colors.blue),)),
                      ],
                    )
                  ],
                ),
                Form(
                  key: _formkey,
                  child: TextFormField(
                    controller: _phoneController,
                    //autofocus: true,
                    decoration: new InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.greenAccent, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.indigo, width: 2.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 3.0),
                      ),
                      hintText: 'Entre le code',
                    ),
                    keyboardType: const TextInputType.numberWithOptions(),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    onTapOutside: (val){
                      _phoneFocusNode.unfocus();
                    },
                    maxLines: 1,
                    validator: (value){
                      if(value!.length < 6) return "Incorrect Code";
                    },
                    autocorrect: true,
                    // Only numbers can be entered
                  ),
                ),
                SizedBox(height: 20,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.d_red,
                    foregroundColor: Colors.white,
                    //shadowColor: Colors.greenAccent,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)
                    ),
                    //minimumSize: Size(100, 40), //////// HERE
                  ),
                  onPressed: ()async{
                    FocusManager.instance.primaryFocus?.unfocus(); //THIS DISMIS KEYBOARD
                    var data = {
                      "phone": _phoneController.text,
                    };

                    if(_formkey.currentState!.validate()){
                      /*await context.read<UserViewModel>().login(context, data).then((value){
                      if(value == true){
                        Navigator.of(context).popUntil((route)=> route.isFirst);
                        Navigator.of(context).pushReplacementNamed("/personel_schools");
                      }
                    });*/

                      Navigator.of(context).pushNamed("/super_admin");
                    }

                  },
                  child: Text("Confirmer",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
