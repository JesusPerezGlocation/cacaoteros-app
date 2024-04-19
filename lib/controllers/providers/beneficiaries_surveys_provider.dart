import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:surveys_app/controllers/exports/exports.dart';

/*
provider para la encuesta de caracterización de beneficiarios
*/
class BeneficiariesSurveysProvider extends ChangeNotifier {
/*instancia*/
  final CollectionReference databaseReference =
      FirebaseFirestore.instance.collection(ApiPaths.cacaotesting);
  final CollectionReference memberscacaotestingReferences =
      FirebaseFirestore.instance.collection(ApiPaths.memberscacaotesting);

  //*primera pantalla #1*/
  final TextEditingController _nameUnit = TextEditingController();
  TextEditingController get nameUnit => _nameUnit;
  final TextEditingController _submittionDate = TextEditingController();
  TextEditingController get submittionDate => _submittionDate;
  String _uuidiDSurveys = '';
  String get uuidiDSurveys => _uuidiDSurveys;
  final TextEditingController _deviceID = TextEditingController();
  TextEditingController get deviceID => _deviceID;

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
  final TextEditingController _selecDocumentTypeOther = TextEditingController();
  TextEditingController get selecDocumentTypeOther => _selecDocumentTypeOther;
  final TextEditingController _documentNumber = TextEditingController();
  TextEditingController get documentNumber => _documentNumber;
  final TextEditingController _expeditionMonth = TextEditingController();
  TextEditingController get expeditionMonth => _expeditionMonth;
  final TextEditingController _expeditionDay = TextEditingController();
  TextEditingController get expeditionDay => _expeditionDay;
  final TextEditingController _expeditionYear = TextEditingController();
  TextEditingController get expeditionYear => _expeditionYear;
  final TextEditingController _placeExpedition = TextEditingController();
  TextEditingController get placeExpedition => _placeExpedition;
  final TextEditingController _firtName = TextEditingController();
  TextEditingController get firtName => _firtName;
  final TextEditingController _secondName = TextEditingController();
  TextEditingController get secondName => _secondName;
  final TextEditingController _firtLastName = TextEditingController();
  TextEditingController get firtLastName => _firtLastName;
  final TextEditingController _secondLastName = TextEditingController();
  TextEditingController get secondLastName => _secondLastName;
  final TextEditingController _ageUser = TextEditingController();
  TextEditingController get ageUser => _ageUser;
  final TextEditingController _phoneNumber = TextEditingController();
  TextEditingController get phoneNumber => _phoneNumber;
  final TextEditingController _hasWhatsApp = TextEditingController();
  TextEditingController get hasWhatsApp => _hasWhatsApp;
  final TextEditingController _emailAddress = TextEditingController();
  TextEditingController get emailAddress => _emailAddress;
  final TextEditingController _hasEmailAddressOther = TextEditingController();
  TextEditingController get hasEmailAddressOther => _hasEmailAddressOther;
  final TextEditingController _servicesEthernet = TextEditingController();
  TextEditingController get servicesEthernet => _servicesEthernet;
  final TextEditingController _typeServicesEthernet = TextEditingController();
  TextEditingController get typeServicesEthernet => _typeServicesEthernet;
  final TextEditingController _whatServicesEthernet = TextEditingController();
  TextEditingController get whatServicesEthernet => _whatServicesEthernet;
  final TextEditingController _gender = TextEditingController();
  TextEditingController get gender => _gender;
  final TextEditingController _birthMonth = TextEditingController();
  TextEditingController get birthMonth => _birthMonth;
  final TextEditingController _birthDay = TextEditingController();
  TextEditingController get birthDay => _birthDay;
  final TextEditingController _birthYear = TextEditingController();
  TextEditingController get birthYear => _birthYear;
  final TextEditingController _placeBorn = TextEditingController();
  TextEditingController get placeBorn => _placeBorn;
  final TextEditingController _whatconsultEthernet = TextEditingController();
  TextEditingController get whatconsultEthernet => _whatconsultEthernet;
  final TextEditingController _hasDisability = TextEditingController();
  TextEditingController get hasDisability => _hasDisability;
  final TextEditingController _hasDisabilityOther = TextEditingController();
  TextEditingController get hasDisabilityOther => _hasDisabilityOther;
  final TextEditingController _whatconsultEthernetOther =
      TextEditingController();
  TextEditingController get whatconsultEthernetOther =>
      _whatconsultEthernetOther;

