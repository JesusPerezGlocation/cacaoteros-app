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

  final TextEditingController _submittionDate = TextEditingController();
  TextEditingController get submittionDate => _submittionDate;

  final TextEditingController _deviceID = TextEditingController();
  TextEditingController get deviceID => _deviceID;

  String _uuidiDSurveys = '';
  String get uuidiDSurveys => _uuidiDSurveys;

  setNameUnit(String val) {
    _nameUnit.text = val; //nombre de la unidad
    notifyListeners();
  }

  setUuidiDSurveys(String id) {
    _uuidiDSurveys = id; //id de la encuesta
    notifyListeners();
  }

  setSubmittionDate(String date) {
    _submittionDate.text = date; // hora de envio de la encuesta
    notifyListeners();
  }

  setDeviceID(String date) {
    _deviceID.text = date; // id del dispositivo
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

  final TextEditingController _emailAddress = TextEditingController();
  TextEditingController get emailAddress => _emailAddress;

  setEmailAddress(String val) {
    _emailAddress.text = val; //correo
    notifyListeners();
  }

  final TextEditingController _hasEmailAddressOther = TextEditingController();
  TextEditingController get hasEmailAddressOther => _hasEmailAddressOther;

  setHasEmailAddressOther(String val) {
    _hasEmailAddressOther.text = val; //pregunta si correo
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

//*cuarta pantalla #4*/
/*seleccion de municpio, departamento y vereda*/
  final TextEditingController _department = TextEditingController();
  final TextEditingController _codeDepartament = TextEditingController();
  final TextEditingController _municipality = TextEditingController();
  final TextEditingController _codeMunicipality = TextEditingController();
  final TextEditingController _place = TextEditingController(); //vereda
  final TextEditingController _codePlace =
      TextEditingController(); //codigo vereda
  final TextEditingController _nameProperty = TextEditingController();

  TextEditingController get department => _department;
  TextEditingController get codeDepartament => _codeDepartament;
  TextEditingController get municipality => _municipality;
  TextEditingController get codeMunicipality => _codeMunicipality;
  TextEditingController get place => _place;
  TextEditingController get codePlace => _codePlace;
  TextEditingController get nameProperty => _nameProperty;

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

  setNameProperty(String val) {
    _nameProperty.text = val;
    notifyListeners();
  }

  setCodeDepartament(String val) {
    _codeDepartament.text = val;
    notifyListeners();
  }

  setCodeMunicipality(String val) {
    _codeMunicipality.text = val;
    notifyListeners();
  }

  setCodePlace(String val) {
    _codePlace.text = val;
    notifyListeners();
  }

//*quinta pantalla #5*/

  double? _latitude;
  double? _longitude;
  double? _accuracy;
  double? _altitude;

  double? get latitude => _latitude;
  double? get longitude => _longitude;
  double? get accuracy => _accuracy;
  double? get altitude => _altitude;

  void setUpdateLocation(
      double? lat, double? long, double? accu, double? alti) {
    _latitude = lat;
    _longitude = long;
    _accuracy = accu;
    _altitude = alti;
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

  //*sexta pantalla #6
  final TextEditingController _statusCivil = TextEditingController();
  TextEditingController get statusCivil => _statusCivil;
  setStatusCivil(String val) {
    _statusCivil.text = val; // estado civil
    notifyListeners();
  }

  final TextEditingController _statusCivilOther = TextEditingController();
  TextEditingController get statusCivilOther => _statusCivilOther;
  setStatusCivilOther(String val) {
    _statusCivilOther.text =
        val; // en caso de que haya seleccionado "Otro" en estado civil
    notifyListeners();
  }

  final TextEditingController _ethhicGroup = TextEditingController();
  TextEditingController get ethhicGroup => _ethhicGroup;

  setEthhicGroup(String val) {
    _ethhicGroup.text = val; // grupo etnico
    notifyListeners();
  }

  final TextEditingController _ethhicGroupOther = TextEditingController();
  TextEditingController get ethhicGroupOther => _ethhicGroupOther;

  setEthhicGroupOther(String val) {
    _ethhicGroupOther.text =
        val; //en caso de que haya seleccionado "Otro" en grupo etnico
    notifyListeners();
  }

  final TextEditingController _educationalLevel = TextEditingController();
  TextEditingController get educationalLevel => _educationalLevel;

  setEducationalLevel(String val) {
    _educationalLevel.text = val; //nivel educativo alcanzado
    notifyListeners();
  }

  final TextEditingController _educationalLevelOther = TextEditingController();
  TextEditingController get educationalLevelOther => _educationalLevelOther;

  setEducationalLevelOther(String val) {
    _educationalLevelOther.text =
        val; //en caso de que haya seleccionado "Otro" nivel educativo alcanzado
    notifyListeners();
  }

  final TextEditingController _obtainerTitle = TextEditingController();
  TextEditingController get obtainerTitle => _obtainerTitle;

  setObtainerTitle(String val) {
    _obtainerTitle.text = val; // titulo obtenido
    notifyListeners();
  }

  final TextEditingController _typeOfTenure = TextEditingController();
  TextEditingController get typeOfTenure => _typeOfTenure;

  setTypeOfTenure(String val) {
    _typeOfTenure.text = val; // seleccionar tipo de tenencia
    notifyListeners();
  }

  final TextEditingController _typeOfTenureOther = TextEditingController();
  TextEditingController get typeOfTenureOther => _typeOfTenureOther;

  setTypeOfTenureOther(String val) {
    _typeOfTenureOther.text =
        val; //en caso de que haya seleccionado "Otro" seleccionar tipo de tenencia
    notifyListeners();
  }

  final TextEditingController _originProperty = TextEditingController();
  TextEditingController get originProperty => _originProperty;

  setOriginProperty(String val) {
    _originProperty.text = val; //origen de la tenencia de la tierra
    notifyListeners();
  }

  final TextEditingController _originPropertyOther = TextEditingController();
  TextEditingController get originPropertyOther => _originPropertyOther;

  setOriginPropertyOther(String val) {
    _originPropertyOther.text =
        val; //en caso de que haya seleccionado "Otro" origen de la tenencia de la tierra
    notifyListeners();
  }

  final TextEditingController _typePossesion = TextEditingController();
  TextEditingController get typePossesion => _typePossesion;

  setTypePossesion(String val) {
    _typePossesion.text = val; // tipo de posesión
    notifyListeners();
  }

  final TextEditingController _typePossesionOther = TextEditingController();
  TextEditingController get typePossesionOther => _typePossesionOther;

  setTypePossesionOther(String val) {
    _typePossesionOther.text =
        val; //en caso de que haya seleccionado "Otro" tipo de posesión
    notifyListeners();
  }

  final TextEditingController _belongAssociation = TextEditingController();
  TextEditingController get belongAssociation => _belongAssociation;

  setBelongAssociation(String val) {
    _belongAssociation.text = val; // pertenece a alguna asociación
    notifyListeners();
  }

  final TextEditingController _belongAssociationOther = TextEditingController();
  TextEditingController get belongAssociationOther => _belongAssociationOther;

  setBelongAssociationOther(String val) {
    _belongAssociationOther.text =
        val; //en caso de que haya seleccionado "Si" pertenece a alguna asociación
    notifyListeners();
  }

  final TextEditingController _hasOrganization = TextEditingController();
  TextEditingController get hasOrganization => _hasOrganization;

  setHasOrganization(String val) {
    _hasOrganization.text = val; // pertenece a la alguna asosiación
    notifyListeners();
  }

  final TextEditingController _nationalFederationOther =
      TextEditingController();
  TextEditingController get nationalFederationOther => _nationalFederationOther;

  setNationalFederationOther(String val) {
    _nationalFederationOther.text =
        val; //en caso de que haya seleccionado "Si" pertenece a la federación nacional de cocotero
    notifyListeners();
  }

  final TextEditingController _nationalFederationOtherYes =
      TextEditingController();
  TextEditingController get nationalFederationOtherYes =>
      _nationalFederationOtherYes;

  setNationalFederationOtherYes(String val) {
    _nationalFederationOtherYes.text =
        val; //en caso de que haya seleccionado "Si" pertenece a la federación nacional de cocotero
    notifyListeners();
  }

  final TextEditingController _socialSecurity = TextEditingController();
  TextEditingController get socialSecurity => _socialSecurity;

  setSocialSecurity(String val) {
    _socialSecurity.text =
        val; // estan asociados al sistema de seguridad social?
    notifyListeners();
  }

  final TextEditingController _socialSecurityOther = TextEditingController();
  TextEditingController get socialSecurityOther => _socialSecurityOther;

  setSocialSecurityOther(String val) {
    _socialSecurityOther.text =
        val; //en caso de que haya seleccionado "Si" estan asociados al sistema de seguridad social?
    notifyListeners();
  }

  final TextEditingController _typeLabour = TextEditingController();
  TextEditingController get typeLabour => _typeLabour;

  setTypeLabour(String val) {
    _typeLabour.text = val; //tipo de mano de obra para el cultivo de cacao
    notifyListeners();
  }

  final TextEditingController _numberDayFarm = TextEditingController();
  TextEditingController get numberDayFarm => _numberDayFarm;

  setNumberDayFarm(String val) {
    _numberDayFarm.text =
        val; //numero de días al mes que labora en el cultivo de cacao
    notifyListeners();
  }

  final TextEditingController _numberDaysMonthFarm = TextEditingController();
  TextEditingController get numberDaysMonthFarm => _numberDaysMonthFarm;

  setNumberDaysMonthFarm(String val) {
    _numberDaysMonthFarm.text =
        val; //número de días que trbaja fuera de la finca
    notifyListeners();
  }

//*septima pantalla #7*
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

  //*pantalla ocho #8*/
  final TextEditingController _supportedProject = TextEditingController();
  TextEditingController get supportedProject => _supportedProject;

  setSupportedProject(String val) {
    _supportedProject.text = val; // ha sido apoyado por un proyecto de Fomento
    notifyListeners();
  }

  final TextEditingController _nameSupportProject = TextEditingController();
  TextEditingController get nameSupportProject => _nameSupportProject;

  setNameSupportProject(String val) {
    _nameSupportProject.text = val; // nombre del proyecto
    notifyListeners();
  }

  final TextEditingController _yearSupportProject = TextEditingController();
  TextEditingController get yearSupportProject => _yearSupportProject;

  setYearSupportProject(String val) {
    _yearSupportProject.text = val; // año del proyecto
    notifyListeners();
  }

  final TextEditingController _typeSupportProject = TextEditingController();
  TextEditingController get typeSupportProject => _typeSupportProject;

  setTypeSupportProject(String val) {
    _typeSupportProject.text = val; // tipo de apoyo recibido
    notifyListeners();
  }

  //*pantalla nueve #9*/

  final TextEditingController _typeHouse = TextEditingController();
  TextEditingController get typeHouse => _typeHouse;

  setTypeHouse(String val) {
    _typeHouse.text = val; // tipo de casa
    notifyListeners();
  }

  final TextEditingController _typeHouseOther = TextEditingController();
  TextEditingController get typeHouseOther => _typeHouseOther;

  setTypeHouseOther(String val) {
    _typeHouseOther.text =
        val; //en caso de que haya seleccionado "Otro" tipo de casa
    notifyListeners();
  }

  final TextEditingController _typeCeiling = TextEditingController();
  TextEditingController get typeCeiling => _typeCeiling;

  setTypeCeiling(String val) {
    _typeCeiling.text = val; // tipo de techo
    notifyListeners();
  }

  final TextEditingController _typeCeilingOther = TextEditingController();
  TextEditingController get typeCeilingOther => _typeCeilingOther;

  setTypeCeilingOther(String val) {
    _typeCeilingOther.text =
        val; //en caso de que haya seleccionado "Otro" tipo de techo
    notifyListeners();
  }

  final TextEditingController _typeOfWalls = TextEditingController();
  TextEditingController get typeOfWalls => _typeOfWalls;

  setTypeOfWalls(String val) {
    _typeOfWalls.text = val; // tipo de paredes
    notifyListeners();
  }

  final TextEditingController _typeOfWallsOthers = TextEditingController();
  TextEditingController get typeOfWallsOthers => _typeOfWallsOthers;

  setTypeOfWallsOthers(String val) {
    _typeOfWallsOthers.text =
        val; //en caso de que haya seleccionado "Otro" tipo de paredes
    notifyListeners();
  }

  final TextEditingController _typeFloors = TextEditingController();
  TextEditingController get typeFloors => _typeFloors;

  setTypeFloors(String val) {
    _typeFloors.text = val; // tipo de pisos
    notifyListeners();
  }

  final TextEditingController _typeElectricalRed = TextEditingController();
  TextEditingController get typeElectricalRed => _typeElectricalRed;

  setTypeElectricalRed(String val) {
    _typeElectricalRed.text = val; // tipo de red electrica
    notifyListeners();
  }

  final TextEditingController _typeSewer = TextEditingController();
  TextEditingController get typeSewer => _typeSewer;

  setTypeSewer(String val) {
    _typeSewer.text = val; // tipo de alcantarillado
    notifyListeners();
  }

  final TextEditingController _typeToilet = TextEditingController();
  TextEditingController get typeToilet => _typeToilet;

  setTypeToilet(String val) {
    _typeToilet.text = val; // tipo de sanitario
    notifyListeners();
  }

  final TextEditingController _telephoneAccess = TextEditingController();
  TextEditingController get telephoneAccess => _telephoneAccess;

  setTelephoneAccess(String val) {
    _telephoneAccess.text = val; // acceso a telefonoia
    notifyListeners();
  }

  final TextEditingController _garbageCollection = TextEditingController();
  TextEditingController get garbageCollection => _garbageCollection;

  setgGarbageCollection(String val) {
    _garbageCollection.text = val; // recoleccion de basura
    notifyListeners();
  }

  final TextEditingController _typeAqueduct = TextEditingController();
  TextEditingController get typeAqueduct => _typeAqueduct;

  setTypeAqueduct(String val) {
    _typeAqueduct.text = val; // tipo de acueducto
    notifyListeners();
  }

  final TextEditingController _deleteTrash = TextEditingController();
  TextEditingController get deleteTrash => _deleteTrash;

  setDeleteTrash(String val) {
    _deleteTrash.text = val; // eliminación de basura
    notifyListeners();
  }

  final TextEditingController _waterForConsumption = TextEditingController();
  TextEditingController get waterForConsumption => _waterForConsumption;

  setWaterForConsumption(String val) {
    _waterForConsumption.text = val; // agua para consumo
    notifyListeners();
  }

  final TextEditingController _cookingForEnery = TextEditingController();
  TextEditingController get cookingForEnery => _cookingForEnery;

  setCookingForEnery(String val) {
    _cookingForEnery.text = val; // energia para cocinar
    notifyListeners();
  }

  final TextEditingController _energyOnTheFarm = TextEditingController();
  TextEditingController get energyOnTheFarm => _energyOnTheFarm;

  setEnergyOnTheFarm(String val) {
    _energyOnTheFarm.text = val; // energia en la finca
    notifyListeners();
  }

//*pantalla once #11*/
  final TextEditingController _nameAndLastNameRelationShip =
      TextEditingController();
  TextEditingController get nameAndLastNameRelationShip =>
      _nameAndLastNameRelationShip;

  setNameAndLastNameRelationShip(String val) {
    _nameAndLastNameRelationShip.text = val; // nombre y apellido
    notifyListeners();
  }

  final TextEditingController _relationShip = TextEditingController();
  TextEditingController get relationShip => _relationShip;

  setRelationShip(String val) {
    _relationShip.text = val; // parentesco
    notifyListeners();
  }

  final TextEditingController _genderRelationShip = TextEditingController();
  TextEditingController get genderRelationShip => _genderRelationShip;

  setGenderRelationShip(String val) {
    _genderRelationShip.text = val; // genero del familiar
    notifyListeners();
  }

  final TextEditingController _monthBrithdayRelationship =
      TextEditingController();
  TextEditingController get monthBrithdayRelationship =>
      _monthBrithdayRelationship;

  setMonthBrithdayRelationship(String val) {
    _monthBrithdayRelationship.text = val; // mes de cumpleaños del familiar
    notifyListeners();
  }

  final TextEditingController _dayBrithdayRelationship =
      TextEditingController();
  TextEditingController get dayBrithdayRelationship => _dayBrithdayRelationship;

  setDayBrithdayRelationship(String val) {
    _dayBrithdayRelationship.text = val; // dia de cumpleaños
    notifyListeners();
  }

  final TextEditingController _yearBrithdayRelationship =
      TextEditingController();
  TextEditingController get yearBrithdayRelationship =>
      _yearBrithdayRelationship;

  setYearBrithdayRelationship(String val) {
    _yearBrithdayRelationship.text = val; //año de cumpleaños familiar
    notifyListeners();
  }

  final TextEditingController _educationLevelRelationship =
      TextEditingController();
  TextEditingController get educationLevelRelationship =>
      _educationLevelRelationship;

  setEducationLevelRelationship(String val) {
    _educationLevelRelationship.text = val; // nivel de educación del familiar
    notifyListeners();
  }

  final TextEditingController _numberDocRelationship = TextEditingController();
  TextEditingController get numberDocRelationship => _numberDocRelationship;

  setNumberDocRelationship(String val) {
    _numberDocRelationship.text = val; // numero de documento del familiar
    notifyListeners();
  }

//*petición a firebase

  Future<void> sentSurveysToFirabase(BuildContext context) async {
    try {
      databaseReference.add(
        {
          'AttachmentsExpected': "",
          'AttachmentsPresent': "",
          'DeviceID': "collect:${_deviceID.text}",
          'Edits': "",
          'FormVersion': "Versión 5",
          'KEY': "uuid:$_uuidiDSurveys",
          'ReviewState': "",
          'Status': "",
          'SubmissionDate': _submittionDate.text,
          'SubmitterID': "99",
          'SubmitterName': "iPhoneUser",

          //pantalla #1
          "encuesta_caracterizacion_nombre_unidad": _nameUnit.text,

          //pantalla #2
          'informacion_cacaocultorp3_tipo_documento':
              _selectedDocumentType.text,
          'informacion_cacaocultorp3_tipo_documento_otro':
              _selecDocumentTypeOther.text,
          'informacion_cacaocultorP4_documento': _documentNumber.text,
          'informacion_cacaocultorp5_fecha_expedicion':
              '${_expeditionMonth.text}-${_expeditionDay.text}-${_expeditionYear.text}',
          'informacion_cacaocultorp6_lugar_expedicion': _placeExpedition.text,
          'informacion_cacaocultorp7_primer_nombre': _firtName.text,
          'informacion_cacaocultorp8_segundo_nombre': _secondName.text,
          'informacion_cacaocultorp9_primer_apellido': _firtLastName.text,
          'informacion_cacaocultorp10_segundo_apellido': _secondLastName.text,
          'informacion_cacaocultorp11_fecha_nacimiento':
              '${_birthMonth.text}-${_birthDay.text}-${_birthYear.text}',
          'informacion_cacaocultorp12_edad': _ageUser.text,
          'informacion_cacaocultorp13_genero': _gender.text,
          'informacion_cacaocultorp13_genero_otro': _gender.text,
          'informacion_cacaocultorp14_lugar_nacimiento': _placeBorn.text,
          'informacion_cacaocultorp15_numero_celular': _phoneNumber.text,
          'informacion_cacaocultorp16_whatsapp_mismo_numero': _hasWhatsApp.text,
          'informacion_cacaocultorp17_tiene_correo': _emailAddress.text,
          'informacion_cacaocultorp18_correo': _hasEmailAddressOther.text,
          'informacion_cacaocultorp19_cuenta_con_internet':
              _servicesEthernet.text,
          'informacion_cacaocultorp20_tipo_servicion_internet':
              _typeServicesEthernet.text,
          'informacion_cacaocultorp20_tipo_servicion_internet_otro':
              _whatServicesEthernet.text,
          'informacion_cacaocultorp21_temas_internet':
              _whatconsultEthernet.text,
          'informacion_cacaocultorp21_temas_internet_otro':
              whatconsultEthernetOther.text,
          'informacion_cacaocultorp22_condicion_discapacidad':
              _hasDisability.text,
          'informacion_cacaocultorp22_condicion_discapacidad_si':
              _hasDisabilityOther.text,

          //pantalla #3
          'informacion_sociodemograficap27_tipo_tenencia':
              _possesionLandType.text,
          'informacion_sociodemograficap27_tipo_tenencia_otro': '',
          'informacion_sociodemograficap28_origen_teniencia_tierra':
              _originPossesionLand.text,
          'informacion_sociodemograficap28_origen_teniencia_tierra_otro': '',
          'informacion_sociodemograficap30_tipo_posesion_cultivo':
              _possesionOverCultivation.text,
          'informacion_sociodemograficap30_tipo_posesion_cultivo_otro': "",
          'informacion_sociodemograficap31_pertenece_asociacion':
              _producesOrganization.text,
          'informacion_sociodemograficap31_pertenece_asociacion_si':
              _nameOrganization.text,

          //pantalla #4
          'ubicacion_fincap47_codigo_departamento': _codeDepartament.text,
          'ubicacion_fincap47_departamento': _department.text,
          'ubicacion_fincap48_codigo_municipio': _codeMunicipality.text,
          'ubicacion_fincap48_municipio': _municipality.text,
          'ubicacion_fincap49_codigo_vereda': _codePlace.text,
          'ubicacion_fincap49_vereda': _place.text,
          'ubicacion_fincap50_nombre_predio': _nameProperty.text,

          //pantalla #5
          'informacion_unidad_productivap51altitud_coordenadasAccuracy':
              _accuracy.toString(),
          'informacion_unidad_productivap51altitud_coordenadasAltitude':
              _altitude.toString(),
          'informacion_unidad_productivap51altitud_coordenadasLatitude':
              _latitude.toString(),
          'informacion_unidad_productivap51altitud_coordenadasLongitude':
              _longitude.toString(),
          'informacion_unidad_productivap60_total_hectareas_predio':
              _numberHectareasProperty.text,

          //pantalla #6
          'informacion_sociodemograficap23_estado_civil': _statusCivil.text,
          'informacion_sociodemograficap23_estado_civil_otro':
              statusCivilOther.text,
          'informacion_sociodemograficap24_etnia': _ethhicGroup.text,
          'informacion_sociodemograficap24_etnia_otro': _ethhicGroupOther.text,
          'informacion_sociodemograficap25_nivel_educativo':
              _educationalLevel.text,
          'informacion_sociodemograficap25_nivel_educativo_otro':
              _educationalLevelOther.text,
          'informacion_sociodemograficap26_titulo_obtenido':
              _obtainerTitle.text,
          'informacion_sociodemograficap32_pertenece_federacion':
              _hasOrganization.text,
          'informacion_sociodemograficap35_cuenta_sello_certificacion':
              _nationalFederationOther.text,
          'informacion_sociodemograficap35_cuenta_sello_certificacion_cual':
              nationalFederationOtherYes.text,
          'informacion_sociodemograficap36_afiliacion_seguridad_social':
              _socialSecurity.text,
          'informacion_sociodemograficap36_tipo_seguridad_social':
              _socialSecurity.text,
          'informacion_sociodemograficap37_tipo_mano_obra': _typeLabour.text,
          'informacion_sociodemograficap37_tipo_mano_obra_otro': "",
          'informacion_sociodemograficap38_dias_labora_cultivo_cacao':
              _numberDayFarm.text,
          'informacion_sociodemograficap39_dias_labora_fuera_finca':
              _numberDaysMonthFarm.text,

          //pantalla #7

          //pantalla #8

          //pantalla #9

          //pantalla #
          //pantalla #
          //pantalla #
          //pantalla #
          //pantalla #
          //pantalla #
          //pantalla #
          //pantalla #
          //pantalla #
          //pantalla #
          //pantalla #
          //pantalla #
          //pantalla #
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
