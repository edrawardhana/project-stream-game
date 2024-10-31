import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/game_detail_controller.dart';

class GameDetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GameDetailController controller = Get.find();

    return Scaffold(
      appBar: AppBar(title: Text(controller.game.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Followers: ${controller.game.followers}'),
            Text('Players: ${controller.game.players}'),
            Text('Streamers: ${controller.game.streamers}'),
          ],
        ),
      ),
    );
  }
}
