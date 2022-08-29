import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../models/product_models.dart';

Widget buildProductsView(Products product) => InkWell(
  onTap: () {

  },
  child: Card(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: LayoutBuilder(
          builder: (ctx, constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CachedNetworkImage(
                  imageUrl: product.image,
                  height: constraints.maxHeight * 0.60,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Center(child: Lottie.asset('assets/imageLoading.json', width: 150)),
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
                        product.title,
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
                        '\$ ${product.price}',
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