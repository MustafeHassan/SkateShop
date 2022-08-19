import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key, required this.image}) : super(key: key);

  final String image;
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {

  int min = 1;
  int max = 5;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    min;
    max;
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
              child: Image.asset(widget.image)),
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                children: const [
                  Text('skateBoard 2002'),
                  Expanded(child: SizedBox(),),
                   Text('\$110'),
                  ],
                ),
              ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: const Text('''
Lorem ipsum dolor sit amet, consectetur adipiscing elit,
sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
Ut enim ad minim veniam, 
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 
Duis aute irure dolor in reprehenderit 
in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident,
sunt in culpa qui officia deserunt mollit anim id est laborum.
                ''', overflow: TextOverflow.clip,)),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: IconButton(onPressed: (){
                  setState((){
                    if(min > 1 && min <= max){
                      setState((){
                        min--;
                      });
                    }
                  });
                }, icon: const Icon(Icons.remove) ),
              ),

               Text('$min'),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: IconButton(onPressed: (){
                  setState((){
                    if(min >= 1 && min <= max){
                      setState((){
                        min++;
                      });
                    }
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
