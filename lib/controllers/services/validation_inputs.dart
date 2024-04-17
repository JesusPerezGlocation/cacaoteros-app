//uso: clases para manejar todas las validaciones de la app ,en los inputs
class ValidationInputs { 
  static String _passwords = ''; /*contraseña */ 
 
 /*validación para las contraseñas */
 static String? password(String? value) { 
  if (value == null) return 'Por favor, ingrese una contraseña.'; 
 _passwords = value; if (value.isEmpty) return 'Por favor, ingrese una contraseña.'; 
 if (value.length < 3) return 'Mínimo 3 caracteres'; return null; 
 }
 /*confirmar contraseña */
 static String? confirmPassword(String? value) { 
  if (value == null) return 'El campo contraseña es requerido'; 
  if (value.isEmpty) return 'El campo contraseña es requerido'; 
  if (value != _passwords) return 'Las contraseñas no coinciden';
   return null;
   }
 /*ingresar correo electrónico */ 
 static String? email(String? value) { 
  if (value == null) return 'Por favor, ingrese un correo'; 
  value = value.trim(); if (value.isEmpty) return 'Por favor, ingrese un correo';
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

}