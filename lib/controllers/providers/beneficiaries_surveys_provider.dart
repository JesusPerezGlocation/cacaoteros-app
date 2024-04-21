import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:uuid/uuid.dart';

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
  final TextEditingController _statusCivilOther = TextEditingController();
  TextEditingController get statusCivilOther => _statusCivilOther;
  final TextEditingController _ethhicGroup = TextEditingController();
  TextEditingController get ethhicGroup => _ethhicGroup;
  final TextEditingController _ethhicGroupOther = TextEditingController();
  TextEditingController get ethhicGroupOther => _ethhicGroupOther;
  final TextEditingController _educationalLevel = TextEditingController();
  TextEditingController get educationalLevel => _educationalLevel;
  final TextEditingController _educationalLevelOther = TextEditingController();
  TextEditingController get educationalLevelOther => _educationalLevelOther;
  final TextEditingController _typeOfTenureOther = TextEditingController();
  TextEditingController get typeOfTenureOther => _typeOfTenureOther;
  final TextEditingController _obtainerTitle = TextEditingController();
  TextEditingController get obtainerTitle => _obtainerTitle;
  final TextEditingController _typeOfTenure = TextEditingController();
  TextEditingController get typeOfTenure => _typeOfTenure;
  final TextEditingController _originProperty = TextEditingController();
  TextEditingController get originProperty => _originProperty;
  final TextEditingController _originPropertyOther = TextEditingController();
  TextEditingController get originPropertyOther => _originPropertyOther;
  final TextEditingController _typePossesion = TextEditingController();
  TextEditingController get typePossesion => _typePossesion;
  final TextEditingController _typePossesionOther = TextEditingController();
  TextEditingController get typePossesionOther => _typePossesionOther;
  final TextEditingController _belongAssociation = TextEditingController();
  TextEditingController get belongAssociation => _belongAssociation;
  final TextEditingController _belongAssociationOther = TextEditingController();
  TextEditingController get belongAssociationOther => _belongAssociationOther;
  final TextEditingController _hasOrganization = TextEditingController();
  TextEditingController get hasOrganization => _hasOrganization;
  final TextEditingController _hasOrganizationOther = TextEditingController();
  TextEditingController get hasOrganizationOther => _hasOrganizationOther;
  final TextEditingController _hasOrganizationOtherYes =
      TextEditingController();
  TextEditingController get hasOrganizationOtherYes => _hasOrganizationOtherYes;
  final TextEditingController _socialSecurity = TextEditingController();
  TextEditingController get socialSecurity => _socialSecurity;
  final TextEditingController _socialSecurityOther = TextEditingController();
  TextEditingController get socialSecurityOther => _socialSecurityOther;
  final TextEditingController _typeLabour = TextEditingController();
  TextEditingController get typeLabour => _typeLabour;
  final TextEditingController _typeLabourOther = TextEditingController();
  TextEditingController get typeLabourOther => _typeLabourOther;
  final TextEditingController _numberDayFarm = TextEditingController();
  TextEditingController get numberDayFarm => _numberDayFarm;
  final TextEditingController _numberDaysMonthFarm = TextEditingController();
  TextEditingController get numberDaysMonthFarm => _numberDaysMonthFarm;
  final TextEditingController _possesionLandType = TextEditingController();
  TextEditingController get possesionLandType => _possesionLandType;
  final TextEditingController _originPossesionLand = TextEditingController();
  TextEditingController get originPossesionLand => _originPossesionLand;
  final TextEditingController _nationalFederation = TextEditingController();
  TextEditingController get nationalFederation => _nationalFederation;
  final TextEditingController _possesionOverCultivation =
      TextEditingController();
  TextEditingController get possesionOverCultivation =>
      _possesionOverCultivation;
  final TextEditingController _interestedFederationYesOrNot =
      TextEditingController();
  TextEditingController get interestedFederationYesOrNot =>
      _interestedFederationYesOrNot;
  final TextEditingController _observationFederationYesOrNot =
      TextEditingController();
  TextEditingController get observationFederationYesOrNot =>
      _observationFederationYesOrNot;
  final TextEditingController _obtainingCertificate = TextEditingController();
  TextEditingController get obtainingCertificate => _obtainingCertificate;
  final TextEditingController _obtainingCertificateOther =
      TextEditingController();
  TextEditingController get obtainingCertificateOther =>
      _obtainingCertificateOther;

  setStatusCivil(String val) {
    _statusCivil.text = val; // estado civil
    notifyListeners();
  }

  setStatusCivilOther(String val) {
    _statusCivilOther.text =
        val; // en caso de que haya seleccionado "Otro" en estado civil
    notifyListeners();
  }

  setEthhicGroup(String val) {
    _ethhicGroup.text = val; // grupo etnico
    notifyListeners();
  }

  setEthhicGroupOther(String val) {
    _ethhicGroupOther.text =
        val; //en caso de que haya seleccionado "Otro" en grupo etnico
    notifyListeners();
  }

  setEducationalLevel(String val) {
    _educationalLevel.text = val; //nivel educativo alcanzado
    notifyListeners();
  }

  setEducationalLevelOther(String val) {
    _educationalLevelOther.text =
        val; //en caso de que haya seleccionado "Otro" nivel educativo alcanzado
    notifyListeners();
  }

  setObtainerTitle(String val) {
    _obtainerTitle.text = val; // titulo obtenido
    notifyListeners();
  }

  setTypeOfTenure(String val) {
    _typeOfTenure.text = val; // seleccionar tipo de tenencia
    notifyListeners();
  }

  setTypeOfTenureOther(String val) {
    _typeOfTenureOther.text =
        val; //en caso de que haya seleccionado "Otro" seleccionar tipo de tenencia
    notifyListeners();
  }

  setOriginProperty(String val) {
    _originProperty.text = val; //origen de la tenencia de la tierra
    notifyListeners();
  }

  setOriginPropertyOther(String val) {
    _originPropertyOther.text =
        val; //en caso de que haya seleccionado "Otro" origen de la tenencia de la tierra
    notifyListeners();
  }

  setTypePossesion(String val) {
    _typePossesion.text = val; // tipo de posesión
    notifyListeners();
  }

  setTypePossesionOther(String val) {
    _typePossesionOther.text =
        val; //en caso de que haya seleccionado "Otro" tipo de posesión
    notifyListeners();
  }

  setBelongAssociation(String val) {
    _belongAssociation.text = val; // pertenece a alguna asociación
    notifyListeners();
  }

  setBelongAssociationOther(String val) {
    _belongAssociationOther.text =
        val; //en caso de que haya seleccionado "Si" pertenece a alguna asociación
    notifyListeners();
  }

  setHasOrganization(String val) {
    _hasOrganization.text = val; // pertenece a la alguna asosiación
    notifyListeners();
  }

  setHasOrganizationOther(String val) {
    _hasOrganizationOther.text =
        val; //en caso de que haya seleccionado "Si" pertenece a asociasion
    notifyListeners();
  }

  setHasOrganizationOtherYes(String val) {
    _hasOrganizationOtherYes.text =
        val; //en caso de que haya seleccionado "Si" estar en asociaon
    notifyListeners();
  }

  setSocialSecurity(String val) {
    _socialSecurity.text =
        val; // estan asociados al sistema de seguridad social?
    notifyListeners();
  }

  setSocialSecurityOther(String val) {
    _socialSecurityOther.text =
        val; //en caso de que haya seleccionado "Si" estan asociados al sistema de seguridad social?
    notifyListeners();
  }

  setTypeLabour(String val) {
    _typeLabour.text = val; //tipo de mano de obra para el cultivo de cacao
    notifyListeners();
  }

  setTypeLabourOther(String val) {
    _typeLabourOther.text =
        val; // en caso de seleccioanr otra tipo de mano de obra para el cultivo de cacao
    notifyListeners();
  }

  setNumberDayFarm(String val) {
    _numberDayFarm.text =
        val; //numero de días al mes que labora en el cultivo de cacao
    notifyListeners();
  }

  setNumberDaysMonthFarm(String val) {
    _numberDaysMonthFarm.text =
        val; //número de días que trbaja fuera de la finca
    notifyListeners();
  }

  setPosessionLandTypee(String val) {
    _possesionLandType.text = val; // tenienca de la tierra
    notifyListeners();
  }

  setOriginPosessionLand(String val) {
    _originPossesionLand.text = val; // origen de la tenencia de la tierra
    notifyListeners();
  }

  setPossesionOverCultivation(String val) {
    _possesionOverCultivation.text = val; // posesión sobre cultivo
    notifyListeners();
  }

  setNationalFederation(String val) {
    _nationalFederation.text =
        val; // pertenece a la federación nacional de cacaoteros
    notifyListeners();
  }

  setInterestedFederationYesOrNot(String val) {
    _interestedFederationYesOrNot.text =
        val; //Esta interesado en iniciar el proceso de cedulación coon Fedecacao
    notifyListeners();
  }

  setObservationFederationYesOrNot(String val) {
    _observationFederationYesOrNot.text = val; // Observación
    notifyListeners();
  }

  setGetobtainingCertificate(String val) {
    _obtainingCertificate.text = val; // en proceso de obtención de certificado
    notifyListeners();
  }

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
  final TextEditingController _relationShip = TextEditingController();
  TextEditingController get relationShip => _relationShip;
  final TextEditingController _genderRelationShip = TextEditingController();
  TextEditingController get genderRelationShip => _genderRelationShip;
  final TextEditingController _monthBrithdayRelationship =
      TextEditingController();
  TextEditingController get monthBrithdayRelationship =>
      _monthBrithdayRelationship;
  final TextEditingController _dayBrithdayRelationship =
      TextEditingController();
  TextEditingController get dayBrithdayRelationship => _dayBrithdayRelationship;
  final TextEditingController _yearBrithdayRelationship =
      TextEditingController();
  TextEditingController get yearBrithdayRelationship =>
      _yearBrithdayRelationship;
  final TextEditingController _educationLevelRelationship =
      TextEditingController();
  TextEditingController get educationLevelRelationship =>
      _educationLevelRelationship;
  final TextEditingController _numberDocRelationship = TextEditingController();
  TextEditingController get numberDocRelationship => _numberDocRelationship;
  final TextEditingController _schoolRelationship = TextEditingController();
  TextEditingController get schoolRelationship => _schoolRelationship;

  setNameAndLastNameRelationShip(String val) {
    _nameAndLastNameRelationShip.text = val; // nombre y apellido
    notifyListeners();
  }

  setRelationShip(String val) {
    _relationShip.text = val; // parentesco
    notifyListeners();
  }

  setGenderRelationShip(String val) {
    _genderRelationShip.text = val; // genero del familiar
    notifyListeners();
  }

  setMonthBrithdayRelationship(String val) {
    _monthBrithdayRelationship.text = val; // mes de cumpleaños del familiar
    notifyListeners();
  }

  setDayBrithdayRelationship(String val) {
    _dayBrithdayRelationship.text = val; // dia de cumpleaños
    notifyListeners();
  }

  setYearBrithdayRelationship(String val) {
    _yearBrithdayRelationship.text = val; //año de cumpleaños familiar
    notifyListeners();
  }

  setEducationLevelRelationship(String val) {
    _educationLevelRelationship.text = val; // nivel de educación del familiar
    notifyListeners();
  }

  setNumberDocRelationship(String val) {
    _numberDocRelationship.text = val; // numero de documento del familiar
    notifyListeners();
  }

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
  final TextEditingController _mapUnitDomestic = TextEditingController();
  TextEditingController get mapUnitDomestic => _mapUnitDomestic;
  final TextEditingController _hectareNumbers = TextEditingController();
  TextEditingController get hectareNumbers => _hectareNumbers;
  final TextEditingController _propertyHeight = TextEditingController();
  TextEditingController get propertyHeight => _propertyHeight;
  final TextEditingController _whoWorkUnitDomectic = TextEditingController();
  TextEditingController get whoWorkUnitDomectic => _whoWorkUnitDomectic;
  final TextEditingController _externalPeopleWithSeguritySocial =
      TextEditingController();
  TextEditingController get externalPeopleWithSeguritySocial =>
      _externalPeopleWithSeguritySocial;
  final TextEditingController _totalAreaCacao = TextEditingController();
  TextEditingController get totalAreaCacao => _totalAreaCacao;
  final TextEditingController _ageCacao = TextEditingController();
  TextEditingController get ageCacao => _ageCacao;
  final TextEditingController _cacaoVariety = TextEditingController();
  TextEditingController get cacaoVariety => _cacaoVariety;
  final TextEditingController _forestAreaTotal = TextEditingController();
  TextEditingController get forestAreaTotal => _forestAreaTotal;
  final TextEditingController _rastrojoAreaTotal = TextEditingController();
  TextEditingController get rastrojoAreaTotal => _rastrojoAreaTotal;
  final TextEditingController _glassAreaTotal = TextEditingController();
  TextEditingController get glassAreaTotal => _glassAreaTotal;
  final TextEditingController _cultivesAreaTotal = TextEditingController();
  TextEditingController get cultivesAreaTotal => _cultivesAreaTotal;

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

  setMapUnitDomestic(String val) {
    _mapUnitDomestic.text = val; //mapa de la unidad domestica
    notifyListeners();
  }

  setHectareNumber(String val) {
    _hectareNumbers.text = val; // número de hectareas
    notifyListeners();
  }

  setPropertyHeight(String val) {
    _propertyHeight.text = val; // pendiente o altura del terreno
    notifyListeners();
  }

  setWhoWorkUnitDomectic(String val) {
    _whoWorkUnitDomectic.text = val; //quienes laboran en la unidad domesica
    notifyListeners();
  }

  setExternalPeopleWithSeguritySocial(String val) {
    _externalPeopleWithSeguritySocial.text =
        val; // personal externo conseguridad social
    notifyListeners();
  }

  setTotalAreaCacao(String val) {
    _totalAreaCacao.text = val; //area total del cacao
    notifyListeners();
  }

  setAgeCacao(String val) {
    _ageCacao.text = val; //edad total del cultivo de ccao
    notifyListeners();
  }

  setCacaoVariety(String val) {
    _cacaoVariety.text = val; // variedad del cacao
    notifyListeners();
  }

  setForestAreaTotal(String val) {
    _forestAreaTotal.text = val; //area total de bossques
    notifyListeners();
  }

  setRastrojoAreaTotal(String val) {
    _rastrojoAreaTotal.text = val; // area total en pasto
    notifyListeners();
  }

  setGlassAreaTotal(String val) {
    _glassAreaTotal.text = val; // area total en pasto
    notifyListeners();
  }

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
  final TextEditingController _otherCultives = TextEditingController();
  TextEditingController get otherCultives => _otherCultives;
  final TextEditingController _timberSpecies = TextEditingController();
  TextEditingController get timberSpecies => _timberSpecies;
  final TextEditingController _timberSpeciesOther = TextEditingController();
  TextEditingController get timberSpeciesOther => _timberSpeciesOther;
  final TextEditingController _timberTrees = TextEditingController();
  TextEditingController get timberTrees => _timberTrees;
  final TextEditingController _materialsVegetables = TextEditingController();
  TextEditingController get materialsVegetables => _materialsVegetables;
  final TextEditingController _associationWithCocoa = TextEditingController();
  TextEditingController get associationWithCocoa => _associationWithCocoa;
  final TextEditingController _associationWithCocoaOther =
      TextEditingController();
  TextEditingController get associationWithCocoaOther =>
      _associationWithCocoaOther;
  final TextEditingController _systemTypeProduct = TextEditingController();
  TextEditingController get systemTypeProduct => _systemTypeProduct;
  final TextEditingController _systemTypeProductOther = TextEditingController();
  TextEditingController get systemTypeProductOther => _systemTypeProductOther;
  double? get altitude => _altitude;

  void setUpdateLocation(
      double? lat, double? long, double? accu, double? alti) {
    _latitude = lat;
    _longitude = long;
    _accuracy = accu;
    _altitude = alti;
    notifyListeners();
  }

  setoOtherCultives(String val) {
    _otherCultives.text = val; //cuales son esos otros cultivos
    notifyListeners();
  }

  setTimberSpecies(String val) {
    _timberSpecies.text = val; // especies maderables
    notifyListeners();
  }

  setTimberSpeciesOther(String val) {
    _timberSpeciesOther.text =
        val; //en caso de que selecione "si" especies maderables
    notifyListeners();
  }

  setTimberTrees(String val) {
    _timberTrees.text = val; // total de arboels maderables
    notifyListeners();
  }

  setMaterialsVegetables(String val) {
    _materialsVegetables.text = val; // materiales vegetales
    notifyListeners();
  }

  setAssociationWithCocoa(String val) {
    _associationWithCocoa.text = val; // asociason con el cacoa
    notifyListeners();
  }

  setAssociationWithCocoaOther(String val) {
    _associationWithCocoaOther.text =
        val; //si el suaurio selecciona "si" asociason con el cacoa
    notifyListeners();
  }

  setSystemTypeProduct(String val) {
    _systemTypeProduct.text = val; //sistema productivo de acacao implementado
    notifyListeners();
  }

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

