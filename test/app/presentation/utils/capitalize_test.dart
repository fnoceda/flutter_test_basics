import 'package:flutter_test/flutter_test.dart';
import 'package:initial/app/presentation/utils/capitalize.dart';

main() {
  test(
    'Capitalize Test',
    () {
      expect(capitalize('lala'), 'Lala');
      expect(capitalize(' lala'), 'Lala');
      expect(capitalize('A'), 'A');
      expect(capitalize('a'), 'A');
    },
  );
}
