import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skate_iraq/views/cart_page.dart';
import 'package:skate_iraq/views/product_details.dart';
import 'package:skate_iraq/views/search_page.dart';

import '../view_models/product_viewmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

String image = 'assets/ad.png';

class _HomePageState extends State<HomePage> {



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor:const Color(0xffF4F4F4),
        elevation: 0,
        leading: IconButton(onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>
                const CartPage()),
          );
        }, icon: const ImageIcon(AssetImage('assets/shopping.png'), color: Colors.black,),),
        title: Image.asset('assets/Logo.png', scale: 1.8,),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>
              const SearchPage()),
            );
          }, icon: const ImageIcon(AssetImage('assets/search.png'), color: Colors.black,),),
        ],
      ),
      backgroundColor: const Color(0xffF4F4F4),
      body: StreamBuilder(
        stream: getData(),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            print(snapshot.data);
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.18,
                    child: PageView.builder(
                        itemCount: 8,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Expanded(
                                child: Image.network(
                                    snapshot.data[index].image, fit: BoxFit.cover,),
                              ),
                            ],
                          );
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text('Skate Boards',
                          style: TextStyle(fontWeight: FontWeight.bold,
                              fontSize: 16),),
                        const Expanded(child: SizedBox()),
                        ElevatedButton(onPressed: () {}, child: const Text(
                            'more'))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.23,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>
                                    ProductDetails(product: snapshot.data[index],)),
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
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceEvenly,
                                    children: [
                                      Image.network(
                                        snapshot.data[index].image,
                                          scale: 12, fit: BoxFit.cover),
                                      Text(snapshot.data[index].title, style: const TextStyle(overflow: TextOverflow.ellipsis),),
                                      Text('${snapshot.data[index].price}\$'),
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
                        const Text('skate roles', style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),),
                        const Expanded(child: SizedBox()),
                        ElevatedButton(onPressed: () {}, child: const Text(
                            'more'))
                      ],
                    ),
                  ),

                  SizedBox(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.23,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>
                                    ProductDetails(product: snapshot.data[index])),
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
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      Image.network(
                                        snapshot.data[index].image,
                                        scale: 12, fit: BoxFit.cover,),
                                      Text(snapshot.data[index].title, style: const TextStyle(overflow: TextOverflow.ellipsis),),
                                      Text('${snapshot.data[index].price}\$', style: const TextStyle(overflow: TextOverflow.ellipsis),),
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
                        const Text('All', style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),),
                        const Expanded(child: SizedBox()),
                        ElevatedButton(onPressed: () {}, child: const Text(
                            'more'))
                      ],
                    ),
                  ),

                  SizedBox(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.23,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>
                                    ProductDetails(product: snapshot.data[index],)),
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
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceEvenly,
                                    children: [
                                      Image.network(
                                          snapshot.data[index].image,
                                          scale: 12, fit: BoxFit.cover),
                                      Text(snapshot.data[index].title, style: const TextStyle(overflow: TextOverflow.ellipsis),),
                                      Text('${snapshot.data[index].price}\$'),
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
          return const Center(child: CircularProgressIndicator());
        }
      ),
    );
  }
}