  setSelectedDocumentType(String val) {
    _selectedDocumentType.text = val; //tipo de documento
    notifyListeners();
  }

  setSelectedDocumentTypeOther(String val) {
    _selecDocumentTypeOther.text = val; // otro documento
    notifyListeners();
  }

  setDocumentNumber(String val) {
    _documentNumber.text = val; //número de documento
    notifyListeners();
  }

  setExpeditionMonth(String val) {
    _expeditionMonth.text = val; //mes de expedición del documento
    notifyListeners();
  }

  setExpeditionDay(String val) {
    _expeditionDay.text = val; // dia de expedición
    notifyListeners();
  }

  setExpeditionYear(String val) {
    _expeditionYear.text = val; //año de expedición
    notifyListeners();
  }

  setPlaceExpedition(String val) {
    _placeExpedition.text = val; // lugar de expedición
    notifyListeners();
  }

  setFirtName(String val) {
    _firtName.text = val; // primer nombre del usuario
    notifyListeners();
  }

  setSecondName(String val) {
    _secondName.text = val; // segundo nombre del usuario
    notifyListeners();
  }

  setFirtLastName(String val) {
    _firtLastName.text = val; // primero apellido del usuario
    notifyListeners();
  }

  setSecondLastName(String val) {
    _secondLastName.text = val; // segundo apellido del usuario
    notifyListeners();
  }

  setAgeUser(String val) {
    _ageUser.text = val; // edad del usuario
    notifyListeners();
  }

  setPhoneNumber(String val) {
    _phoneNumber.text = val; //número de celular
    notifyListeners();
  }

  setHasWhatsApp(String val) {
    _hasWhatsApp.text = val; // tiene whatsapp?
    notifyListeners();
  }

  setEmailAddress(String val) {
    _emailAddress.text = val; //correo
    notifyListeners();
  }

  setHasEmailAddressOther(String val) {
    _hasEmailAddressOther.text = val; //pregunta si correo
    notifyListeners();
  }

  setServicesEthernet(String val) {
    _servicesEthernet.text = val; // cuenta con servicios a internet?
    notifyListeners();
  }

  setTypeServicesEthernet(String val) {
    _typeServicesEthernet.text = val; // tipo de servicio internet
    notifyListeners();
  }

  setWhatServicesEthernet(String val) {
    _whatServicesEthernet.text = val; // cual servicio a intenert
    notifyListeners();
  }

  setGender(String val) {
    _gender.text = val; //genero
    notifyListeners();
  }

  setBirthMonth(String val) {
    _birthMonth.text = val; //mes cumpleaños
    notifyListeners();
  }

  setBirthDay(String val) {
    _birthDay.text = val; //dia cumpleaños
    notifyListeners();
  }

  setBirthYear(String val) {
    _birthYear.text = val; //año cumpleaños
    notifyListeners();
  }

  setPlaceBorn(String val) {
    _placeBorn.text = val; //lugar de nacimiento
    notifyListeners();
  }

  setWhatconsultEthernet(String val) {
    _whatconsultEthernet.text = val; //que temas consulta atrvez de internet
    notifyListeners();
  }

  setWhatconsultEthernetOther(String val) {
    _whatconsultEthernetOther.text =
        val; //que temas otro consulta atrvez de internet
    notifyListeners();
  }

  setHasDisability(String val) {
    _hasDisability.text = val; //  presenta discapcidad
    notifyListeners();
  }

  setHasDisabilityOther(String val) {
    _hasDisabilityOther.text = val; // si seleccioona otro presenta discapcidad
    notifyListeners();
  }

