import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CustomersService extends StatefulWidget {
  const CustomersService({Key? key}) : super(key: key);

  @override
  State<CustomersService> createState() => _CustomersServiceState();
}

class _CustomersServiceState extends State<CustomersService> {
  @override
  Widget build(BuildContext context) {
    final textEditingController = TextEditingController();
    final textEditingControllerTitle = TextEditingController();
    String? title;
    String? messageText;
    final _firestore = FirebaseFirestore.instance;
    return Scaffold(
      backgroundColor: const Color(0xffF4F4F4),
      appBar: AppBar(
        backgroundColor: const Color(0xffF4F4F4),
        elevation: 0,
       leading: const BackButton(color: Colors.black,),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text('Desicrape the Problem', style: TextStyle(fontSize: 18, fontFamily: 'Tajawal', color: Colors.black,)),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    // height: MediaQuery.of(context).size.height * 0.4,
                    child: TextFormField(
                      controller: textEditingControllerTitle,
                      maxLines:1,
                      onChanged: (value) {
                        title = value;
                      },
                      textDirection: TextDirection.ltr,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                        hintTextDirection: TextDirection.ltr,
                        hintText: 'Subject',
                        hintStyle: TextStyle(color: Colors.black),
                        fillColor: Colors.black,
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(18.0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.black, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(18.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.black, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(18.0)),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    // height: MediaQuery.of(context).size.height * 0.4,
                    child: TextFormField(
                      controller: textEditingController,
                      maxLines: 8,
                      onChanged: (value) {
                        messageText = value;
                      },
                      textDirection: TextDirection.ltr,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(

                        hintTextDirection: TextDirection.ltr,
                        hintText: 'comment...',
                        hintStyle: TextStyle(color: Colors.black),
                        fillColor: Colors.black,
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(18.0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.black, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(18.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.black, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(18.0)),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: ElevatedButton(
                      onPressed: (){
                        if(messageText == null){
                          // do nothing
                        }else{
                          textEditingController.clear();
                          _firestore.collection('customersService').add({
                            'subject' : title,
                            'message': messageText,
                            'time': FieldValue.serverTimestamp(),
                          });
                          Navigator.pop(context);
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Colors.black26.withOpacity(0.7),
                                title: const Text('Thank you!', style: TextStyle(fontSize: 18, fontFamily: 'Tajawal', color: Colors.white70,)),
                                content: const Text('Your message has been send', style: TextStyle(fontSize: 18, fontFamily: 'Tajawal', color: Colors.white70,)),
                              );
                            },
                          );
                        }
                      }, style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.black26;
                          }
                          return const Color(0xffff0000);// Use the component's default.
                        },
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: const BorderSide(width: 0.3,color: Colors.white70)
                        ),
                      ),
                    ),
                      child: const Text('Send', style: TextStyle(fontSize: 18, fontFamily: 'Tajawal', color: Colors.white),),),
                  ),
                ),
                const SizedBox(height: 38,),
                Center(
                    child: TextButton(
                      onPressed: (){ Navigator.pop(context);},
                      child: const Text('الرجوع', style: TextStyle(fontSize: 21, fontFamily: 'Tajawal', color: Colors.white70),),
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
