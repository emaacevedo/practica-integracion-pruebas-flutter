class TaskValidator {
  static String? validateTitle(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'El título es obligatorio';
    }
    if (value.trim().length > 80) {
      return 'Máximo 80 caracteres';
    }
    return null;
  }
}
