import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:video_player/video_player.dart';
import 'widgets/reel_side_bar.dart';
import 'widgets/reel_detail.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as path;
import 'package:cloud_firestore/cloud_firestore.dart';


class SkateReels extends StatefulWidget {
  const SkateReels({Key? key}) : super(key: key);

  @override
  State<SkateReels> createState() => _SkateReelsState();
}

class _SkateReelsState extends State<SkateReels> {

  late VideoPlayerController controller;
  bool isPressed = false;
  final _fireStore = FirebaseFirestore.instance;
  List Reels = [];

@override
  void initState() async {
    // TODO: implement initState
  super.initState();
    controller = VideoPlayerController.network(Reels[0]['reel'])
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

  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  File? _photo;
  String? imageUrl;
  bool? isLoading;

  final ImagePicker _picker = ImagePicker();

  Future imgFromGallery() async {
    final pickedFile = await _picker.pickVideo(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path);
        uploadFile();
      } else {
        print('No image selected.');
      }
    });
  }

  Future uploadFile() async {
    if (_photo == null) return;
    final fileName = path.basename(_photo!.path);
    final destination = 'files/$fileName';

    try {
      final ref = firebase_storage.FirebaseStorage.instance
          .ref(destination)
          .child('file/');
      await ref.putFile(_photo!);
      imageUrl = await ref.getDownloadURL();
      print(imageUrl);
      print(_photo!);
    } catch (e) {
      print('error occured');
    }
  }

  final _firestore = FirebaseFirestore.instance;

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
          IconButton(onPressed: (){
            imgFromGallery();
            _firestore.collection('reels').add({
              'title': 'this is a title',
              'reel': imageUrl,
              'time': FieldValue.serverTimestamp(),
            });
            }, icon: const ImageIcon(AssetImage('assets/uploadVideo.png'),),),
        ],
      ),
      backgroundColor: const Color(0xffF4F4F4),
      body: FutureBuilder(
          future: _fireStore.collection('reels').get(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Error = ${snapshot.error}'));
            }
            if (snapshot.hasData) {

              // var docs = snapshot.data.length;

              for (var reel in snapshot.data!.docs) {
                Reels.add(reel);
              }

              return PageView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        setState(() {
                          isPressed = true;
                          controller.value.isPlaying
                              ? controller.pause()
                              : controller.play();
                        });
                      },
                      child: Stack(
                        children: [
                          SizedBox(
                              height: double.infinity,
                              width: double.infinity,
                              child: controller != null ? VideoPlayer(
                                  controller) : const Center(
                                  child: CircularProgressIndicator())
                          ),
                          isPressed == true ? buildPlay() : Container(),
                          Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.black.withOpacity(0.3),
                                    Colors.transparent
                                  ],
                                  begin: const Alignment(0, -0.75),
                                  end: const Alignment(0, 0.1),
                                )
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.black.withOpacity(0.3),
                                    Colors.transparent
                                  ],
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
                                  Flexible(flex: 14, child: ReelDetail(),
                                  ),
                                  Flexible(flex: 2, child: ReelSideBar(),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  });
            }
            return Center(child: Lottie.asset('assets/loading.json', width: 100));
          }
      ),
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


