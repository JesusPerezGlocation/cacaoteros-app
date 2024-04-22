//uso: clases para manejar todas las validaciones de la app ,en los inputs
class ValidationInputs {
  static String _passwords = ''; /*contraseña */

  /*validación para las contraseñas */
  static String? password(String? value) {
    if (value == null) return 'Por favor, ingrese una contraseña.';
    _passwords = value;
    if (value.isEmpty) return 'Por favor, ingrese una contraseña.';
    if (value.length < 3) return 'Mínimo 3 caracteres';
    return null;
  }

  /*confirmar contraseña */
  static String? confirmPassword(String? value) {
    if (value == null) return 'El campo contraseña es requerido';
    if (value.isEmpty) return 'El campo contraseña es requerido';
    if (value != _passwords) return 'Las contraseñas no coinciden';
    return null;
  }

  /*ingresar correo electrónico */
  static String? emailValidations(String? value) {
    if (value == null) return 'Por favor, ingrese un correo';
    value = value.trim();
    if (value.isEmpty) return 'Por favor, ingrese un correo';
    if (!value.contains('@')) {
      return 'Ingrese un correo un @';
    }
    return null;
  }

  /*inputs donde el usuario tenga que escribir */
  static String? inputEmpty(String? value) {
    if (value == null) return 'Parece que este campo está vacío.';
    if (value.isEmpty) return 'Parece que este campo está vacío.';
    //if (value.length.i) return 'Mínimo 3 caracteres';
    return null;
  }

  /*para inputs de tipo select */
  static String? inputTypeSelect(String? value) {
    if (value == null) return 'Por favor, seleccione una opción';
    if (value.isEmpty) return 'Por favor, seleccione una opción';
    //if (value.length.i) return 'Mínimo 3 caracteres';
    return null;
  }

/*inputs para fechas*/
  static String? inputDateEmpty(String? value) {
    if (value == null) return '**';
    if (value.isEmpty) return '**';
    //if (value.length.i) return 'Mínimo 3 caracteres';
    return null;
  }

  /*validar día de un mes */
  static String? validateDayOfMonth(String? dayString) {
    if (dayString == null || dayString.isEmpty) {
      return 'Día';
    }
    final int day = int.tryParse(dayString) ?? 0;
    if (day < 1 || day > 31) return 'Día válido';
    return null;
  }

  /*validar mes del año */
  static String? validateMonth(String? monthString) {
    if (monthString == null || monthString.isEmpty) {
      return 'Mes';
    }
    final int month = int.tryParse(monthString) ?? 0;
    if (month < 1 || month > 12) return 'Mes válido';
    return null;
  }

  /*validar año */
  static String? validateYear(String? yearString) {
    if (yearString == null || yearString.isEmpty) {
      return 'Año';
    }
    final int year = int.tryParse(yearString) ?? 0;
    if (year < 1900 || year > 2100) return 'Año válido';
    return null;
  }

  /*valida el número de telefono */
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, ingresa un número de teléfono';
    }
    /* elimina cualquier carácter que no sea un dígito */
    String numericValue = value.replaceAll(RegExp(r'\D'), '');

    /*verifica si el número de teléfono tiene exactamente 10 dígitos */
    if (numericValue.length != 10) {
      return 'El número de teléfono debe tener 10 dígitos';
    }

    /*vi la longitud es correcta, entonces el número de teléfono es válido */
    return null;
  }

  /*validaciión de edad */
  static String? validateAge(String? ageStr) {
    if (ageStr == null || ageStr.isEmpty) {
      return 'Por favor, introduce una edad.';
    }
    /*inntenta convertir el valor de edad a un número entero */
    try {
      int age = int.parse(ageStr);
      /*verifica si la edad está en el rango deseado */
      if (age < 1 || age > 130) {
        return 'La edad debe estar entre 1 y 130 años.';
      }
    } catch (e) {
      /*si la conversión a entero falla, es porque no es un número válido */
      return 'Por favor, introduce un número válido para la edad.';
    }
    /*si todo está bien, devuelve null (indicando que no hay errores) */
    return null;
  }

  /*inputs donde el usuario tenga que escribir */
  static String? validationArea(String? value,
      {String? otherValue, bool isCacao = false}) {
    if (value == null || value.isEmpty) {
      return 'Parece que este campo está vacío.';
    }

    if (isCacao && otherValue != null) {
      // Convertir valores a números
      double areaFinca = double.tryParse(otherValue) ?? 0;
      double areaCacao = double.tryParse(value) ?? 0;

      // Verificar que el área del cacao no sea mayor al área de la finca
      if (areaCacao > areaFinca) {
        return 'El área del cultivo de cacao no puede ser mayor al área de la finca.';
      }

      // Verificar que el área del cacao no sea menor a 5000 m2
      if (areaCacao < 5000) {
        return 'El área del cultivo de cacao no puede ser menor a 5000 m2.';
      }
    }

    return null;
  }
}
