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
  final _fireStore = FirebaseFirestore.instance;

  //* هنا احدد نوع الفيوجر اللي راجعة
  final Future<QuerySnapshot<Map<String, dynamic>>> categoryFuture =
      FirebaseFirestore.instance.collection('Categories').orderBy('time').get();

  // //*    هنا عرفت متغير proDocs بس ليس فيه قيمة مبدائيا عشان هيك هو late
  late List<QueryDocumentSnapshot<Map<String, dynamic>>> proDocs;

  //* بنستخدم هدا المتغير عندما نريد الرودكتس على حسب الكاتوري المختارة
  List<QueryDocumentSnapshot<Map<String, dynamic>>> productsFilter = [];

  void getAllProductsFromFirestore() async {
//*  getAllProductsFromFirestore() هنا استخدمت  عشان يرجع لي
// * QuerySnapshot<Map<String, dynamic>>
    var productsData =
        await FirebaseFirestore.instance.collection('Products').get();
    proDocs = productsData.docs;
  }

  @override
  void initState() {
    super.initState();
    getAllProductsFromFirestore();
  }

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      backgroundColor: const Color(0xffF4F4F4),
      elevation: 0,
      title: Image.asset(
        'assets/Logo.png',
        scale: 1.8,
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => const SearchPage()),
            // );
          },
          icon: const ImageIcon(
            AssetImage('assets/search.png'),
            color: Colors.black,
          ),
        ),
      ],
    );
    final height = (MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top);
    return Scaffold(
        appBar: appBar,
        backgroundColor: const Color(0xffF4F4F4),
        body: FutureBuilder(
            future: categoryFuture,
            builder: (context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshott) {
              if (snapshott.hasError) {
                return Center(child: Text('Error = ${snapshott.error}'));
              } else if (snapshott.hasData) {
                //
                //* هنا احدد نوع List وهي QueryDocumentSnapshot
                List<QueryDocumentSnapshot<Map<String, dynamic>>> cateDocs =
                    snapshott.data!.docs;

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
                                    imageUrl:
                                        'https://i.etsystatic.com/14738248/r/il/58e17b/3270171365/il_340x270.3270171365_gn95.jpg',
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
                            itemCount: cateDocs.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                    width: MediaQuery.of(context).size.height *
                                        0.2,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedIndex = index;
                                          //*  هنا عم اعمل شرط
                                          //* ادا الكاتكوري name تساوي all
                                          //* اعرض جميع البروتكتس
                                          //* و الا اعرض البرودكتس الخاصة بالكاتكوري
                                          productsFilter = cateDocs[
                                                      selectedIndex]['name'] ==
                                                  'all'
                                              ? proDocs
                                              : proDocs
                                                  .where((element) =>
                                                      element['name'] ==
                                                      cateDocs[selectedIndex]
                                                          ['name'])
                                                  .toList();
                                        });
                                      },
                                      child: Card(
                                        color: selectedIndex == index
                                            ? Colors.red
                                            : Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        child: Center(
                                            child: Text(
                                          cateDocs[index]['name'],
                                          style: TextStyle(
                                            color: selectedIndex == index
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                        )),
                                      ),
                                    )),
                              );
                            }),
                      ),

                      ///////////////////////////////////
                      SizedBox(
                        height: height * 0.01,
                      ),

                      Center(
                          child: GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 1 / 1,
                                      crossAxisSpacing: 4,
                                      mainAxisSpacing: 4),
                              itemCount: productsFilter.length,
                              itemBuilder: (BuildContext context, index) {
                                return buildProductsView(
                                    context,
                                    productsFilter[index],
                                    ProductDetails(
                                      documentSnapshot: productsFilter[index],
                                    ));
                              }))
                    ],
                  ),
                );
              }
              return Center(
                  child: Lottie.asset('assets/loading.json', width: 100));
            }));
  }
}
