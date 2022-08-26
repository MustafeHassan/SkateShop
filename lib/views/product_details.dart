import 'package:flutter/material.dart';

import '../models/product_models.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key, required this.product}) : super(key: key);

  final Products product;
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {

  int quantity = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    quantity;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading:  IconButton(onPressed: (){ Navigator.of(context).pop(); }, icon: const Icon(Icons.arrow_back, color: Colors.black,)),
        backgroundColor: const Color(0xffF4F4F4),
      ),
      backgroundColor: const Color(0xffF4F4F4),
      body: Column(
            children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.23,
                  child: Image.network(widget.product.image)),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                    children:  [
                      Text(widget.product.title),
                      const Expanded(child: SizedBox(),),
                       Text('\$${widget.product.price}'),
                      ],
                    ),
                  ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child:  Text('''
${widget.product.description}
                    ''', overflow: TextOverflow.clip,)),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: IconButton(onPressed: (){
                      setState((){
                        quantity == 1 ? 1 : quantity--;
                      });
                    }, icon: const Icon(Icons.remove) ),
                  ),

                   Text('$quantity'),

                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: IconButton(onPressed: (){
                      setState((){
                        quantity < 5 ? quantity++ : quantity;
                      });
                    }, icon: const Icon(Icons.add) ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.redAccent,
                    backgroundBlendMode: BlendMode.darken,
                    border: Border(),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: ElevatedButton(onPressed: (){}, child: const Icon(Icons.favorite) ),
                      ),

                      const Expanded(child: SizedBox()),

                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: ElevatedButton(onPressed: (){}, child: const Text(' Add to Cart'), ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),

    );
  }
}
