import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:handihelp/services/app_colors.dart';
import 'package:handihelp/services/constants.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';

class PhoneLogin extends StatefulWidget {
  const PhoneLogin({super.key});

  @override
  State<PhoneLogin> createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLogin> {
  final _formkey = GlobalKey<FormState>();
  late TextEditingController _phoneController,_passwordController;
  late FocusNode _phoneFocusNode;
  PhoneNumber number = PhoneNumber(isoCode: 'CM');

  @override
  void initState() {
    _phoneController = new TextEditingController();
    _passwordController = new TextEditingController();
    _phoneFocusNode = new FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _phoneFocusNode.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                  child: Container(
                    height: 80,
                    child: InternationalPhoneNumberInput(
                      onInputChanged: (PhoneNumber numb) {
                        number = numb;
                        print(number.phoneNumber);
                      },
                      onInputValidated: (bool value) {
                        print(value);
                      },
                      validator: (val){

                      },
                      selectorConfig: SelectorConfig(
                        selectorType: size.width >= desktopBreakPoint ? PhoneInputSelectorType.BOTTOM_SHEET : PhoneInputSelectorType.DIALOG,
                        setSelectorButtonAsPrefixIcon: false,
                        useBottomSheetSafeArea: false,
                      ),
                      ignoreBlank: true,
                      autoValidateMode: AutovalidateMode.always,
                      selectorTextStyle: TextStyle(color: Colors.black),
                      initialValue: number,
                      textFieldController: _phoneController,
                      formatInput: false,
                      keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
                      inputBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.indigo, width: 2.0),
                      ),
                      inputDecoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo, width: 1.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 1.0),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 1.0),
                        ),
                        hintText: "phone",
                      ),
                      /*onSaved: (PhoneNumber number) {
                          print('On Saved: $number');
                        },*/
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                TextFormField(
                  controller: _passwordController,
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
                    hintText: 'mot de pass',
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
                    //Navigator.of(context).pushNamed("/code_otp",arguments: number.phoneNumber);
                    Navigator.of(context).pushNamed("/super_admin");
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
