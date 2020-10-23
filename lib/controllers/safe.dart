import 'package:get/get.dart';
import '../models/safeItem.dart';

class SafeController extends GetxController {
  static SafeController get to => Get.find();

  List<SafeItem> passwords = [];

  push(SafeItem payload) => passwords.add(payload);

  sub(int index) => passwords.removeAt(index);

  reset() => passwords = [];
}
