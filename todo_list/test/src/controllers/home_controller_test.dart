import 'package:flutter_test/flutter_test.dart';
import 'package:todo_list/src/controllers/home_controller.dart';

main() {
  final controller = HomeController();

  test('Deve mudar status para success', () async {
    await controller.start();
    print(controller.state.value);
  });
}
