// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:skate_iraq/utils/utils.dart';
//
// import '../../view_models/product_viewmodels.dart';
// import 'product_details_page.dart';
//
//
// class SearchPage extends StatefulWidget {
//   const SearchPage({Key? key}) : super(key: key);
//
//   @override
//   State<SearchPage> createState() => _SearchPageState();
// }
//
// class _SearchPageState extends State<SearchPage> {
//   TextEditingController editingController = TextEditingController();
//
//   final List<String> items = [];
//    String searchString = '';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () => Navigator.of(context).pop(),
//           icon: const Icon(Icons.arrow_back_outlined, color: Colors.black,),
//         ),
//         elevation: 0,
//         backgroundColor: const Color(0xffF4F4F4),
//         title: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: TextField(
//             onChanged: (value) {
//               setState((){
//                 searchString = value;
//               });
//             },
//             controller: editingController,
//             decoration: const InputDecoration(
//                 hintText: "Search",
//                 prefixIcon: Icon(Icons.search),
//             ),
//           ),
//         ),
//       ),
//       backgroundColor: const Color(0xffF4F4F4),
//       body: StreamBuilder(
//           stream: getData(),
//           builder: (context, snapshot) {
//             if(snapshot.hasData) {
//               return Builder(
//                 builder: (context) {
//                   return ListView.builder(
//                       scrollDirection: Axis.vertical,
//                       itemCount: (snapshot.data as List).length,
//                       itemBuilder: (context, int index) {
//                         return (snapshot.data as List)[index].title.contains(searchString)? GestureDetector(
//                           onTap: () {
//                        //     push(context, ProductDetails(documentSnapshot: ,);
//                           },
//                           child: SizedBox(
//                             child: Card(
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                               child: Center(
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     SizedBox(
//
//                                         child: Padding(
//                                           padding: const EdgeInsets.all(8.0),
//                                           child: Text((snapshot.data as List)[index].title, style: const TextStyle(overflow: TextOverflow.ellipsis),),
//                                         )),
//                                     SizedBox(
//
//                                         child: Padding(
//                                           padding: const EdgeInsets.all(8.0),
//                                           child: Text('${(snapshot.data as List)[index].price}\$'),
//                                         )),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ) : Container();
//                       });
//                 }
//               );
//             }
//             return Center(child: Lottie.asset('assets/loading.json', width: 100));
//           }
//       ),
//     );
//   }
// }
