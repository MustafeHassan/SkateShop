import 'package:flutter/material.dart';
import 'package:skate_iraq/views/product_details.dart';
import '../view_models/product_viewmodel.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController editingController = TextEditingController();

  final List<String> items = [];
   String searchString = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffF4F4F4),
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: (value) {
              setState((){
                searchString = value;
              });
            },
            controller: editingController,
            decoration: const InputDecoration(
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
      ),
      backgroundColor: const Color(0xffF4F4F4),
      body: StreamBuilder(
          stream: getData(),
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              return Builder(
                builder: (context) {
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: (snapshot.data as List).length,
                      itemBuilder: (context, int index) {
                        return (snapshot.data as List)[index].title.contains(searchString)? GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>
                                  ProductDetails(product: (snapshot.data as List)[index],)),
                            );
                          },
                          child: SizedBox(
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(

                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text((snapshot.data as List)[index].title, style: const TextStyle(overflow: TextOverflow.ellipsis),),
                                        )),
                                    SizedBox(

                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('${(snapshot.data as List)[index].price}\$'),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ) : Container();
                      });
                }
              );
            }
            return const Center(child: CircularProgressIndicator());
          }
      ),
    );
  }

  // void filterSearchResults(String query) {
  //   List<String> searchList = [];
  //   searchList.addAll(duplicateItems);
  //   if(query.isNotEmpty) {
  //     List<String> listData = [];
  //     for (var item in searchList) {
  //       if(item.contains(query)) {
  //         listData.add(item);
  //       }
  //     }
  //     setState(() {
  //       items.clear();
  //       items.addAll(listData);
  //     });
  //     return;
  //   } else {
  //     setState(() {
  //       items.clear();
  //       const Text('try to search');
  //     });
  //   }
  // }

}
