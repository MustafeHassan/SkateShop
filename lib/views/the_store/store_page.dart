import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skate_iraq/models/product_models.dart';
import 'package:skate_iraq/views/the_store/product_details_page.dart';
import 'package:lottie/lottie.dart';
import '../../../view_models/product_viewmodels.dart';
import 'search_page.dart';
import 'widgets/bulid_products_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

String image = 'assets/ad.png';

class _HomePageState extends State<HomePage> {



  @override
  Widget build(BuildContext context) {

    AppBar appBar = AppBar(
      backgroundColor:const Color(0xffF4F4F4),
      elevation: 0,
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
    );

    return Scaffold(
      appBar: appBar,
      backgroundColor: const Color(0xffF4F4F4),
      body: StreamBuilder(
        stream: getData(),
        builder: (context, snapshot) {
          final height =(MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top);
          if(snapshot.hasData) {
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
                                placeholder: (context, url) => Center(child: Lottie.asset('assets/imageLoading.json', width: 150)),
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
                      shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (context, index){
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                                width: MediaQuery.of(context).size.height * 0.2,
                                child: const Card(
                                  child: Center(child: Text('T-shirts')),
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
                      itemCount: (snapshot.data as List).length,
                      itemBuilder: (BuildContext ctx, index) {
                        return buildProductsView((snapshot.data as List)[index]);
                      }))

                  ///////////////////////////////////

                ],
              ),
            );
          }
          return Center(child: Lottie.asset('assets/loading.json', width: 100));
        }
      ),
    );
  }
}

