import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  int quantity = 1;
  bool isEmpty = true;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    quantity;
  }

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      leading: Container(),
      backgroundColor: const Color(0xffF4F4F4),
      elevation: 0,

      title: const Text('Shopping Cart', style: TextStyle(color: Colors.black),),
      centerTitle: true,
    );

    final height =(MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top);
    return Scaffold(
      backgroundColor: const Color(0xffF4F4F4),
      appBar: appBar,
      body: isEmpty? Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/cartEmpty.json', width: 150),
          const Text('Cart is Empty')
        ],
      )) : Column(
        children: [
          Expanded(
            child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 4,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints constraints) {
                      return Card(
                        child: Row(
                          children: [
                            SizedBox(
                                width: constraints.maxWidth * 0.4,
                                child: Image.network('https://cdn.dribbble.com/users/1194971/screenshots/14327684/media/ed093f2cbc7b81e99006a3a5d83131b7.png?compress=1&resize=768x576&vertical=top', fit: BoxFit.cover,)),
                            SizedBox(
                              width: constraints.maxWidth * 0.4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('some shirt'),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('\$ 5990'),
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: IconButton(onPressed: (){
                                          setState((){
                                            quantity == 1 ? 1 : quantity--;
                                          });
                                        }, icon: const Icon(Icons.remove, size: 18,) ),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Text('$quantity'),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: IconButton(onPressed: (){
                                          setState((){
                                            quantity < 5 ? quantity++ : quantity;
                                          });
                                        }, icon: const Icon(Icons.add, size: 18,) ),
                                      ),

                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                                child: IconButton(onPressed: (){}, icon: const Icon(Icons.delete),
                                ),
                            ),
                          ],
                        ),
                      );
                    }
                  ),
                ),
              );
             },
            ),
          ),
          Container(
            height: height * 0.28,
            decoration: const BoxDecoration(
              boxShadow: [
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
              color: Color(0xffF4F4F4),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.end,
             children: [
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: const [
                     Text('Sub Total:'),
                     Text('\$ 9999999'),
                   ],
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: const [
                     Text('Shipping:'),
                     Text('\$ 2.99'),
                   ],
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: const [
                     Text('Total:'),
                     Text('\$ 10000001.99'),
                   ],
                 ),
               ),
               Center(
                 child: Padding(
                   padding: const EdgeInsets.all(12.0),
                   child: ElevatedButton(onPressed: (){
                     setState(() {

                     });
                   }, style: ElevatedButton.styleFrom(
                       fixedSize: const Size(370, 45), primary: const Color(0xFFff0000), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))), child: const Text(' PROCESS TO CHECK OUT '),
                   ),
                 ),
               ),
             ],
           ),
          ),
        ],
      ),
    );
  }
}
