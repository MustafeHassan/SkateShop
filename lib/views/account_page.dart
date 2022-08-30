import 'package:flutter/material.dart';
import 'package:skate_iraq/utils/styles.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F4F4),
      appBar: AppBar(
        backgroundColor: const Color(0xffF4F4F4),
        elevation: 0,
        title: const Text('Account', style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40,),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text('Settings', style: settingsTitleStyle,),
            ),
        Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            leading: const Icon(Icons.language),
            onTap: (){},
            title: const Text('Language'),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
          ),
        ),
      ),

            const SizedBox(height: 40,),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text('Conect us', style: settingsTitleStyle,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: const Icon(Icons.headphones),
                  onTap: (){},
                  title: const Text('customer service'),
                  trailing: const Icon(Icons.arrow_forward_ios_outlined),
                ),
              ),
            ),

            const SizedBox(height: 20,),

            Center(
              child: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ElevatedButton(onPressed: (){
                    setState(() {

                    });
                  },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(200, 45), primary: const Color(0xFFff0000), shape: const StadiumBorder()), child: const Text(' Sign In ', style: singInTitleStyle,),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
