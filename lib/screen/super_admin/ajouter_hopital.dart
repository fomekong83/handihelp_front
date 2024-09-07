import 'package:flutter/material.dart';

class AjouterHopital extends StatefulWidget {
  @override
  _AjouterHopitalState createState() => _AjouterHopitalState();
}

class _AjouterHopitalState extends State<AjouterHopital> {
  final _formKey = GlobalKey<FormState>();
  final _hospitalData = <String, dynamic>{};

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
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter Hospital'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _hospitalData['name'] = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Address'),
                onSaved: (value) {
                  _hospitalData['address'] = value;
                },
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'City'),
                      onSaved: (value) {
                        _hospitalData['city'] = value;
                      },
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'State'),
                      onSaved: (value) {
                        _hospitalData['state'] = value;
                      },
                    ),
                  ),
                ],
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Zip Code'),
                onSaved: (value) {
                  _hospitalData['zipCode'] = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Country'),
                onSaved: (value) {
                  _hospitalData['country'] = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Phone'),
                onSaved: (value) {
                  _hospitalData['phone'] = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) {
                  _hospitalData['email'] = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Website'),
                keyboardType: TextInputType.url,
                onSaved: (value) {
                  _hospitalData['website'] = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Number of Beds'),
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  _hospitalData['numBeds'] = int.tryParse(value ?? '');
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Specialties'),
                maxLines: null,
                onSaved: (value) {
                  _hospitalData['specialties'] = value;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Save the hospital data
                    // You can access the form data using _hospitalData
                    print(_hospitalData);
                  }
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
