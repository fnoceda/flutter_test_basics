import 'package:flutter_test/flutter_test.dart';
import 'package:initial/app/get/service_locator.dart';

void main() {
  setUp(() {
    ServiceLocator.getInstance.clear();
  });
  group('ServiceLocator > ', () {
    test('put', () {
      expect(() {
        ServiceLocator.getInstance.find<String>();
      }, throwsAssertionError);
      final name = ServiceLocator.getInstance.put<String>('Will');
      expect(name, ServiceLocator.getInstance.find<String>());
    });

    test('put2', () {
      ServiceLocator.getInstance.put<String>('Pato');
      ServiceLocator.getInstance.put<String>('Will', tag: 'name1');
      ServiceLocator.getInstance.put<String>('Santiago', tag: 'name2');
      final name = ServiceLocator.getInstance.find<String>();
      final name1 = ServiceLocator.getInstance.find<String>(tag: 'name1');
      final name2 = ServiceLocator.getInstance.find<String>(tag: 'name2');

      expect(name, 'Pato');
      expect(name1, 'Will');
      expect(name2, 'Santiago');

      final user = ServiceLocator.getInstance.put(User('Luis'));
      expect(ServiceLocator.getInstance.find<User>(), user);
    });
  });
}
