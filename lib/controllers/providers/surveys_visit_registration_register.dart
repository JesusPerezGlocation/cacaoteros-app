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

//*primera pantalla #1*/
  final TextEditingController _nameUnit = TextEditingController();
  TextEditingController get nameUnit => _nameUnit;

  String _iDSurveys = '';
  String get iDSurveys => _iDSurveys;

  setNameUnit(String val) {
    _nameUnit.text = val; //nombre de la unidad
    notifyListeners();
  }

  setIDSurveys(String id) {
    _iDSurveys = id;
    notifyListeners();
  }

//*segunda pantalla #2*/

  final TextEditingController _selectedDocumentType = TextEditingController();
  TextEditingController get selectedDocumentType => _selectedDocumentType;

  setSelectedDocumentType(String val) {
    _selectedDocumentType.text = val; //tipo de documento
    notifyListeners();
  }

  final TextEditingController _selecDocumentTypeOther = TextEditingController();
  TextEditingController get selecDocumentTypeOther => _selecDocumentTypeOther;

  setSelectedDocumentTypeOther(String val) {
    _selecDocumentTypeOther.text = val; // otro documento
    notifyListeners();
  }

  final TextEditingController _documentNumber = TextEditingController();
  TextEditingController get documentNumber => _documentNumber;

  setDocumentNumber(String val) {
    _documentNumber.text = val; //número de documento
    notifyListeners();
  }

  final TextEditingController _expeditionMonth = TextEditingController();
  TextEditingController get expeditionMonth => _expeditionMonth;

  setExpeditionMonth(String val) {
    _expeditionMonth.text = val; //mes de expedición del documento
    notifyListeners();
  }

  final TextEditingController _expeditionDay = TextEditingController();
  TextEditingController get expeditionDay => _expeditionDay;

  setExpeditionDay(String val) {
    _expeditionDay.text = val; // dia de expedición
    notifyListeners();
  }

  final TextEditingController _expeditionYear = TextEditingController();
  TextEditingController get expeditionYear => _expeditionYear;

  setExpeditionYear(String val) {
    _expeditionYear.text = val; //año de expedición
    notifyListeners();
  }

  final TextEditingController _placeExpedition = TextEditingController();
  TextEditingController get placeExpedition => _placeExpedition;

  setPlaceExpedition(String val) {
    _placeExpedition.text = val; // lugar de expedición
    notifyListeners();
  }

  final TextEditingController _firtName = TextEditingController();
  TextEditingController get firtName => _firtName;

  setFirtName(String val) {
    _firtName.text = val; // primer nombre del usuario
    notifyListeners();
  }

  final TextEditingController _secondName = TextEditingController();
  TextEditingController get secondName => _secondName;

  setSecondName(String val) {
    _secondName.text = val; // segundo nombre del usuario
    notifyListeners();
  }

  final TextEditingController _firtLastName = TextEditingController();
  TextEditingController get firtLastName => _firtLastName;

  setFirtLastName(String val) {
    _firtLastName.text = val; // primero apellido del usuario
    notifyListeners();
  }

  final TextEditingController _secondLastName = TextEditingController();
  TextEditingController get secondLastName => _secondLastName;

  setSecondLastName(String val) {
    _secondLastName.text = val; // segundo apellido del usuario
    notifyListeners();
  }

  final TextEditingController _ageUser = TextEditingController();
  TextEditingController get ageUser => _ageUser;

  setAgeUser(String val) {
    _ageUser.text = val; // edad del usuario
    notifyListeners();
  }

  final TextEditingController _phoneNumber = TextEditingController();
  TextEditingController get phoneNumber => _phoneNumber;

  setPhoneNumber(String val) {
    _phoneNumber.text = val; //número de celular
    notifyListeners();
  }

  final TextEditingController _hasWhatsApp = TextEditingController();
  TextEditingController get hasWhatsApp => _hasWhatsApp;

  setHasWhatsApp(String val) {
    _hasWhatsApp.text = val; // tiene whatsapp?
    notifyListeners();
  }

  final TextEditingController _hasEmailAddressOther = TextEditingController();
  TextEditingController get hasEmailAddressOther => _hasEmailAddressOther;

  setHasEmailAddressOther(String val) {
    _hasEmailAddressOther.text = val; //pregunta si correo
    notifyListeners();
  }

  final TextEditingController _emailAddress = TextEditingController();
  TextEditingController get emailAddress => _emailAddress;

  setEmailAddress(String val) {
    _emailAddress.text = val; //correo
    notifyListeners();
  }

  final TextEditingController _servicesEthernet = TextEditingController();
  TextEditingController get servicesEthernet => _servicesEthernet;

  setServicesEthernet(String val) {
    _servicesEthernet.text = val; // cuenta con servicios a internet?
    notifyListeners();
  }

  final TextEditingController _typeServicesEthernet = TextEditingController();
  TextEditingController get typeServicesEthernet => _typeServicesEthernet;

  setTypeServicesEthernet(String val) {
    _typeServicesEthernet.text = val; // tipo de servicio internet
    notifyListeners();
  }

  final TextEditingController _whatServicesEthernet = TextEditingController();
  TextEditingController get whatServicesEthernet => _whatServicesEthernet;

  setWhatServicesEthernet(String val) {
    _whatServicesEthernet.text = val; // cual servicio a intenert
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

  final TextEditingController _placeBorn = TextEditingController();
  TextEditingController get placeBorn => _placeBorn;

  setPlaceBorn(String val) {
    _placeBorn.text = val; //lugar de nacimiento
    notifyListeners();
  }

  final TextEditingController _whatconsultEthernet = TextEditingController();
  TextEditingController get whatconsultEthernet => _whatconsultEthernet;

  setWhatconsultEthernet(String val) {
    _whatconsultEthernet.text = val; //que temas consulta atrvez de internet
    notifyListeners();
  }

  final TextEditingController _whatconsultEthernetOther =
      TextEditingController();
  TextEditingController get whatconsultEthernetOther =>
      _whatconsultEthernetOther;

  setWhatconsultEthernetOther(String val) {
    _whatconsultEthernetOther.text =
        val; //que temas otro consulta atrvez de internet
    notifyListeners();
  }

  final TextEditingController _hasDisability = TextEditingController();
  TextEditingController get hasDisability => _hasDisability;

  setHasDisability(String val) {
    _hasDisability.text = val; //  presenta discapcidad
    notifyListeners();
  }

  final TextEditingController _hasDisabilityOther = TextEditingController();
  TextEditingController get hasDisabilityOther => _hasDisabilityOther;

  setHasDisabilityOther(String val) {
    _hasDisabilityOther.text = val; //  presenta discapcidad
    notifyListeners();
  }

//*tercera pantalla #3*/
  final TextEditingController _possesionLandType = TextEditingController();
  TextEditingController get possesionLandType => _possesionLandType;

  setPosessionLandTypee(String val) {
    _possesionLandType.text = val; // tenienca de la tierra
    notifyListeners();
  }

  final TextEditingController _originPossesionLand = TextEditingController();
  TextEditingController get originPossesionLand => _originPossesionLand;

  setOriginPosessionLand(String val) {
    _originPossesionLand.text = val; // origen de la tenencia de la tierra
    notifyListeners();
  }

  final TextEditingController _possesionOverCultivation =
      TextEditingController();
  TextEditingController get possesionOverCultivation =>
      _possesionOverCultivation;

  setPossesionOverCultivation(String val) {
    _possesionOverCultivation.text = val; // posesión sobre cultivo
    notifyListeners();
  }

  final TextEditingController _producesOrganization = TextEditingController();
  TextEditingController get producesOrganization => _producesOrganization;

  setProducesOrganization(String val) {
    _producesOrganization.text = val; // afilización a productores
    notifyListeners();
  }

  final TextEditingController _nameOrganization = TextEditingController();
  TextEditingController get nameOrganization => _nameOrganization;

  setNameOrganization(String val) {
    _nameOrganization.text =
        val; // nombre de alguna organización a la que pertenece
    notifyListeners();
  }

  final TextEditingController _mainEconomicActivity = TextEditingController();
  TextEditingController get mainEconomicActivity => _mainEconomicActivity;

  setMainEconomicActivity(String val) {
    _mainEconomicActivity.text = val; // principal actividad economica
    notifyListeners();
  }

  final TextEditingController _mainEconomicActivityOther =
      TextEditingController();
  TextEditingController get mainEconomicActivityOther =>
      _mainEconomicActivityOther;

  setMainEconomicActivityOther(String val) {
    _mainEconomicActivityOther.text = val; //
    notifyListeners();
  }

  final TextEditingController _numberMonthWorkFarm = TextEditingController();
  TextEditingController get numberMonthWorkFarm => _numberMonthWorkFarm;

  setNumberMonthWorkFarm(String val) {
    _numberMonthWorkFarm.text =
        val; // número de dias al mes que trabaja en el cultivo d cacao
    notifyListeners();
  }

  final TextEditingController _numberWithoutFarm = TextEditingController();
  TextEditingController get numberWithoutFarm => _numberWithoutFarm;

  setNumberWithoutFarm(String val) {
    _numberWithoutFarm.text =
        val; // número de dias al mes que trabaja fuera de la finca
    notifyListeners();
  }

//?cuarta pantalla #4*/
/*seleccion de municpio, departamento y vereda*/
  final TextEditingController _department = TextEditingController();
  final TextEditingController _municipality = TextEditingController();
  final TextEditingController _place = TextEditingController(); //vereda

  TextEditingController get department => _department;
  TextEditingController get municipality => _municipality;
  TextEditingController get place => _place;

//?quinta pantalla #5*/

  double? _latitude;
  double? _longitude;

  double? get latitude => _latitude;
  double? get longitude => _longitude;

  void setUpdateLocation(double? lat, double? long) {
    _latitude = lat;
    _longitude = long;
    notifyListeners();
  }

  final TextEditingController _nameFarm = TextEditingController();
  TextEditingController get nameFarm => _nameFarm;

  setnameFarm(String val) {
    _nameFarm.text = val; // nombre de la finca
    notifyListeners();
  }

  final TextEditingController _numberHectareasProperty =
      TextEditingController();
  TextEditingController get numberHectareasProperty => _numberHectareasProperty;

  setNumberHectareasProperty(String val) {
    _numberHectareasProperty.text = val; // numero de hectareas del predio
    notifyListeners();
  }

  final TextEditingController _hasCertification = TextEditingController();
  TextEditingController get hasCertification => _hasCertification;

  setHasCertification(String val) {
    _hasCertification.text = val; // tiene certificación
    notifyListeners();
  }

  //?sexta pantalla #6
  final TextEditingController _liveFarm = TextEditingController();
  TextEditingController get liveFarm => _liveFarm;

  setLiveFarm(String val) {
    _liveFarm.text = val; // vive en la finca?
    notifyListeners();
  }

  final TextEditingController _typePeopleVulnerable = TextEditingController();
  TextEditingController get typePeopleVulnerable => _typePeopleVulnerable;

  setTypePeopleVulnerable(String val) {
    _typePeopleVulnerable.text = val; //tipo de población vulnerable
    notifyListeners();
  }

  final TextEditingController _ethhicGroup = TextEditingController();
  TextEditingController get ethhicGroup => _ethhicGroup;

  setEthhicGroup(String val) {
    _ethhicGroup.text = val; // grupo etnico
    notifyListeners();
  }

//?septima pantalla #7*
  final TextEditingController _typeAccountBank = TextEditingController();
  TextEditingController get typeAccountBank => _typeAccountBank;

  setTypeAccountBank(String val) {
    _typeAccountBank.text = val; // posee cuenta bancaria
    notifyListeners();
  }

  final TextEditingController _typeAccountBankOther = TextEditingController();
  TextEditingController get typeAccountBankOther => _typeAccountBankOther;

  setTypeAccountBankOther(String val) {
    _typeAccountBankOther.text =
        val; // posee cuenta bancaria cuando el usuario seleccion "Si"
    notifyListeners();
  }

  final TextEditingController _agroCulturalCredit = TextEditingController();
  TextEditingController get agroCulturalCredit => _agroCulturalCredit;

  setAgroCulturalCredit(String val) {
    _agroCulturalCredit.text = val; // posee credito agropecuario
    notifyListeners();
  }

  final TextEditingController _agroCulturalCreditOther =
      TextEditingController();
  TextEditingController get agroCulturalCreditOther => _agroCulturalCreditOther;

  setAgroCulturalCreditOther(String val) {
    _agroCulturalCreditOther.text =
        val; // posee credito agropecuario cuando el usuario seleccion "Si"
    notifyListeners();
  }

  final TextEditingController _favoredCreditCultural = TextEditingController();
  TextEditingController get favoredCreditCultural => _favoredCreditCultural;

  setFavoredCreditCultural(String val) {
    _favoredCreditCultural.text = val; // ha sido favorecido con credito cacao
    notifyListeners();
  }

  final TextEditingController _activityFavoredWithCredit =
      TextEditingController();
  TextEditingController get activityFavoredWithCredit =>
      _activityFavoredWithCredit;

  setActivityFavoredWithCredit(String val) {
    _activityFavoredWithCredit.text =
        val; // que actividad financió con el credito
    notifyListeners();
  }

//*petición a firebase

  Future<void> sentSurveysToFirabase(BuildContext context) async {
    try {
      databaseReference.add(
        {
          //!!hacer validacion por si el usuario no tiene segundo nombre o apellido
          //!!pregunta si tiene correo, whatsaap
          //pantalla #1
          //pantalla #2
          //pantalla #6
          //pantalla #7
          //pantalla #8
          //pantalla #9
          //pantalla #10
          //pantalla #11
          //pantalla #12
          //pantalla #13
          //pantalla #14
          //pantalla #15
          //pantalla #16
          //pantalla #17
          //pantalla #18
          //pantalla #19
          //pantalla #20
          //pantalla #21
          //pantalla #22
          //pantalla #23
          //pantalla #24
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
