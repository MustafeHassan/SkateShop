import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../widgets/reel_side_bar.dart';
import '../widgets/reel_detail.dart';

class SkateReels extends StatefulWidget {
  const SkateReels({Key? key}) : super(key: key);

  @override
  State<SkateReels> createState() => _SkateReelsState();
}

class _SkateReelsState extends State<SkateReels> {

  late VideoPlayerController controller;
  bool isPressed = false;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = VideoPlayerController.asset('assets/projectsEdit.mp4')
    ..addListener(() { })
    ..setLooping(true)
    ..initialize().then((_) => controller.play());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('SkateReels',),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: const ImageIcon(AssetImage('assets/uploadVideo.png'),),),
        ],
      ),
      backgroundColor: const Color(0xffF4F4F4),
      body: PageView.builder(
        scrollDirection: Axis.vertical,
          itemCount: 12,
          itemBuilder: (context, index) {
            return  GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                setState((){
                  isPressed = true;
                  controller.value.isPlaying? controller.pause() : controller.play();
                });

              },
              child: Stack(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: double.infinity,
                        width: double.infinity,
                        child: controller != null ? VideoPlayer(controller) : const Center(child: CircularProgressIndicator())
                    ),
                  ),
                  isPressed == true? buildPlay() : Container(),
                  Container(
                    decoration:  BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.black.withOpacity(0.3), Colors.transparent],
                        begin: const Alignment(0, -0.75),
                        end: const Alignment(0, 0.1),
                      )
                    ),
                  ),
                  Container(
                    decoration:  BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.black.withOpacity(0.3), Colors.transparent],
                          end: const Alignment(0, -0.75),
                          begin: const Alignment(0, 0.1),
                        )
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Flexible(flex: 14,child:  ReelDetail(),
                          ),
                          Flexible(flex: 2,child: ReelSideBar(),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }
  buildPlay() => controller.value.isPlaying 
      ? Container()
      : Container(
      alignment: Alignment.center,
      color: Colors.black26,
      child: const Icon(Icons.play_arrow_outlined, color: Colors.white, size: 60,)
  );
}


