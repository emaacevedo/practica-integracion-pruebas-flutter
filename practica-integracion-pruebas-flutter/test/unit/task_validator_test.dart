import 'package:flutter_test/flutter_test.dart';
import 'package:practica_integracion_pruebas_flutter/utils/task_validator.dart';

void main() {
  test('rechaza título vacío o espacios', () {
    expect(TaskValidator.validateTitle('   '), isNotNull);
    expect(TaskValidator.validateTitle(''), isNotNull);
  });

  test('acepta título válido', () {
    expect(TaskValidator.validateTitle('Comprar víveres'), isNull);
  });

  test('rechaza título de más de 80 caracteres', () {
    expect(TaskValidator.validateTitle('a' * 81), isNotNull);
  });
}
