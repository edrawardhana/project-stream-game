import 'package:get/get.dart';
import '../../../models/game_model.dart';

class GameDetailController extends GetxController {
  late GameModel game;

  @override
  void onInit() {
    super.onInit();
    game = Get.arguments;
  }
}
