import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:handihelp/services/app_colors.dart';
import 'package:provider/provider.dart';

class PhoneLogin extends StatefulWidget {
  const PhoneLogin({super.key});

  @override
  State<PhoneLogin> createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLogin> {
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
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Connectez vous avec votre numero de telephone"),
                SizedBox(height: 20,),
                Form(
                  key: _formkey,
                  child: TextFormField(
                    controller: _phoneController,
                    //autofocus: true,
                    decoration: new InputDecoration(
                      prefix: Text("+237 "),
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
                      hintText: 'Mobile Number',
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
                      if(value!.length < 9) return "Incorrect Number";
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
                    Navigator.of(context).pushNamed("/code_otp",arguments: _phoneController.text);
                  },
                  child: Text("Login",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
