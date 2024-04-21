/*
modelo para los miembros de la familia
*/
class FamilyMember {
  String id;
  String name;
  String relationship;
  String gender;
  String birthdayMonth;
  String birthdayDay;
  String birthdayYear;
  String educationLevel;
  String school;
  String documentNumber;

  FamilyMember({
    required this.id,
    required this.name,
    required this.relationship,
    required this.gender,
    required this.birthdayMonth,
    required this.birthdayDay,
    required this.birthdayYear,
    required this.educationLevel,
    required this.school,
    required this.documentNumber,
  });
}
