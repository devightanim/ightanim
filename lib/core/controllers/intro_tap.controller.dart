import 'package:get/get.dart';

class IntroTabController extends GetxController {
  final RxString backgroundImage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    setBackgroundImage();
  }

  void setBackgroundImage() {
    final currentTime = DateTime.now().hour;
    if (currentTime < 16) {
      backgroundImage.value = 'assets/svg/on_bording.svg';
    } else {
      backgroundImage.value = 'assets/svg/on_bordingdark.svg';
    }
  }
}
