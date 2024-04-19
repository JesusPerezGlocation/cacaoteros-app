import 'package:flutter/material.dart';

/*
provider para la encuesta de caracterización de beneficiarios
*/
class BeneficiariesSurveysProvider extends ChangeNotifier {
  //*primera pantalla #1*/
  final TextEditingController _nameUnit = TextEditingController();
  TextEditingController get nameUnit => _nameUnit;

  setNameUnit(String val) {
    _nameUnit.text = val; //nombre de la unidad
    notifyListeners();
  }

  String _uuidiDSurveys = '';
  String get uuidiDSurveys => _uuidiDSurveys;

  setUuidiDSurveys(String id) {
    _uuidiDSurveys = id; //id de la encuesta
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
}
