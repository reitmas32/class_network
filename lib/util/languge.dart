class Strings {
  Map<String, String> strings;
}

class StringsES extends Strings {
  StringsES() {
    this.strings = {
      //Login
      'UserNameString': 'Nombre de Usuario',
      'Password': 'Contraseña',
      'Login': 'Inicia Sesión',
      'SignIn': 'Registrarse',
      'Remember': 'Recordarme',
      //SignIn
      'Cancel': 'Cancelar',
      'Condition': 'Acepto los Terminos y condiciones',
      'Acept': 'Acepto',
      'Email': 'Correo',
      'IDoNotConditions': 'No acepto las Condiciones',
      'Understand': 'Entiendo',
      'Subjects': 'Materias',
      //Add Subject
      'AddSubject': 'Nueva Materia',
      'Add': 'Agregar',
      'Clear': 'Limpiar',
      'Subject': 'Materia',
      'Teacher': 'Profesor',
      'Delete': 'Eliminar',
    };
  }
}

class StringsEN extends Strings {
  StringsEN() {
    this.strings = {
      //Login
      'UserNameString': 'User Name',
      'Password': 'Password',
      'Login': 'Login',
      'SignIn': 'SignIn',
      'Remember': 'Remember',
      //SignIn
      'Cancel': 'Cancel',
      'Condition': 'I accept the conditions',
      'Acept': 'Acept',
      'Email': 'Email',
      'IDoNotConditions': 'I do not accept the conditions',
      'Understand': 'Understand',
      'Subjects': 'Subjects',
      //Add Subject
      'AddSubject': 'Add Subject',
      'Add': 'Add',
      'Clear': 'Clear',
      'Subject': 'Subject',
      'Teacher': 'Teacher',
      'Delete': 'Delete',
    };
  }
}

class ControllerStrings {
  static Strings dataStrings;
  static String getStringValue(String key) {
    return ControllerStrings.dataStrings.strings[key];
  }

  static void setLanguage(String language) {
    if (language == 'es') {
      ControllerStrings.dataStrings = StringsES();
    }
    if (language == 'en') {
      ControllerStrings.dataStrings = StringsEN();
    }
  }
}
