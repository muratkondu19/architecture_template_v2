import 'package:flutter_test/flutter_test.dart';
import 'package:gen/gen.dart';

void main() {
  test('adds one to input values', () {
    final calculator = Books(
      id: 1,
      name: 'Book 1',
      username: 'Username 1',
      email: 'email1@example.com',
      address: Address(street: 'Street 1', city: 'City 1', zipcode: '12345'),
    );
    expect(calculator.id, 1);
    expect(calculator.name, 'Book 1');
    expect(calculator.username, 'Username 1');
    expect(calculator.email, 'email1@example.com');
    expect(calculator.address?.street, 'Street 1');
    expect(calculator.address?.city, 'City 1');
    expect(calculator.address?.zipcode, '12345');
  });
}
