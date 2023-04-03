import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../dashboard/dashboard_controller.dart';

class YouTubeScreen extends StatefulWidget {
  const YouTubeScreen({
    super.key,
    required this.youtubeKey,
  });

  final String youtubeKey;

  @override
  State<YouTubeScreen> createState() => _YouTubeScreen();
}

class _YouTubeScreen extends State<YouTubeScreen> {
  DashboardController controller = DashboardController();

  late final YoutubePlayerController youtubeController;

  @override
  void initState() {
    youtubeController = YoutubePlayerController(
      initialVideoId: widget.youtubeKey,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        enableCaption: false,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(top: 34, bottom: 34),
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: YoutubePlayerBuilder(
                  onEnterFullScreen: () {
                    SystemChrome.setPreferredOrientations([
                      DeviceOrientation.landscapeRight,
                      DeviceOrientation.landscapeLeft,
                      DeviceOrientation.portraitUp
                    ]);
                  },
                  onExitFullScreen: () {
                    SystemChrome.setPreferredOrientations(
                      [DeviceOrientation.portraitUp],
                    );
                    SystemChrome.setEnabledSystemUIMode(
                      SystemUiMode.manual,
                      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top],
                    );
                  },
                  player: YoutubePlayer(
                    onEnded: (metaData) => Get.back(),
                    showVideoProgressIndicator: false,
                    controller: youtubeController,
                  ),
                  builder: (_, player) => player),
            ),
            Positioned(
              left: 16,
              top: 24,
              child: GestureDetector(
                onTap: () => Get.back(),
                child: Container(
                  padding: const EdgeInsets.only(left: 8),
                  width: 40,
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white54),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    youtubeController.dispose();
    super.dispose();
  }
}
