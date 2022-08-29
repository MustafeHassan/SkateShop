import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

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
        backgroundColor: const Color(0xffF4F4F4),
        elevation: 0,

        title: const Text('Shopping Cart', style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      body: Column(
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
                  child: Card(
                    child: Row(
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Image.network('https://cdn.dribbble.com/users/1194971/screenshots/14327684/media/ed093f2cbc7b81e99006a3a5d83131b7.png?compress=1&resize=768x576&vertical=top', fit: BoxFit.cover,)),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('some shirt'),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('\$ 5990'),
                            ),
                          ],
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
                            IconButton(onPressed: (){}, icon: const Icon(Icons.delete))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
             },
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            decoration: const BoxDecoration(
              color: Colors.redAccent,
              backgroundBlendMode: BlendMode.darken,
              border: Border(),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
           child: Center(
             child: Padding(
               padding: const EdgeInsets.all(12.0),
               child: ElevatedButton(onPressed: (){}, child: const Text(' Check out '), ),
             ),
           ),
          ),
        ],
      ),
    );
  }
}