  //*sexta pantalla #3
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

  final TextEditingController _hasOrganizationOther = TextEditingController();
  TextEditingController get hasOrganizationOther => _hasOrganizationOther;

  setHasOrganizationOther(String val) {
    _hasOrganizationOther.text =
        val; //en caso de que haya seleccionado "Si" pertenece a asociasion
    notifyListeners();
  }

  final TextEditingController _hasOrganizationOtherYes =
      TextEditingController();
  TextEditingController get hasOrganizationOtherYes => _hasOrganizationOtherYes;

  setHasOrganizationOtherYes(String val) {
    _hasOrganizationOtherYes.text =
        val; //en caso de que haya seleccionado "Si" estar en asociaon
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

  final TextEditingController _typeLabourOther = TextEditingController();
  TextEditingController get typeLabourOther => _typeLabourOther;

  setTypeLabourOther(String val) {
    _typeLabourOther.text =
        val; // en caso de seleccioanr otra tipo de mano de obra para el cultivo de cacao
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

  final TextEditingController _nationalFederation = TextEditingController();
  TextEditingController get nationalFederation => _nationalFederation;

  setNationalFederation(String val) {
    _nationalFederation.text =
        val; // pertenece a la federación nacional de cacaoteros
    notifyListeners();
  }

  final TextEditingController _interestedFederationYesOrNot =
      TextEditingController();
  TextEditingController get interestedFederationYesOrNot =>
      _interestedFederationYesOrNot;

  setInterestedFederationYesOrNot(String val) {
    _interestedFederationYesOrNot.text =
        val; //Esta interesado en iniciar el proceso de cedulación coon Fedecacao
    notifyListeners();
  }

  final TextEditingController _observationFederationYesOrNot =
      TextEditingController();
  TextEditingController get observationFederationYesOrNot =>
      _observationFederationYesOrNot;

  setObservationFederationYesOrNot(String val) {
    _observationFederationYesOrNot.text = val; // Observación
    notifyListeners();
  }

  final TextEditingController _obtainingCertificate = TextEditingController();
  TextEditingController get obtainingCertificate => _obtainingCertificate;

  setGetobtainingCertificate(String val) {
    _obtainingCertificate.text = val; // en proceso de obtención de certificado
    notifyListeners();
  }

  final TextEditingController _obtainingCertificateOther =
      TextEditingController();
  TextEditingController get obtainingCertificateOther =>
      _obtainingCertificateOther;

  setGetobtainingCertificateOther(String val) {
    _obtainingCertificateOther.text =
        val; //en caso de que eliga otro en proceso de obtención de certificado
    notifyListeners();
  }

  //*PANTALLA CUATRO #4 */
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

  final TextEditingController _schoolRelationship = TextEditingController();
  TextEditingController get schoolRelationship => _schoolRelationship;

  setSchoolRelationship(String val) {
    _schoolRelationship.text = val; //donde estudio el familiar
    notifyListeners();
  }

  //*PANTALLA CINCO #5*/
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
    _department.text = date; //departamento
    notifyListeners();
  }

  setMunicipality(String date) {
    _municipality.text = date; //munipio
    notifyListeners();
  }

  setPlace(String date) {
    _place.text = date; //vereda
    notifyListeners();
  }

  setNameProperty(String val) {
    _nameProperty.text = val; //nombre del predio
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

  final TextEditingController _mapUnitDomestic = TextEditingController();
  TextEditingController get mapUnitDomestic => _mapUnitDomestic;

  setMapUnitDomestic(String val) {
    _mapUnitDomestic.text = val; //mapa de la unidad domestica
    notifyListeners();
  }

  final TextEditingController _hectareNumbers = TextEditingController();
  TextEditingController get hectareNumbers => _hectareNumbers;

  setHectareNumber(String val) {
    _hectareNumbers.text = val; // número de hectareas
    notifyListeners();
  }

  final TextEditingController _propertyHeight = TextEditingController();
  TextEditingController get propertyHeight => _propertyHeight;

  setPropertyHeight(String val) {
    _propertyHeight.text = val; // pendiente o altura del terreno
    notifyListeners();
  }

  final TextEditingController _whoWorkUnitDomectic = TextEditingController();
  TextEditingController get whoWorkUnitDomectic => _whoWorkUnitDomectic;

  setWhoWorkUnitDomectic(String val) {
    _whoWorkUnitDomectic.text = val; //quienes laboran en la unidad domesica
    notifyListeners();
  }

  final TextEditingController _externalPeopleWithSeguritySocial =
      TextEditingController();
  TextEditingController get externalPeopleWithSeguritySocial =>
      _externalPeopleWithSeguritySocial;

  setExternalPeopleWithSeguritySocial(String val) {
    _externalPeopleWithSeguritySocial.text =
        val; // personal externo conseguridad social
    notifyListeners();
  }

  final TextEditingController _totalAreaCacao = TextEditingController();
  TextEditingController get totalAreaCacao => _totalAreaCacao;

  setTotalAreaCacao(String val) {
    _totalAreaCacao.text = val; //area total del cacao
    notifyListeners();
  }

  final TextEditingController _ageCacao = TextEditingController();
  TextEditingController get ageCacao => _ageCacao;

  setAgeCacao(String val) {
    _ageCacao.text = val; //edad total del cultivo de ccao
    notifyListeners();
  }

  final TextEditingController _cacaoVariety = TextEditingController();
  TextEditingController get cacaoVariety => _cacaoVariety;

  setCacaoVariety(String val) {
    _cacaoVariety.text = val; // variedad del cacao
    notifyListeners();
  }

  final TextEditingController _forestAreaTotal = TextEditingController();
  TextEditingController get forestAreaTotal => _forestAreaTotal;

  setForestAreaTotal(String val) {
    _forestAreaTotal.text = val; //area total de bossques
    notifyListeners();
  }

  final TextEditingController _rastrojoAreaTotal = TextEditingController();
  TextEditingController get rastrojoAreaTotal => _rastrojoAreaTotal;

  setRastrojoAreaTotal(String val) {
    _rastrojoAreaTotal.text = val; // area total en pasto
    notifyListeners();
  }

  final TextEditingController _glassAreaTotal = TextEditingController();
  TextEditingController get glassAreaTotal => _glassAreaTotal;

  setGlassAreaTotal(String val) {
    _glassAreaTotal.text = val; // area total en pasto
    notifyListeners();
  }

  final TextEditingController _cultivesAreaTotal = TextEditingController();
  TextEditingController get cultivesAreaTotal => _cultivesAreaTotal;

  setCultivesAreaTotal(String val) {
    _cultivesAreaTotal.text = val; // araea total de otros cultivos
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

  //*PANTALLA CINCO #6*/

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

  final TextEditingController _otherCultives = TextEditingController();
  TextEditingController get otherCultives => _otherCultives;

  setoOtherCultives(String val) {
    _otherCultives.text = val; //cuales son esos otros cultivos
    notifyListeners();
  }

  final TextEditingController _timberSpecies = TextEditingController();
  TextEditingController get timberSpecies => _timberSpecies;

  setTimberSpecies(String val) {
    _timberSpecies.text = val; // especies maderables
    notifyListeners();
  }

  final TextEditingController _timberSpeciesOther = TextEditingController();
  TextEditingController get timberSpeciesOther => _timberSpeciesOther;

  setTimberSpeciesOther(String val) {
    _timberSpeciesOther.text =
        val; //en caso de que selecione "si" especies maderables
    notifyListeners();
  }

  final TextEditingController _timberTrees = TextEditingController();
  TextEditingController get timberTrees => _timberTrees;

  setTimberTrees(String val) {
    _timberTrees.text = val; // total de arboels maderables
    notifyListeners();
  }

  final TextEditingController _materialsVegetables = TextEditingController();
  TextEditingController get materialsVegetables => _materialsVegetables;

  setMaterialsVegetables(String val) {
    _materialsVegetables.text = val; // materiales vegetales
    notifyListeners();
  }

  final TextEditingController _associationWithCocoa = TextEditingController();
  TextEditingController get associationWithCocoa => _associationWithCocoa;

  setAssociationWithCocoa(String val) {
    _associationWithCocoa.text = val; // asociason con el cacoa
    notifyListeners();
  }

  final TextEditingController _associationWithCocoaOther =
      TextEditingController();
  TextEditingController get associationWithCocoaOther =>
      _associationWithCocoaOther;

  setAssociationWithCocoaOther(String val) {
    _associationWithCocoaOther.text =
        val; //si el suaurio selecciona "si" asociason con el cacoa
    notifyListeners();
  }

  final TextEditingController _systemTypeProduct = TextEditingController();
  TextEditingController get systemTypeProduct => _systemTypeProduct;

  setSystemTypeProduct(String val) {
    _systemTypeProduct.text = val; //sistema productivo de acacao implementado
    notifyListeners();
  }

  final TextEditingController _systemTypeProductOther = TextEditingController();
  TextEditingController get systemTypeProductOther => _systemTypeProductOther;

  setSystemTypeProductOther(String val) {
    _systemTypeProductOther.text =
        val; //en caso de que seleccione "otro" sistema productivo de acacao implementado
    notifyListeners();
  }

  //*PANTALLA SIETE #7
  final TextEditingController _floorSuitability = TextEditingController();
  TextEditingController get floorSuitability => _floorSuitability;
  final TextEditingController _maintenaceCultive = TextEditingController();
  TextEditingController get maintenaceCultive => _maintenaceCultive;
  final TextEditingController _floorSuitabilityOther = TextEditingController();
  TextEditingController get floorSuitabilityOther => _floorSuitabilityOther;
  final TextEditingController _irrigationSystem = TextEditingController();
  TextEditingController get irrigationSystem => _irrigationSystem;
  final TextEditingController _performFertilization = TextEditingController();
  TextEditingController get performFertilization => _performFertilization;
  final TextEditingController _typeFertilization = TextEditingController();
  TextEditingController get typeFertilization => _typeFertilization;
  final TextEditingController _typeFertilizationOther = TextEditingController();
  TextEditingController get typeFertilizationOther => _typeFertilizationOther;
  final TextEditingController _recolectionCocoa = TextEditingController();
  TextEditingController get recolectionCocoa => _recolectionCocoa;
  final TextEditingController _recolectionCocoaOther = TextEditingController();
  TextEditingController get recolectionCocoaOther => _recolectionCocoaOther;

  setFloorSuitability(String val) {
    _floorSuitability.text = val; //adecuación del suelo
    notifyListeners();
  }

  setMaintenaceCultive(String val) {
    _maintenaceCultive.text = val; // mantenimiento de cultivo
    notifyListeners();
  }

  setfloorSuitabilityOther(String val) {
    _floorSuitabilityOther.text =
        val; // en caso de que seleccione "Otro"mantenimiento de cultivo
    notifyListeners();
  }

  seTIrrigationSystem(String val) {
    _irrigationSystem.text = val; //posees sistema de riegos
    notifyListeners();
  }

  setPerformFertilization(String val) {
    _performFertilization.text = val; // realiza fertilizacion
    notifyListeners();
  }

  setTypeFertilization(String val) {
    _typeFertilization.text = val; //tipo de fertilización
    notifyListeners();
  }

  setTypeFertilizationOther(String val) {
    _typeFertilizationOther.text =
        val; //en caso de que seleccione "otro" tipo de fertilización
    notifyListeners();
  }

  setRecolectionCocoa(String val) {
    _recolectionCocoa.text = val; //recolección de cacao
    notifyListeners();
  }

  setRecolectionCocoaOther(String val) {
    _recolectionCocoaOther.text =
        val; //en caso de que seleccine otro en recolección de cacao
    notifyListeners();
  }

  //*PETICIÓN FIREBASE*/
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
          'informacion_sociodemograficap23_estado_civil': _statusCivil.text,
          'informacion_sociodemograficap23_estado_civil_otro':
              statusCivilOther.text,
          'informacion_sociodemograficap24_etnia': _ethhicGroup.text,
          'informacion_sociodemograficap24_etnia_otro': _ethhicGroupOther.text,
          'informacion_sociodemograficap25_nivel_educativo':
              _educationalLevel.text,
          'informacion_sociodemograficap26_titulo_obtenido':
              _obtainerTitle.text,
          'informacion_sociodemograficap27_tipo_tenencia':
              _possesionLandType.text,
          'informacion_sociodemograficap27_tipo_tenencia_otro':
              _possesionLandType.text,
          'informacion_sociodemograficap28_origen_teniencia_tierra':
              _originPossesionLand.text,
          'informacion_sociodemograficap28_origen_teniencia_tierra_otro':
              _originPossesionLand.text,
          'informacion_sociodemograficap30_tipo_posesion_cultivo':
              _possesionOverCultivation.text,
          'informacion_sociodemograficap30_tipo_posesion_cultivo_otro':
              _possesionOverCultivation.text,
          'informacion_sociodemograficap31_pertenece_asociacion':
              _hasOrganization.text,
          'informacion_sociodemograficap31_pertenece_asociacion_si':
              _hasOrganizationOtherYes.text,
          'informacion_sociodemograficap35_cuenta_sello_certificacion':
              _obtainingCertificate.text,
          'informacion_sociodemograficap35_cuenta_sello_certificacion_cual':
              _obtainingCertificateOther.text,
          'informacion_chequeo_criteriosp109_vinculacion_fedecacao':
              _nationalFederation.text,
          'informacion_chequeo_criteriosp109_vinculacion_fedecacao_observaciones':
              _observationFederationYesOrNot.text,
          'informacion_sociodemograficap36_afiliacion_seguridad_social':
              _socialSecurity.text,
          'informacion_sociodemograficap36_tipo_seguridad_social':
              _socialSecurityOther.text,
          'informacion_sociodemograficap37_tipo_mano_obra': _typeLabour.text,
          'informacion_sociodemograficap37_tipo_mano_obra_otro':
              _typeLabourOther.text,
          'informacion_sociodemograficap38_dias_labora_cultivo_cacao':
              _numberDayFarm.text,
          'informacion_sociodemograficap39_dias_labora_fuera_finca':
              _numberDaysMonthFarm.text,

          //pantalla #5
          'ubicacion_fincap47_codigo_departamento': _codeDepartament.text,
          'ubicacion_fincap47_departamento': _department.text,
          'ubicacion_fincap48_codigo_municipio': _codeMunicipality.text,
          'ubicacion_fincap48_municipio': _municipality.text,
          'ubicacion_fincap49_codigo_vereda': _codePlace.text,
          'ubicacion_fincap49_vereda': _place.text,
          'ubicacion_fincap50_nombre_predio': _nameProperty.text,
          'informacion_unidad_productivap59_mapa_unidad_productiva':
              _mapUnitDomestic.text,
          'informacion_unidad_productivap60_total_hectareas_predio':
              _hectareNumbers.text,
          'informacion_unidad_productivap61_pendiente_terreno':
              _propertyHeight.text,
          'informacion_unidad_productivap62_laboran_unidad_productiva':
              _whoWorkUnitDomectic.text,
          'informacion_unidad_productivap63_personal_seguridad_social':
              _externalPeopleWithSeguritySocial.text,
          'informacion_unidad_productivap64_area_total_cacao':
              _totalAreaCacao.text,
          'informacion_unidad_productivap65_edad_cultivo_cacao': _ageCacao.text,
          'informacion_unidad_productivap66_variedades_cacao_establecido':
              _cacaoVariety.text,
          'informacion_unidad_productivap67_area_total_bosques':
              _forestAreaTotal.text,
          'informacion_unidad_productivap68_area_total_rastrojo':
              _rastrojoAreaTotal.text,
          'informacion_unidad_productivap69_area_total_pastos':
              _glassAreaTotal.text,
          'informacion_unidad_productivap70_area_total_otros_cultivos':
              _cultivesAreaTotal.text,
          'informacion_unidad_productivap71_cuales_otros_cultivos':
              _otherCultives.text,
          'informacion_unidad_productivap72_especies_maderables':
              _timberSpecies.text,
          'informacion_unidad_productivap72_especies_maderables_cuales':
              _timberSpeciesOther.text,
          'informacion_unidad_productivap73_total_arboles_maderables_lote':
              _timberTrees.text,
          'informacion_unidad_productivap74_mateia_vegetal_certificado':
              _materialsVegetables.text,
          'informacion_unidad_productivap75_socios_cultivos_cacao':
              _associationWithCocoa.text,
          'informacion_unidad_productivap75_socios_cultivos_cacao_cuales':
              _associationWithCocoaOther.text,
          'informacion_unidad_productivap76_sistema_productivo':
              _systemTypeProduct.text,
          'informacion_unidad_productivap76_sistema_productivo_otro':
              _systemTypeProductOther.text,

          //pantalla #7
          'informacion_manejo_cultivop77_labores_adecuacion_suelo':
              _floorSuitability.text,
          'informacion_manejo_cultivop78_mantenimiento_cultivo':
              _maintenaceCultive.text,
          'informacion_manejo_cultivop78_mantenimiento_cultivo_otro':
              _floorSuitabilityOther.text,
          'informacion_manejo_cultivop79_posee_sistema_riego':
              _irrigationSystem.text,
          'informacion_manejo_cultivop80_realiza_fertilizacion':
              _performFertilization.text,
          'informacion_manejo_cultivop81_tipo_fertilizacion':
              _typeFertilization.text,
          'informacion_manejo_cultivop81_tipo_fertilizacion_otro':
              typeFertilizationOther.text,
          'informacion_manejo_cultivop82_numero_fertilizaciones':
              _typeFertilizationOther.text,
          'informacion_manejo_cultivop83_recolecta_cacao':
              _recolectionCocoa.text,
          'informacion_manejo_cultivop83_recolecta_cacao_otro':
              _recolectionCocoaOther.text,
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

  //*envio de datos de firebase para añadir miembros a una familia*/
  Future<void> sentAddMembersToFirabase(BuildContext context) async {
    try {
      memberscacaotestingReferences.add({
        //pantalla #4
        'KEY':
            'uuid:$_uuidiDSurveys/informacion_solo_trabajan/informacion_familiares_trabajen[1]', //!!pasar el index
        'PARENT_KEY': "uuid:$_uuidiDSurveys",
        'p40_nombres_apellidos': _nameAndLastNameRelationShip.text,
        'p41_parentesco': _relationShip.text,
        'p42_genero': _genderRelationShip.text,
        'p43_anio_nacido':
            '${_monthBrithdayRelationship.text}-${_dayBrithdayRelationship.text}-${_yearBrithdayRelationship.text}',
        'p44_escolaridad_grado': _educationLevelRelationship.text,
        'p44_escolaridad_institucion': _schoolRelationship.text,
        'p45_documento_id': _numberDocRelationship.text,
      }).then((_) {
        /*si los datos se enviaron con exito*/

        SnackBarGlobalWidget.showSnackBar(context, '¡Datos enviados con éxito!',
            Icons.check_circle_rounded, PaletteColorsTheme.principalColor);

        notifyListeners();
      }).catchError((error) {
        /*si ocurre un error, muestra un mensaje de error */
        SnackBarGlobalWidget.showSnackBar(context, 'Error $error',
            Icons.error_outline_rounded, PaletteColorsTheme.redErrorColor);
      });
    } catch (e) {
      log('error:$e');
      SnackBarGlobalWidget.showSnackBar(context, 'Error $e',
          Icons.error_outline_rounded, PaletteColorsTheme.redErrorColor);
    }
  }
}
