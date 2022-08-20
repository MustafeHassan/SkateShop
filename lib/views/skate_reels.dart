import 'package:flutter/material.dart';

import '../widgets/reel_side_bar.dart';
import '../widgets/reel_detail.dart';

class SkateReels extends StatefulWidget {
  const SkateReels({Key? key}) : super(key: key);

  @override
  State<SkateReels> createState() => _SkateReelsState();
}

class _SkateReelsState extends State<SkateReels> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage('https://picsum.photos/id/${index + 1047}/800/1080')
                  )
                ),
                child: Stack(
                  children: [
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
                          children: [
                            Flexible(flex: 14,child: Container(
                              color: Colors.pink,
                              height: 100,
                              child: const ReelDetail(),
                            )),
                            const Flexible(flex: 2,child: ReelSideBar(),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
