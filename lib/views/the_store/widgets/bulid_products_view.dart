import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

import '../../../models/product_models.dart';
import '../../../utils/utils.dart';
import '../product_details_page.dart';

Widget buildProductsView(BuildContext context, DocumentSnapshot product, Widget widget) => InkWell(
  onTap: () {
    push(context, widget);
  },
  child: Card(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CachedNetworkImage(
                  imageUrl: product['image'],
                  height: constraints.maxHeight * 0.60,
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
                SizedBox(height: constraints.maxHeight * 0.02,),
                SizedBox(
                  height: constraints.maxHeight * 0.17,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        product['title'],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 15,
                            fontFamily: 'Tajawal',
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.17,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        '\$ ${product['price']}',
                        maxLines: 1,
                        style: const TextStyle(fontSize: 15,
                            fontFamily: 'Tajawal',
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: constraints.maxHeight * 0.02,),
              ],
            );
          })
  ),
);