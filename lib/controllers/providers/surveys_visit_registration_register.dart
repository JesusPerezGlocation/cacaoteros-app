import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:surveys_app/controllers/exports/exports.dart';

/*
encuesta registro de visitas
provider para manejar el estado los inputs, select, etc.
*/
class SurveysVisitRegistrationProvider extends ChangeNotifier {
/*instancia*/
  final CollectionReference databaseReference =
      FirebaseFirestore.instance.collection(ApiPaths.cacaotesting);

//?primera pantalla #1*/
  final TextEditingController _nameUnit = TextEditingController();
  TextEditingController get nameUnit => _nameUnit;

  setNameUnit(String val) {
    _nameUnit.text = val; //nombre de la unidad
    notifyListeners();
  }

//?segunda pantalla #2*/
  final TextEditingController _selectedPersonType = TextEditingController();
  TextEditingController get selectedPersonType => _selectedPersonType;

  setSelectedPersonType(String val) {
    _selectedPersonType.text = val; //tipo de persona
    notifyListeners();
  }

  final TextEditingController _selectedDocumentType = TextEditingController();
  TextEditingController get selectedDocumentType => _selectedDocumentType;

  setSelectedDocumentType(String val) {
    _selectedDocumentType.text = val; //tipo de documento
    notifyListeners();
  }

  //!!si el usuario en tipo de documento selecciona otro se activa este textEdit
  final TextEditingController _selecDocumentTypeOther = TextEditingController();
  TextEditingController get selecDocumentTypeOther => _selecDocumentTypeOther;

  setSelectedDocumentTypeOther(String val) {
    //!!al enviar los datos si el usuario selecciona otro, envia el _selecDocumentTypeOther en vez de _selectedDocumentType
    _selecDocumentTypeOther.text = val; // otro documento
    notifyListeners();
  }

  final TextEditingController _documentNumber = TextEditingController();
  TextEditingController get documentNumber => _documentNumber;

  setDocumentNumber(String val) {
    _documentNumber.text = val; //número de documento
    notifyListeners();
  }

  final TextEditingController _fullName = TextEditingController();
  TextEditingController get fullName => _fullName;

  setFullName(String val) {
    _fullName.text = val; //nombre completo
    notifyListeners();
  }

  final TextEditingController _phoneNumber = TextEditingController();
  TextEditingController get phoneNumber => _phoneNumber;

  setPhoneNumber(String val) {
    _phoneNumber.text = val; //número de celular
    notifyListeners();
  }

  final TextEditingController _landlineNumber = TextEditingController();
  TextEditingController get landlineNumber => _landlineNumber;

  setLandlineNumber(String val) {
    _landlineNumber.text = val; //número de télefono
    notifyListeners();
  }

  final TextEditingController _emailAddress = TextEditingController();
  TextEditingController get emailAddress => _emailAddress;

  setEmailAddress(String val) {
    _emailAddress.text = val; //correo
    notifyListeners();
  }

  final TextEditingController _gender = TextEditingController();
  TextEditingController get gender => _gender;

  setGender(String val) {
    _gender.text = val; //genero
    notifyListeners();
  }

  final TextEditingController _birthMonth = TextEditingController();
  TextEditingController get birthMonth => _birthMonth;

  setBirthMonth(String val) {
    _birthMonth.text = val; //mes cumpleaños
    notifyListeners();
  }

  final TextEditingController _birthDay = TextEditingController();
  TextEditingController get birthDay => _birthDay;

  setBirthDay(String val) {
    _birthDay.text = val; //dia cumpleaños
    notifyListeners();
  }

  final TextEditingController _birthYear = TextEditingController();
  TextEditingController get birthYear => _birthYear;

  setBirthYear(String val) {
    _birthYear.text = val; //año cumpleaños
    notifyListeners();
  }

  final TextEditingController _civilStatus = TextEditingController();
  TextEditingController get civilStatus => _civilStatus;

  setCivilStatus(String val) {
    _civilStatus.text = val; //estado civil
    notifyListeners();
  }

  final TextEditingController _nationality = TextEditingController();
  TextEditingController get nationality => _nationality;

  setNationality(String val) {
    _nationality.text = val; //nacionalidad
    notifyListeners();
  }

  final TextEditingController _nationalityOther = TextEditingController();
  TextEditingController get nationalityOther => _nationalityOther;

  setNationalityOther(String val) {
    _nationalityOther.text = val; //otra nacionalidad
    notifyListeners();
  }

  final TextEditingController _educationalLevel = TextEditingController();
  TextEditingController get educationalLevel => _educationalLevel;

  setEducationalLevel(String val) {
    _educationalLevel.text = val; //nivel de educación
    notifyListeners();
  }

  final TextEditingController _yearsStudied = TextEditingController();
  TextEditingController get yearsStudied => _yearsStudied;

  setYearsStudied(String val) {
    _yearsStudied.text = val; //años estudiados
    notifyListeners();
  }

  final TextEditingController _obtainedTitle = TextEditingController();
  TextEditingController get obtainedTitle => _obtainedTitle;

  setObtainedTitle(String val) {
    _obtainedTitle.text = val; //titulo obtenido
    notifyListeners();
  }

//?tercera pantalla #3*/

//?pantalla
/*seleccion de municpio, departamento y vereda*/
  final TextEditingController _department = TextEditingController();
  final TextEditingController _municipality = TextEditingController();
  final TextEditingController _place = TextEditingController(); //vereda

  TextEditingController get department => _department;
  TextEditingController get municipality => _municipality;
  TextEditingController get place => _place;

//petición a firebase

  Future<void> sentSurveysToFirabase(BuildContext context) async {
    try {
      databaseReference.add(
        {
          'nameUnit': _nameUnit.text,
        },
      ).then((_) {
        /*si los datos se enviaron con exito*/

        //Navigator.of(context).pop(); // cierra el dialogo de carga

        SnackBarGlobalWidget.showSnackBar(context, '¡Datos enviados con éxito!',
            Icons.check_circle_rounded, PaletteColorsTheme.principalColor);

        notifyListeners();
      }).catchError((error) {
        //Navigator.of(context).pop(); // cierra el dialogo de carga

        /*si ocurre un error, muestra un mensaje de error */
        SnackBarGlobalWidget.showSnackBar(context, 'Error $error',
            Icons.error_outline_rounded, PaletteColorsTheme.redErrorColor);
      });
    } catch (e) {
      SnackBarGlobalWidget.showSnackBar(context, 'Error $e',
          Icons.error_outline_rounded, PaletteColorsTheme.redErrorColor);
    }
  }

/*setea los controladores*/
  setDepartement(String date) {
    _department.text = date;
    notifyListeners();
  }

  setMunicipality(String date) {
    _municipality.text = date;
    notifyListeners();
  }

  setPlace(String date) {
    _place.text = date;
    notifyListeners();
  }

/*limpia la selección de departamentos*/
  cleanDepartaments() {
    _department.clear();
    _municipality.clear();
    _place.clear();
    notifyListeners();
  }

/*limpia el municpio*/
  cleanMunicipality() {
    _municipality.clear();
    _place.clear();
    notifyListeners();
  }

/*limpia la vereda */
  cleanPlace() {
    _place.clear();
    notifyListeners();
  }

/*limpia todo el cuestionario */
  cleanAllCuestionary() {
    _nameUnit.clear();
    _department.clear();
    _municipality.clear();
    _place.clear();
    notifyListeners();
  }
}
