import 'package:flutter/material.dart';
import 'package:fruit_veg/core/models/UserModel.dart';
import 'package:fruit_veg/ui/viewutils/textutils.dart';

class EditProfileDialog extends StatefulWidget {
  @override
  _EditProfileDialogState createState() => _EditProfileDialogState();
}

class _EditProfileDialogState extends State<EditProfileDialog> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _bithDateController = TextEditingController();
  Gender gender = Gender.Female;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 250,
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
                  decoration: InputDecoration(labelText: "Full Name"),
                  controller: _fullNameController,
                  validator: (value) {
                    if (value!.isEmpty) return 'Please enter name';
                    return '';
                  },
                  onSaved: (newValue) {},
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Email address"),
                  controller: _emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter email";
                    }
                    return '';
                  },
                  onSaved: (newValue) {},
                ),
                TextFormField(
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(labelText: "BirthDate"),
                  controller: _bithDateController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter birthdate";
                    }
                    return '';
                  },
                  onSaved: (newValue) {},
                ),
                DropdownButtonFormField<Gender>(
                  value: gender,
                  items: [
                    DropdownMenuItem<Gender>(
                        child: Text('Male'), value: Gender.Male),
                    DropdownMenuItem<Gender>(
                        child: Text('Female'), value: Gender.Female),
                  ],
                  onChanged: (value) {
                    gender = value!;
                  },
                  onSaved: (newValue) {
                    setState(() {
                      gender = newValue!;
                    });
                  },
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
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            Navigator.pop(
                                context,
                                User(
                                    birthDate: _bithDateController.text,
                                    fullName: _fullNameController.text,
                                    emailAdress: _emailController.text,
                                    gender: gender));
                            _bithDateController.text = "";
                            _emailController.text = "";
                            _fullNameController.text = "";
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
