import 'package:get/get.dart';

class ChooseEventController extends GetxController {
  var selectedService = (-1).obs; // Make selectedService an RxInt

  List<String> services = ["Music", "Food", "Vegan", "Festival", "Other"];

  void selectService(int index) {
    if (selectedService.value == index) {
      selectedService.value = -1;
    } else {
      selectedService.value = index;
    }
  }
}
