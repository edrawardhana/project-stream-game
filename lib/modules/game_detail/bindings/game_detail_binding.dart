import 'package:get/get.dart';
import '../controllers/game_detail_controller.dart';

class GameDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GameDetailController>(() => GameDetailController());
  }
}
