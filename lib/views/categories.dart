import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}


class _CategoriesState extends State<Categories> {
  int? selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F4F4),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: TextFormField(

                  onTap: (){},
                  maxLines: 1,
                  decoration: const InputDecoration(
                    focusColor: Colors.black,
                    //add prefix icon
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    hintText: "Search",
                  ),
                ),
              ),
            ),
          ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.08,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
           itemCount: 3,
           itemBuilder: (context, index) {

           return Padding(
             padding: const EdgeInsets.all(6.0),
             child: SizedBox(
               width: MediaQuery.of(context).size.width * 0.3,
               child: GestureDetector(
                 onTap: (){
                   setState((){
                     selectedIndex=index;
                   });
                 },
                 child: Card(
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(9),
                   ),
                   color: selectedIndex==index?  Colors.red :Colors.white,
                   child: Center(child: Text('SkateBoard', style: TextStyle(color:  selectedIndex==index? Colors.white : Colors.black,),)),
                 ),
               ),
             ),
           );
    }),
        ),
          Expanded(
            child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        leading: const Icon(Icons.skateboarding),
                        onTap: (){},
                        title: const Text('SkateBoards'),
                        trailing: const Icon(Icons.arrow_forward_ios_outlined),
                      ),
                    ),
                  );
                }),
          ),

        ],
      ),
    );
  }
}