//*PANTALLA OCHO #8 */
  final TextEditingController _totalCropProduction = TextEditingController();
  TextEditingController get totalCropProduction => _totalCropProduction;
  final TextEditingController _benefitsInfrastructure = TextEditingController();
  TextEditingController get benefitsInfrastructure => _benefitsInfrastructure;
  final TextEditingController _sellTheGrain = TextEditingController();
  TextEditingController get sellTheGrain => _sellTheGrain;
  final TextEditingController _fermentationProcess = TextEditingController();
  TextEditingController get fermentationProcess => _fermentationProcess;
  final TextEditingController _fermentationProcessOther =
      TextEditingController();
  TextEditingController get fermentationProcessOther =>
      _fermentationProcessOther;
  final TextEditingController _fermentationTime = TextEditingController();
  TextEditingController get fermentationTime => _fermentationTime;
  final TextEditingController _dryingMethod = TextEditingController();
  TextEditingController get dryingMethod => _dryingMethod;
  final TextEditingController _whereCocoaIsDried = TextEditingController();
  TextEditingController get whereCocoaIsDried => _whereCocoaIsDried;
  final TextEditingController _whereCocoaIsDriedOther = TextEditingController();
  TextEditingController get whereCocoaIsDriedOther => _whereCocoaIsDriedOther;

  setTotalCropProduction(String val) {
    _totalCropProduction.text =
        val; // producción total de cosechada en el último año
    notifyListeners();
  }

  setBenefitsInfrastructure(String val) {
    _benefitsInfrastructure.text = val; //infraestructura de beneficios
    notifyListeners();
  }

  setSellTheGrain(String val) {
    _sellTheGrain.text = val; //como vende el grano
    notifyListeners();
  }

  setFermentationProcess(String val) {
    _fermentationProcess.text = val; //fermentation process
    notifyListeners();
  }

  setFermentationProcessOther(String val) {
    _fermentationProcessOther.text =
        val; //en caso de que seleccione "otro" fermentation process
    notifyListeners();
  }

  setFermentationTime(String val) {
    _fermentationTime.text = val; //tiempo de fermentación
    notifyListeners();
  }

  setDryingMethod(String val) {
    _dryingMethod.text = val; //metodo de secado
    notifyListeners();
  }

  setWhereCocoaIsDried(String val) {
    _whereCocoaIsDried.text = val; //dónde seca el cacao
    notifyListeners();
  }

  setWhereCocoaIsDriedOther(String val) {
    _whereCocoaIsDriedOther.text =
        val; //en caso de que seleccione "otro" dónde seca el cacao
    notifyListeners();
  }

  //*PANTALLA NUEVE #9*/

  final TextEditingController _destinationOfTheCocoa = TextEditingController();
  TextEditingController get destinationOfTheCocoa => _destinationOfTheCocoa;
  final TextEditingController _destinationOfTheCocoaOther =
      TextEditingController();
  TextEditingController get destinationOfTheCocoaOther =>
      _destinationOfTheCocoaOther;
  final TextEditingController _nameComercializationCocoa =
      TextEditingController();
  TextEditingController get nameComercializationCocoa =>
      _nameComercializationCocoa;
  final TextEditingController _comercializationMunicipalityCocoa =
      TextEditingController();
  TextEditingController get comercializationMunicipalityCocoa =>
      _comercializationMunicipalityCocoa;

  setDestinationOfTheCocoa(String val) {
    _destinationOfTheCocoa.text = val; //destino del grano de cacao

    notifyListeners();
  }

  setDestinationOfTheCocoaOther(String val) {
    _destinationOfTheCocoaOther.text =
        val; //en caso de que seleccione "otro" destino del grano de cacao

    notifyListeners();
  }

  setNameComercializationCocoa(String val) {
    _nameComercializationCocoa.text =
        val; //nombre de a quien el comercializa el cacoa
    notifyListeners();
  }

  setComercializationMunicipalityCocoa(String val) {
    _comercializationMunicipalityCocoa.text =
        val; //municipio donde comercializa el grano
    notifyListeners();
  }
  //*PANTALLA DIEZ #10*/

  final TextEditingController _bpmInTheFarm = TextEditingController();
  TextEditingController get bpmInTheFarm => _bpmInTheFarm;
  final TextEditingController _workInCultivation = TextEditingController();
  TextEditingController get workInCultivation => _workInCultivation;
  final TextEditingController _workInCultivationOther = TextEditingController();
  TextEditingController get workInCultivationOther => _workInCultivationOther;
  final TextEditingController _typeRegisterInFarm = TextEditingController();
  TextEditingController get typeRegisterInFarm => _typeRegisterInFarm;
  final TextEditingController _storageAreas = TextEditingController();
  TextEditingController get storageAreas => _storageAreas;
  final TextEditingController _storageAreasOther = TextEditingController();
  TextEditingController get storageAreasOther => _storageAreasOther;
  final TextEditingController _hidricWaterSource = TextEditingController();
  TextEditingController get hidricWaterSource => _hidricWaterSource;
  final TextEditingController _protectedMargins = TextEditingController();
  TextEditingController get protectedMargins => _protectedMargins;
  final TextEditingController _waterConcession = TextEditingController();
  TextEditingController get waterConcession => _waterConcession;
  final TextEditingController _waterUse = TextEditingController();
  TextEditingController get waterUse => _waterUse;
  final TextEditingController _authorizedLitersOfWater =
      TextEditingController();
  TextEditingController get authorizedLitersOfWater => _authorizedLitersOfWater;
  final TextEditingController _floorConservationOther = TextEditingController();
  TextEditingController get floorConservationOther => _floorConservationOther;
  final TextEditingController _floorConservation = TextEditingController();
  TextEditingController get floorConservation => _floorConservation;
  final TextEditingController _systemRegistrationInFarm =
      TextEditingController();
  TextEditingController get systemRegistrationInFarm =>
      _systemRegistrationInFarm;
  final TextEditingController _iCACertifiesTheFarms = TextEditingController();
  TextEditingController get iCACertifiesTheFarms => _iCACertifiesTheFarms;
  final TextEditingController _plannedToDeforest = TextEditingController();
  TextEditingController get plannedToDeforest => _plannedToDeforest;
  final TextEditingController _birdController = TextEditingController();
  TextEditingController get birdController => _birdController;
  final TextEditingController _mammalsController = TextEditingController();
  TextEditingController get mammalsController => _mammalsController;
  final TextEditingController _reptilesController = TextEditingController();
  TextEditingController get reptilesController => _reptilesController;

  setBpmInTheFarm(String val) {
    _bpmInTheFarm.text = val; //implementa BPM en su finca
    notifyListeners();
  }

  setWorkInCultivation(String val) {
    _workInCultivation.text = val; //labores que realiza en el cultivo
    notifyListeners();
  }

  setWorkInCultivationOther(String val) {
    _workInCultivationOther.text =
        val; //en caso de que seleccione "otro" labores que realiza en el cultivo
    notifyListeners();
  }

  setTypeRegisterInFarm(String val) {
    _typeRegisterInFarm.text = val; // tipo de registro que lleva en su finca
    notifyListeners();
  }

  setStorageAreas(String val) {
    _storageAreas.text = val; //Cuenta con áreas de almecenamiento para
    notifyListeners();
  }

  setStorageAreasOther(String val) {
    _storageAreasOther.text =
        val; //en caso de que seleccione "otro"Cuenta con áreas de almecenamiento para
    notifyListeners();
  }

  setHidricWaterSource(String val) {
    _hidricWaterSource.text = val; //fuente hídrica cercana
    notifyListeners();
  }

  setProtectedMargins(String val) {
    _protectedMargins.text = val; //márgenes protegidos
    notifyListeners();
  }

  setWaterUse(String val) {
    _waterUse.text = val; //usso del agua
    notifyListeners();
  }

  setWaterConcession(String val) {
    _waterConcession.text = val; //concesión de agua
    notifyListeners();
  }

  setAuthorizedLitersOfWater(String val) {
    _authorizedLitersOfWater.text = val; //litros de agua autorizados
    notifyListeners();
  }

  setFloorConservation(String val) {
    _floorConservation.text = val; //conservacion de suelo
    notifyListeners();
  }

  setFloorConservationOther(String val) {
    _floorConservationOther.text =
        val; //en caso de que seleccione "otro" conservacion de suelo
    notifyListeners();
  }

  setSystemRegistrationInFarm(String val) {
    _systemRegistrationInFarm.text =
        val; //La familia cuenta con un sistema de registro de información para la administración de su finca
    notifyListeners();
  }

  setICACertifiesTheFarms(String val) {
    _iCACertifiesTheFarms.text = val; //ICA certifica a las fincas BPA
    notifyListeners();
  }

  setPlannedToDeforest(String val) {
    _plannedToDeforest.text = val; // planea degorestar areas
    notifyListeners();
  }

  setBirdController(String val) {
    _birdController.text = val; // aves
    notifyListeners();
  }

  setMammalsController(String val) {
    _mammalsController.text = val; //mamiferos
    notifyListeners();
  }

  setReptilesController(String val) {
    _reptilesController.text = val; //reptiles
    notifyListeners();
  }

