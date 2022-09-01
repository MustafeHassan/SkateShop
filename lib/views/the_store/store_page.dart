import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skate_iraq/views/the_store/product_details_page.dart';
import '../../../view_models/product_viewmodels.dart';
import '../../utils/utils.dart';
import 'search_page.dart';
import 'widgets/bulid_products_view.dart';

class StorePage extends StatefulWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  State<StorePage> createState() => _StorePageState();
}

String image = 'assets/ad.png';

class _StorePageState extends State<StorePage> {
  int selectedIndex = 0;
  var cate;
  var pro;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedIndex;
    cate;
    pro;
  }
  @override
  Widget build(BuildContext context) {

    final _fireStore = FirebaseFirestore.instance;
    AppBar appBar = AppBar(
      backgroundColor:const Color(0xffF4F4F4),
      elevation: 0,
      title: Image.asset('assets/Logo.png', scale: 1.8,),
      centerTitle: true,
      actions: [
        IconButton(onPressed: (){
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => const SearchPage()),
          // );
        }, icon: const ImageIcon(AssetImage('assets/search.png'), color: Colors.black,),),
      ],
    );
    final height = (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top);
    return Scaffold(
      appBar: appBar,
      backgroundColor: const Color(0xffF4F4F4),
      body: StreamBuilder(
          stream: _fireStore.collection('Categories').orderBy('time').snapshots(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) return Center(child: Text('Error = ${snapshot.error}'));
            if (snapshot.hasData) {
              // final docs = streamSnapshot.data!.docs;
              List Categories = [];
              for(var cate in snapshot.data!.docs.reversed) {
                Categories.add(cate);
              }

          return StreamBuilder(
              stream: _fireStore.collection('Products').snapshots(),
              builder: (context, AsyncSnapshot streamSnapshot) {
                if (streamSnapshot.hasError) return Center(child: Text('Error = ${streamSnapshot.error}'));
                if (streamSnapshot.hasData) {
                  // final docs = streamSnapshot.data!.docs;
                  List Products = [];
                  for(var product in streamSnapshot.data!.docs.reversed) {
                    Products.add(product);
                  }
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      ///////////////////////////////////

                      SizedBox(
                        height: height * 0.25,
                        child: PageView.builder(
                            itemCount: 8,
                            itemBuilder: (context, index) {

                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(9),
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl: 'https://i.etsystatic.com/14738248/r/il/58e17b/3270171365/il_340x270.3270171365_gn95.jpg',
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Shimmer.fromColors(
                                        baseColor: Colors.grey.shade50,
                                        highlightColor: Colors.grey.shade300,
                                        child: Container(
                                          color: Colors.grey.shade100,
                                        ),
                                      ),
                                    ),
                                    errorWidget: (context, url, error) {
                                      debugPrint('error: $error');
                                      return const Icon(Icons.error_outline);
                                    },
                                  ),
                                ),
                              );
                            }),
                      ),

                      ///////////////////////////////////

                      SizedBox(
                        height: height * 0.09,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index){
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                    width: MediaQuery.of(context).size.height * 0.2,
                                    child: GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          Categories[index];
                                          selectedIndex=index;
                                        });
                                      },
                                      child: Card(
                                        color: selectedIndex==index?  Colors.red :Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12)
                                        ),
                                        child: Center(child: Text(Categories[index]['name'], style: TextStyle(color:  selectedIndex==index? Colors.white : Colors.black,),)),
                                      ),
                                    )),
                              );
                            }
                        ),
                      ),

                      ///////////////////////////////////

                      SizedBox(
                        height: height * 0.01,
                      ),

                  Center(
                      child: GridView.builder(
                        shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 199, childAspectRatio: 0.90, crossAxisSpacing: 4, mainAxisSpacing: 4),
                      itemCount: streamSnapshot.data!.docs.length,
                      itemBuilder: (BuildContext context, index) {
                        return buildProductsView(context , Products[index], ProductDetails(documentSnapshot: Products[index],));
                      }))
                    ],
                  ),
                );
              }
              return Center(child: Lottie.asset('assets/loading.json', width: 100));
            }
          );
        }
            return Center(child: Lottie.asset('assets/loading.json', width: 100));
     }
      ),
    );
  }
}

