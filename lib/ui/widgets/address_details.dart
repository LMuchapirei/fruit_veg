import 'package:dashcast/core/models/user_model.dart';
import 'package:dashcast/ui/viewutils/textutils.dart';
import 'package:flutter/material.dart';

class EditAddressDialog extends StatefulWidget {
  @override
  _EditAddressDialogState createState() => _EditAddressDialogState();
}

class _EditAddressDialogState extends State<EditAddressDialog> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _postalCodeController = TextEditingController();
  TextEditingController _countryController = TextEditingController();
  TextEditingController _regionController = TextEditingController();
  TextEditingController _companyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*.5,
      width: MediaQuery.of(context).size.width*0.6,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.person_outline,
                      color: iconColor,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Profile Settings',
                      style: headerTextStyle,
                    )
                  ],
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Address'),
                  controller: _addressController,
                  validator: (value) {
                    if (value.isEmpty) return 'Please enter address';
                    return '';
                  },
                  onSaved: (newValue) {},
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Company"),
                  controller: _companyController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Please enter Company";
                    }
                    return '';
                  },
                  onSaved: (newValue) {},
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "City"),
                  controller: _cityController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Please enter City";
                    }
                    return '';
                  },
                  onSaved: (newValue) {},
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Postal Code"),
                  controller: _postalCodeController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Please enter Postal Code";
                    }
                    return '';
                  },
                  onSaved: (newValue) {},
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Country"),
                  controller: _countryController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Please enter country field";
                    }
                    return '';
                  },
                  onSaved: (newValue) {},
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Region"),
                  controller: _regionController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Please enter region field";
                    }
                    return '';
                  },
                  onSaved: (newValue) {},
                ),
                ButtonBar(
                  children: <Widget>[
                    FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Cancel")),
                    FlatButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            Navigator.pop(
                                context,
                                AddressDetails(
                                  address1: _addressController.text,
                                  address2: _addressController.text,
                                  city: _cityController.text,
                                  company: _companyController.text,
                                  country: _countryController.text,
                                  postCode: _postalCodeController.text,
                                  region: _regionController.text,
                                ));
                            _addressController.text = '';
                            _addressController.text = '';
                            _cityController.text = '';
                            _companyController.text = '';
                            _countryController.text = '';
                            _postalCodeController.text = '';
                            _regionController.text = '';
                          }
                        },
                        child: Text("Save"))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
