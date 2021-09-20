
enum Gender{
  Male,
  Female
}

class User{
    String fullName;
    String emailAdress;
    Gender  gender;
    String birthDate;

  User({this.fullName, this.emailAdress, this.gender, this.birthDate});

  String get genderGetter=>gender==Gender.Female?'Female':'Male';
  set nameSetter(value)=>fullName=value;
  set emailSetter(value)=>emailAdress=value;
  set genderSetter(value)=>gender=value;
  set birthSetter(value)=>birthDate=value;

}