//*PANTALLA DOCE #12*/

  final TextEditingController _ruralPossessorOwner = TextEditingController();
  TextEditingController get ruralPossessorOwner => _ruralPossessorOwner;
  final TextEditingController _obsevationRuralPossestion =
      TextEditingController();
  TextEditingController get obsevationRuralPossestion =>
      _obsevationRuralPossestion;

  final TextEditingController _boundFederationCacaoteros =
      TextEditingController();
  TextEditingController get boundFederationCacaoteros =>
      _boundFederationCacaoteros;
  final TextEditingController _observationboundFederationCacaoteros =
      TextEditingController();
  TextEditingController get observationboundFederationCacaoteros =>
      _observationboundFederationCacaoteros;
  final TextEditingController _fiveHundredTrees = TextEditingController();
  TextEditingController get fiveHundredTrees => _fiveHundredTrees;
  final TextEditingController _observationfiveHundredTrees =
      TextEditingController();
  TextEditingController get observationfiveHundredTrees =>
      _observationfiveHundredTrees;
  final TextEditingController _familyNucleo = TextEditingController();
  TextEditingController get familyNucleo => _familyNucleo;
  final TextEditingController _observationfamilyNucleo =
      TextEditingController();
  TextEditingController get observationfamilyNucleo => _observationfamilyNucleo;
  final TextEditingController _phoneAndTecnology = TextEditingController();
  TextEditingController get phoneAndTecnology => _phoneAndTecnology;
  final TextEditingController _observationphoneAndTecnology =
      TextEditingController();
  TextEditingController get observationphoneAndTecnology =>
      _observationphoneAndTecnology;
  final TextEditingController _ethernetServices = TextEditingController();
  TextEditingController get ethernetServices => _ethernetServices;
  final TextEditingController _observationethernetServices =
      TextEditingController();
  TextEditingController get observationethernetServices =>
      _observationethernetServices;

  setRuralPossessorOwner(String val) {
    _ruralPossessorOwner.text = val; //propietario o poseedor de predio rural
    notifyListeners();
  }

  setObsevationRuralPossestion(String val) {
    _obsevationRuralPossestion.text =
        val; //Observacion espropietario o poseedor de predio rural
    notifyListeners();
  }

  setBoundFederationCacaoteros(String val) {
    _boundFederationCacaoteros.text =
        val; //Se encuentra vinculado a la Federación Nacional de Cacaoteros - FedeCacao
    notifyListeners();
  }

  setObservationBoundFederationCacaoteros(String val) {
    _observationboundFederationCacaoteros.text =
        val; //Observacion Se encuentra vinculado a la Federación Nacional de Cacaoteros - FedeCacao
    notifyListeners();
  }

  setFiveHundredTrees(String val) {
    _fiveHundredTrees.text = val; //quininentos árboles
    notifyListeners();
  }

  setObservationfiveHundredTrees(String val) {
    _observationfiveHundredTrees.text = val; //Observacion quininentos árboles
    notifyListeners();
  }

  setFamilyNucleo(String val) {
    _familyNucleo.text = val; // nucleo familiar
    notifyListeners();
  }

  setObservationFamilyNucleo(String val) {
    _observationfamilyNucleo.text = val; //Observacion nucleo familiar
    notifyListeners();
  }

  setphoneAndTecnology(String val) {
    _phoneAndTecnology.text =
        val; //Posee equipo celular y conocimientos tecnólogicos
    notifyListeners();
  }

  setObservationphoneAndTecnology(String val) {
    _observationphoneAndTecnology.text =
        val; //Observacion Posee equipo celular y conocimientos tecnólogicos
    notifyListeners();
  }

  setEthernetServices(String val) {
    _ethernetServices.text =
        val; //Cuenta con el servicio de conectividad a internet
    notifyListeners();
  }

  setObservationEthernetServices(String val) {
    _observationethernetServices.text =
        val; //Observacion Cuenta con el servicio de conectividad a internet
    notifyListeners();
  }

  String _signatureProducts = '';
  String get signatureProducts => _signatureProducts;
  String _signatureTecns = '';
  String get signatureTecns => _signatureTecns;

  setSignatureProducts(String signature) {
    _signatureProducts = signature; //set la firma del productor
    notifyListeners();
  }

  setSignatureTecns(String signature) {
    _signatureTecns = signature; //set la firma del tecnico
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

          //pantalla #8
          'informacion_postcosechap84_produccion_total_anual':
              _totalCropProduction.text,
          'informacion_postcosechap85_posee_infraestructura':
              _benefitsInfrastructure.text,
          'informacion_postcosechap86_como_venden_grano': _sellTheGrain.text,
          'informacion_postcosechap87_metodo_fermentacion':
              _fermentationProcess.text,
          'informacion_postcosechap87_metodo_fermentacion_otro':
              _fermentationProcessOther.text,
          'informacion_postcosechap88_tiempo_fermentacion':
              fermentationTime.text,
          'informacion_postcosechap89_metodo_secado': _dryingMethod.text,
          'informacion_postcosechap90_donde_seca_cacao':
              _whereCocoaIsDried.text,
          'informacion_postcosechap90_donde_seca_cacao_otro':
              _whereCocoaIsDriedOther.text,

          //pantalla #9
          'informacion_comercialp91_destino_cacao': _destinationOfTheCocoa.text,
          'informacion_comercialp91_destino_cacao_otro':
              _destinationOfTheCocoaOther.text,
          'informacion_comercialp92_quien_comercializa_grano':
              _nameComercializationCocoa.text,
          'informacion_comercialp93_municipio_de_comercializacion':
              _comercializationMunicipalityCocoa.text,

          //pantalla #10
          'informacion_buenas_practicasp94_implementa_bpa': _bpmInTheFarm.text,
          'informacion_buenas_practicasp95_labores_realiza_cultivo':
              _workInCultivation.text,
          'informacion_buenas_practicasp95_labores_realiza_cultivo_otro':
              _workInCultivationOther.text,
          'informacion_buenas_practicasp96_tipo_resgistros':
              _typeRegisterInFarm.text,
          'informacion_buenas_practicasp97_areas_de_almacenamiento':
              _storageAreas.text,
          'informacion_buenas_practicasp97_areas_de_almacenamiento_otro':
              _storageAreasOther.text,
          'informacion_buenas_practicasp98_cuenta_fuente_hifrica_cerca':
              _hidricWaterSource.text,
          'informacion_buenas_practicasp99_protegidas_sus_margenes':
              _protectedMargins.text,

          'informacion_buenas_practicasp100_uso_agua': _waterUse.text,
          'informacion_buenas_practicasp101_tiene_consecion_agua':
              _waterConcession.text,
          'informacion_buenas_practicasp102_litros_autorizados':
              _authorizedLitersOfWater.text,
          'informacion_buenas_practicasp103_conservacion_suelo':
              _floorConservation.text,
          'informacion_buenas_practicasp103_conservacion_suelo_otro':
              _floorConservationOther.text,
          'informacion_buenas_practicasp104_cuenta_registro_informacion':
              _systemRegistrationInFarm.text,
          'informacion_buenas_practicasp105_ica': _iCACertifiesTheFarms.text,
          'informacion_buenas_practicasp106_planeado_deforestar':
              _plannedToDeforest.text,

          //pantalla #11
          'informacion_buenas_practicasespeciesp107_especies_encontradas_aves':
              _birdController.text,
          'informacion_buenas_practicasespeciesp107_especies_encontradas_mamiferos':
              _mammalsController.text,
          'informacion_buenas_practicasespeciesp107_especies_encontradas_reptiles':
              _reptilesController.text,

          //pantalla #12
          'informacion_chequeo_criteriosp108_predio_rural':
              _ruralPossessorOwner.text,
          'informacion_chequeo_criteriosp108_predio_rural_observaciones':
              _obsevationRuralPossestion.text,
          // 'informacion_chequeo_criteriosp109_vinculacion_fedecacao':, //!!!esta repetida la pregunta
          // 'informacion_chequeo_criteriosp109_vinculacion_fedecacao_observaciones':,//!!!esta repetida la pregunta
          'informacion_chequeo_criteriosp110_500_arboles_cacao':
              _fiveHundredTrees.text,
          'informacion_chequeo_criteriosp110_500_arboles_cacao_observaciones':
              _observationfiveHundredTrees.text,
          'informacion_chequeo_criteriosp111_vive_nucleo_familiar':
              _familyNucleo.text,
          'informacion_chequeo_criteriosp111_vive_nucleo_familiar_observaciones':
              _observationfamilyNucleo.text,
          'informacion_chequeo_criteriosp112_posee_tecnologia':
              _phoneAndTecnology.text,
          'informacion_chequeo_criteriosp112_posee_tecnologia_observaciones':
              _observationphoneAndTecnology.text,
          'informacion_chequeo_criteriosp114_posee_internet':
              _ethernetServices.text,
          'informacion_chequeo_criteriosp114_posee_internet_observaciones':
              _observationethernetServices.text,

          //pantalla #13
          'habeas_datapdp_firma_campo': _signatureTecns,
          'habeas_datapdp_firma_productor': _signatureProducts,
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

  //*PANTALLA PARA UN AÑADIR MIEMBRO DE FAMILIA*/

  final List<FamilyMember> _familyMembers = [];
  List<FamilyMember> get familyMembers => _familyMembers;

  int memberCounter = 1;

  final TextEditingController _nameAndLastNameMember = TextEditingController();
  TextEditingController get nameAndLastNameMember => _nameAndLastNameMember;
  final TextEditingController _selectRelationShipMember =
      TextEditingController();
  TextEditingController get selectRelationShipMember =>
      _selectRelationShipMember;
  final TextEditingController _selectGenderRelationShipMember =
      TextEditingController();
  TextEditingController get selectGenderRelationShipMember =>
      _selectGenderRelationShipMember;
  final TextEditingController _birthdayMonthRelationShipMember =
      TextEditingController();
  TextEditingController get birthdayMonthRelationShipMember =>
      _birthdayMonthRelationShipMember;
  final TextEditingController _birthdayDayRelationShipMember =
      TextEditingController();
  TextEditingController get birthdayDayRelationShipMember =>
      _birthdayDayRelationShipMember;
  final TextEditingController _birthdayYearRelationShipMember =
      TextEditingController();
  TextEditingController get birthdayYearRelationShipMember =>
      _birthdayYearRelationShipMember;
  final TextEditingController _levelShoolRelationShipMember =
      TextEditingController();
  TextEditingController get levelShoolRelationShipMember =>
      _levelShoolRelationShipMember;

  final TextEditingController _schoolRelationShipMember =
      TextEditingController();
  TextEditingController get schoolRelationShipMember =>
      _schoolRelationShipMember;
  final TextEditingController _numberRelationShipMember =
      TextEditingController();
  TextEditingController get numberRelationShipMember =>
      _numberRelationShipMember;

  setNameAndLastNameMember(String val) {
    _nameAndLastNameMember.text = val; //nombre y apellido del miembro
    notifyListeners();
  }

  setSelectRelationShipMember(String val) {
    _selectRelationShipMember.text = val; //seleccionar parentesco del miembro
    notifyListeners();
  }

  setSelectGenderRelationShipMember(String val) {
    _selectGenderRelationShipMember.text = val; //genero del miembro
    notifyListeners();
  }

  setBirthdayMonthRelationShipMember(String val) {
    _birthdayMonthRelationShipMember.text = val; //mes de cumpleaños del miembro
    notifyListeners();
  }

  setBirthdayDayRelationShipMember(String val) {
    _birthdayDayRelationShipMember.text = val; //dia de cumpleaños del miembro
    notifyListeners();
  }

  setBirthdayYearRelationShipMember(String val) {
    _birthdayYearRelationShipMember.text = val; // año de cumpleaños del miembro
    notifyListeners();
  }

  setLevelShoolRelationShipMember(String val) {
    _levelShoolRelationShipMember.text = val; //nivel de escolaridad del miembro
    notifyListeners();
  }

  setSchoolRelationShipMember(String val) {
    _schoolRelationShipMember.text = val; //colegio del miembro
    notifyListeners();
  }

  setnumberRelationShipMember(String val) {
    _numberRelationShipMember.text = val; //número de documento del miembro
    notifyListeners();
  }

  // añade miembro a la lista
  addFamilyMember(FamilyMember member) {
    /*genera un nuevo UUID para el miembro */
    String memberId = const Uuid().v4();

    /*asignar el ID al miembro */
    member.id =
        '$memberId/informacion_solo_trabajan/informacion_familiares_trabajen[$memberCounter]';

    /*añadir el miembro a la lista */
    familyMembers.add(member);

    /*incrementar el contador para el próximo miembro */
    memberCounter++;

    notifyListeners();

    log('id: ${member.id}');
    log('name: ${member.name}');
    log('relation: ${member.relationship}');
    log('genero: ${member.gender}');
    log('cumpleaños: ${member.birthdayMonth}-${member.birthdayDay}-${member.birthdayYear}');
    log('nivel de educación: ${member.educationLevel}');
    log('colegio: ${member.school}');
    log('documento: ${member.documentNumber}');
  }

  /*limpia la pantalla de add miembros*/
  cleanInputsMembers() {
    _nameAndLastNameMember.clear();
    _selectRelationShipMember.clear();
    _selectGenderRelationShipMember.clear();
    _birthdayMonthRelationShipMember.clear();
    _birthdayDayRelationShipMember.clear();
    _birthdayYearRelationShipMember.clear();
    _levelShoolRelationShipMember.clear();
    _numberRelationShipMember.clear();
    notifyListeners();
  }

  /*limpia todos los datos del provider*/
  cleanAllProvider() {
    /*limpia la lista*/
    _familyMembers.clear();

    memberCounter = 1;
    _nameUnit.clear();
    _submittionDate.clear();
    _deviceID.clear();
    _selectedDocumentType.clear();
    _selecDocumentTypeOther.clear();
    _documentNumber.clear();
    _expeditionMonth.clear();
    _expeditionDay.clear();
    _expeditionYear.clear();
    _placeExpedition.clear();
    _firtName.clear();
    _secondName.clear();
    _firtLastName.clear();
    _secondLastName.clear();
    _ageUser.clear();
    _phoneNumber.clear();
    _hasWhatsApp.clear();
    _emailAddress.clear();
    _hasEmailAddressOther.clear();
    _servicesEthernet.clear();
    _typeServicesEthernet.clear();
    _whatServicesEthernet.clear();
    _gender.clear();
    _birthMonth.clear();
    _birthDay.clear();
    _birthYear.clear();
    _placeBorn.clear();
    _whatconsultEthernet.clear();
    _hasDisability.clear();
    _hasDisabilityOther.clear();
    _whatconsultEthernetOther.clear();
    _statusCivil.clear();
    _statusCivilOther.clear();
    _ethhicGroup.clear();
    _ethhicGroupOther.clear();
    _educationalLevel.clear();
    _educationalLevelOther.clear();
    _typeOfTenureOther.clear();
    _obtainerTitle.clear();
    _typeOfTenure.clear();
    _originProperty.clear();
    _originPropertyOther.clear();
    _typePossesion.clear();
    _typePossesionOther.clear();
    _belongAssociation.clear();
    _belongAssociationOther.clear();
    _hasOrganization.clear();
    _hasOrganizationOther.clear();
    _hasOrganizationOtherYes.clear();
    _socialSecurity.clear();
    _socialSecurityOther.clear();
    _typeLabour.clear();
    _typeLabourOther.clear();
    _numberDayFarm.clear();
    _numberDaysMonthFarm.clear();
    _possesionLandType.clear();
    _originPossesionLand.clear();
    _nationalFederation.clear();
    _possesionOverCultivation.clear();
    _interestedFederationYesOrNot.clear();
    _observationFederationYesOrNot.clear();
    _obtainingCertificate.clear();
    _obtainingCertificateOther.clear();
    _nameAndLastNameRelationShip.clear();
    _relationShip.clear();
    _genderRelationShip.clear();
    _monthBrithdayRelationship.clear();
    _dayBrithdayRelationship.clear();
    _yearBrithdayRelationship.clear();
    _educationLevelRelationship.clear();
    _numberDocRelationship.clear();
    _schoolRelationship.clear();
    _department.clear();
    _codeDepartament.clear();
    _municipality.clear();
    _codeMunicipality.clear();
    _place.clear();
    _codePlace.clear();
    _nameProperty.clear();
    _mapUnitDomestic.clear();
    _hectareNumbers.clear();
    _propertyHeight.clear();
    _whoWorkUnitDomectic.clear();
    _externalPeopleWithSeguritySocial.clear();
    _totalAreaCacao.clear();
    _ageCacao.clear();
    _cacaoVariety.clear();
    _forestAreaTotal.clear();
    _rastrojoAreaTotal.clear();
    _glassAreaTotal.clear();
    _cultivesAreaTotal.clear();
    _otherCultives.clear();
    _timberSpecies.clear();
    _timberSpeciesOther.clear();
    _timberTrees.clear();
    _materialsVegetables.clear();
    _associationWithCocoa.clear();
    _associationWithCocoaOther.clear();
    _systemTypeProduct.clear();
    _systemTypeProductOther.clear();
    _latitude = null;
    _longitude = null;
    _accuracy = null;
    _altitude = null;
    _floorSuitability.clear();
    _maintenaceCultive.clear();
    _floorSuitabilityOther.clear();
    _irrigationSystem.clear();
    _performFertilization.clear();
    _typeFertilization.clear();
    _typeFertilizationOther.clear();
    _recolectionCocoa.clear();
    _recolectionCocoaOther.clear();
    _totalCropProduction.clear();
    _benefitsInfrastructure.clear();
    _sellTheGrain.clear();
    _fermentationProcess.clear();
    _fermentationProcessOther.clear();
    _fermentationTime.clear();
    _dryingMethod.clear();
    _whereCocoaIsDried.clear();
    _whereCocoaIsDriedOther.clear();
    _destinationOfTheCocoa.clear();
    _destinationOfTheCocoaOther.clear();
    _nameComercializationCocoa.clear();
    _comercializationMunicipalityCocoa.clear();
    _bpmInTheFarm.clear();
    _workInCultivation.clear();
    _workInCultivationOther.clear();
    _typeRegisterInFarm.clear();
    _storageAreas.clear();
    _storageAreasOther.clear();
    _hidricWaterSource.clear();
    _protectedMargins.clear();
    _waterConcession.clear();
    _waterUse.clear();
    _authorizedLitersOfWater.clear();
    _floorConservationOther.clear();
    _floorConservation.clear();
    _systemRegistrationInFarm.clear();
    _iCACertifiesTheFarms.clear();
    _plannedToDeforest.clear();
    _birdController.clear();
    _mammalsController.clear();
    _reptilesController.clear();
    _ruralPossessorOwner.clear();
    _obsevationRuralPossestion.clear();
    _boundFederationCacaoteros.clear();
    _observationboundFederationCacaoteros.clear();
    _fiveHundredTrees.clear();
    _observationfiveHundredTrees.clear();
    _familyNucleo.clear();
    _observationfamilyNucleo.clear();
    _phoneAndTecnology.clear();
    _observationphoneAndTecnology.clear();
    _ethernetServices.clear();
    _observationethernetServices.clear();

    _uuidiDSurveys = '';
    _signatureProducts = '';
    _signatureTecns = '';
    notifyListeners();
  }

  //*ENVIA LA LISTA DE MIEMBROS*/
  Future<void> sentAddListMembersToFirabase(BuildContext context) async {
    try {
      for (var member in familyMembers) {
        await memberscacaotestingReferences.add({
          'KEY': member.id,
          /*ivide el ID del miembro y seleccionar el primer segmento como 'PARENT_KEY'*/
          'PARENT_KEY': member.id.split('/')[0],
          'p40_nombres_apellidos': member.name,
          'p41_parentesco': member.relationship,
          'p42_genero': member.gender,
          'p43_anio_nacido':
              '${member.birthdayYear}-${member.birthdayMonth}-${member.birthdayDay}',
          'p44_escolaridad_grado': member.educationLevel,
          'p44_escolaridad_institucion': member.school,
          'p45_documento_id': member.documentNumber,
        });
      }

      // Mostrar Snackbar si los datos se enviaron con éxito
      SnackBarGlobalWidget.showSnackBar(context, '¡Datos enviados con éxito!',
          Icons.check_circle_rounded, PaletteColorsTheme.principalColor);

      notifyListeners();
    } catch (error) {
      // Mostrar Snackbar si ocurre un error
      SnackBarGlobalWidget.showSnackBar(context, 'Error $error',
          Icons.error_outline_rounded, PaletteColorsTheme.redErrorColor);
    }
  }
}
