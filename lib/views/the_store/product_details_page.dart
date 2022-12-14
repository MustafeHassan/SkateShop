import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skate_iraq/utils/styles.dart';
import 'package:skate_iraq/utils/utils.dart';
import 'package:skate_iraq/views/home.dart';
import 'package:skate_iraq/views/the_store/cart_page.dart';

import '../../models/product_models.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key, required this.documentSnapshot})
      : super(key: key);
//* هنا غيرت الى Map<String,dynamic> لانه documentSnapshot لست بحاجة ليها
  final QueryDocumentSnapshot<Map<String, dynamic>> documentSnapshot;
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int quantity = 1;
  bool isPressed = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    quantity;
    isPressed;
  }

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      elevation: 0,
      leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          )),
      backgroundColor: const Color(0xffF4F4F4),
      actions: [
        IconButton(
          onPressed: () {
            pushR(context, Home(selectedScreenIndex: 1));
          },
          icon: const ImageIcon(
            AssetImage('assets/shopping.png'),
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
      body: Column(
        children: [
          CachedNetworkImage(
            imageUrl: widget.documentSnapshot['image'],
            height: height * 0.40,
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
          SizedBox(
            height: height * 0.60,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 15.0,
                    spreadRadius: 1.0,
                    offset: Offset(4, 4),
                  ),
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(-4, -4),
                    blurRadius: 15.0,
                    spreadRadius: 1.0,
                  ),
                ],
                color: Colors.grey[300],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return Column(
                    children: [
                      const Expanded(child: SizedBox()),
                      Container(
                        height: constraints.maxHeight * 0.1,
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(widget.documentSnapshot['title'],
                              style: titleStyle),
                        ),
                      ),
                      Container(
                        height: constraints.maxHeight * 0.1,
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('\$ ${widget.documentSnapshot['price']}',
                              style: priceStyle),
                        ),
                      ),
                      Container(
                        height: constraints.maxHeight * 0.4,
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(child: Text('''
${widget.documentSnapshot['description']}
                      ''', overflow: TextOverflow.clip, style: descStyle)),
                        ),
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.15,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      quantity == 1 ? 1 : quantity--;
                                    });
                                  },
                                  icon: const Icon(Icons.remove)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('$quantity'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      quantity < 5 ? quantity++ : quantity;
                                    });
                                  },
                                  icon: const Icon(Icons.add)),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ElevatedButton(
                            onPressed: isPressed
                                ? null
                                : () {
                                    setState(() {
                                      isPressed = true;
                                    });
                                  },
                            style: ElevatedButton.styleFrom(
                                fixedSize: const Size(333, 45),
                                primary: const Color(0xFFff0000),
                                shape: const StadiumBorder()),
                            child: const Text(' Add to Cart'),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
