import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skate_iraq/views/product_details.dart';

import '../models/product_models.dart';
import '../view_models/product_viewmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

String image = 'assets/ad.png';

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor:const Color(0xffF4F4F4),
        elevation: 0,
        leading: IconButton(onPressed: (){}, icon: const ImageIcon(AssetImage('assets/shopping.png'), color: Colors.black,),),
        title: Image.asset('assets/Logo.png', scale: 1.8,),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: const ImageIcon(AssetImage('assets/search.png'), color: Colors.black,),),
        ],
      ),
      backgroundColor: const Color(0xffF4F4F4),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          print(snapshot.data);
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.23,
                  child: PageView.builder(
                   itemCount: 3,
                   itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Image.network(snapshot.data[index].image ?? "Loading..."),
                        ],
                      );
                   }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(snapshot.data?[5].title ?? "Loading...", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                      const Expanded(child: SizedBox()),
                      ElevatedButton(onPressed: (){}, child: const Text('more'))
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.23,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                     itemCount: 10,
                      itemBuilder: (context, index) {
                        return  GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ProductDetails(image: image,)),
                            );
                          },
                          child: SizedBox(
                            width: 150,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYBfsHTP0l2ibjRQIgqnDMUMCNnRBPncQVfw&usqp=CAU',scale: 3, fit: BoxFit.cover,),
                                    const Text('skate board'),
                                    const Text('110\$'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text('skate roles', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                      const Expanded(child: SizedBox()),
                      ElevatedButton(onPressed: (){}, child: const Text('more'))
                    ],
                  ),
                ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.23,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return  GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ProductDetails(image: image,)),
                              );
                            },
                            child: SizedBox(
                              width: 150,
                              child: Card(
                                clipBehavior: Clip.hardEdge,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Image.network('https://www.kindpng.com/picc/m/184-1848508_roller-skate-roller-skate-icon-png-transparent-png.png',scale: 12, fit: BoxFit.cover,),
                                      const Text('skate board'),
                                      const Text('110\$'),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            );
        }
      ),
    );
  }
}
