import 'package:flutter/material.dart';
import 'package:handihelp/model_Services/hopital_view_model.dart';
import 'package:handihelp/services/constants.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';

class AjouterHopital extends StatefulWidget {
  @override
  _AjouterHopitalState createState() => _AjouterHopitalState();
}

class _AjouterHopitalState extends State<AjouterHopital> {
  final _formKey = GlobalKey<FormState>();
  final _hospitalData = <String, dynamic>{};

  PhoneNumber number = PhoneNumber(isoCode: 'CM');

  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _zipCodeController = TextEditingController();
  final _countryController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _websiteController = TextEditingController();
  final _numBedsController = TextEditingController();
  final _specialtiesController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _zipCodeController.dispose();
    _countryController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _websiteController.dispose();
    _numBedsController.dispose();
    _specialtiesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: Text('Ajouter Hospital'),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Nom',
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.indigo, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.indigo, width: 1.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Entrez un nom svp';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _hospitalData['nom'] = value;
                        },
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Ville',
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.indigo, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.indigo, width: 1.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red, width: 1.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red, width: 1.0),
                          ),
                        ),
                        onSaved: (value) {
                          _hospitalData['ville'] = value;
                        },
                      ),
                      Container(
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
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red, width: 1.0),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red, width: 1.0),
                            ),
                            hintText: "Telephone",
                          ),
                          onSaved: (value) {
                            _hospitalData['telephone'] = value.phoneNumber;
                          },
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Email',
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.indigo, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.indigo, width: 1.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red, width: 1.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red, width: 1.0),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (value) {
                          _hospitalData['email'] = value;
                        },
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'description',
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.indigo, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.indigo, width: 1.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red, width: 1.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red, width: 1.0),
                          ),
                        ),
                        keyboardType: TextInputType.url,
                        maxLines: 5,
                        onSaved: (value) {
                          _hospitalData['description'] = value;
                        },
                      ),
                      SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: ()async {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            // Save the hospital data
                            // You can access the form data using _hospitalData
                            print(_hospitalData);
                            await context.read<HopitalViewModel>().registerHopital(context, _hospitalData);
                          }
                        },
                        child: Text('Enregistrer'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Consumer<HopitalViewModel>(builder: (context,hopitalViewModel,child){
          return Visibility(
            visible: hopitalViewModel.isregistring,
            child: CircularProgressIndicator.adaptive(),
          );
        })
      ],
    );
  }
}
