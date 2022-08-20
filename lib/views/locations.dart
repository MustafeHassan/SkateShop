import 'package:flutter/material.dart';

class Locations extends StatefulWidget {
  const Locations({Key? key}) : super(key: key);

  @override
  State<Locations> createState() => _LocationsState();
}

class _LocationsState extends State<Locations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:const Color(0xffF4F4F4),
        elevation: 0,
        title: const Text('Locations', style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xffF4F4F4),
      body: ListView.builder(
          itemCount: 8,
          itemBuilder: (context, index) {
            return  Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: (){
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.location_on),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Center(child: Text('Baghdad')),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
