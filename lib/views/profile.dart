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
      body: Column(

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
                  child: Image.network('https://www.jusprofi.at/wp-content/uploads/2020/05/nat%C3%BCrliche-person.jpg', fit: BoxFit.fitHeight,),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(children: const [
                 Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Posts', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('4', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),),
                ),
              ],),
              Column(children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Followers', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('370', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),),
                ),
              ],),
              Column(children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Following', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('213', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),),
                ),
              ],),
            ],
          ),
          Expanded(
            child: Center(child: GridView.builder(
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
                }))
          ),
        ],
      ),
    );
  }
}
