
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:skate_iraq/views/sign_up.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}




final _passwordController = TextEditingController();

class _LoginState extends State<Login> {
  final TextStyle _textstyle =
  const TextStyle(fontFamily: "Tajawal", fontSize: 16);
  Color myColor = const Color(0xffF8FB56);



  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    var appBar = AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.arrow_back_ios_outlined, color: Colors.black,),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar,
      body: SingleChildScrollView(
        child: SizedBox(
          height: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top) * 1,
          width: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top) * 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top) * 0.15,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                  child: Image.asset('assets/Logo.png', scale: 1.3,)
                ),
              ),
              const SizedBox(height: 32,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Container(
                  height: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top) * 0.05,
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Email',
                    style: _textstyle,
                  ),
                ),
              ),
              SizedBox(
                width: 300.0,
                height: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top) * 0.07,
                child: TextFormField(
                  decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  keyboardType: TextInputType.name,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'خطا في ادخال البريد الالكتروني';
                    }
                    return null;
                  },
                  onSaved: (val) {

                  },
                ),
              ),
              SizedBox(height: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top) * 0.03,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Container(
                  height: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top) * 0.05,
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Password',
                    style: _textstyle,
                  ),
                ),
              ),
              SizedBox(
                width: 300.0,
                height: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top) * 0.07,
                child: TextFormField(
                  decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  obscureText: true,
                  controller: _passwordController,
                  validator: (val) {
                    if (val!.isEmpty || val.length < 5) {
                      return 'يجب ان لايقل الرمز عن 5 رموز او احرف او ارقام';
                    }
                    return null;
                  },
                  onSaved: (val) {

                  },
                ),
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top) * 0.04,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Container(
                  height: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top) * 0.05,
                  alignment: Alignment.topLeft,
                  child: RaisedButton(
                    onPressed: (){},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    color: const Color(0xffff0000),
                    textColor: Colors.white70,
                    child: const Text('Sign In'),
                  ),
                ),
              ), // your button beneath text

              SizedBox(
                height: (MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top) * 0.4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    const Text(
                      'You don\'t have an account yet?',
                      style: TextStyle(
                          fontSize: 16, fontFamily: "Tajawal", color: Colors.black),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_context) => const SignUp()));
                        },
                        child: const Text(
                          'Sign Up Now',
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: "Tajawal",
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}