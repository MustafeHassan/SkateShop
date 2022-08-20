import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F4F4),
      appBar: AppBar(
        backgroundColor: const Color(0xffF4F4F4),
        elevation: 0,
        leading: IconButton(onPressed: (){}, icon: const ImageIcon(AssetImage('assets/slide.png'), color: Colors.black,),),
        title: const Text('Profile', style: TextStyle(color: Colors.black),),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: const ImageIcon(AssetImage('assets/uploadVideo.png'), color: Colors.black,),),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 50.0,
                  child: ClipRRect(
                    clipBehavior: Clip.hardEdge,
                    borderRadius: BorderRadius.circular(100.0),
                    child: Image.network('https://www.jusprofi.at/wp-content/uploads/2020/05/nat%C3%BCrliche-person.jpg',),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(children: const [
                     Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Posts', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('4', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
                    ),
                  ],),
                  Column(children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Followers', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('370', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
                    ),
                  ],),
                  Column(children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Following', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('213', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
                    ),
                  ],),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width * 0.9,
              child: GestureDetector(
                onTap: (){},
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Center(child: Text('Edit Profile', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),)),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: Center(child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate:const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 170, childAspectRatio: 0.65, crossAxisSpacing: 4, mainAxisSpacing: 4),
                  itemCount: 4,
                  itemBuilder: (BuildContext ctx, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: Image.network('https://mfiles.alphacoders.com/805/805921.jpg', fit: BoxFit.fill,),
                    );
                  })),
            ),
          ],
        ),
      ),
    );
  }
}
