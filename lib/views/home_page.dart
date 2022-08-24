import 'package:cached_network_image/cached_network_image.dart';
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
                        const Text('Skate Boards' ?? "Loading...",
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
                                    ProductDetails(image: snapshot.data[index].image, title: snapshot.data[index].title, description: snapshot.data[index].description, price: snapshot.data[index].price.toString(),)),
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
                                    ProductDetails(image: snapshot.data[index].image, title: snapshot.data[index].title, description: snapshot.data[index].description, price: snapshot.data[index].price.toString(),)),
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
                    height: 1500,
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 150, childAspectRatio: 0.60, crossAxisSpacing: 4, mainAxisSpacing: 4),
                        itemCount: 13,
                        itemBuilder: (BuildContext ctx, index) {
                          return InkWell(
                            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductDetails(image: snapshot.data[index].image, title: snapshot.data[index].title, description: snapshot.data[index].description, price: snapshot.data[index].price.toString(),))),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              color: Colors.white,
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: LayoutBuilder(
                                    builder: (ctx, constraints) {
                                      return Column(
                                        children: [
                                          Builder(
                                              builder: (context) {
                                                return CachedNetworkImage(
                                                  imageUrl: snapshot.data[index].image,
                                                  height: constraints.maxHeight * 0.70,
                                                  fit: BoxFit.fill,
                                                  placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                                                  errorWidget: (context, url, error) {
                                                    debugPrint('error: $error');
                                                    return const Icon(Icons.error_outline);
                                                  },
                                                );
                                              }
                                          ),
                                          SizedBox(height: constraints.maxHeight *0.02,),
                                          SizedBox(
                                            height: constraints.maxHeight *0.10,
                                            child: Center(
                                              child: Text(
                                                snapshot.data[index].title,
                                                maxLines: 1,
                                                style: const TextStyle(fontSize: 15, fontFamily: 'Tajawal', fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: constraints.maxHeight *0.03,),
                                          SizedBox(
                                            height: constraints.maxHeight *0.07,
                                            child: Center(
                                              child: Text(
                                                '\$ ${snapshot.data[index].price}',
                                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: constraints.maxHeight *0.03,)
                                        ],
                                      );
                                    }
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
