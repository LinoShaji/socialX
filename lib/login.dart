import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/custom.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isLogin = false;
  Color colors = Colors.white; // used for Login Button
  Color colors2 = Color(0xfffe0000); // used for signup Button
  @override
  Widget build(BuildContext context) {
    TextEditingController emailTextEditingcontroller = TextEditingController();
    TextEditingController passwordTextEditingController =
        TextEditingController();
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBar(
                backgroundColor: const Color(0xfffe0000),
                title: Text("SocialX")),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(
                      widget: TextButton(
                          onPressed: () {
                            setState(() {
                              isLogin = true;
                              colors = const Color(0xfffe0000);
                              colors2 = Colors.white;
                            });
                          },
                          child: const Text(
                            "LOGIN",
                            style: TextStyle(color: Colors.grey),
                          )),
                      color: colors,
                    ),
                    CustomButton(
                        color: colors2,
                        widget: TextButton(
                            onPressed: () {
                              setState(() {
                                isLogin = false;
                                colors2 = Color(0xfffe0000);
                                colors = Colors.white;
                              });
                            },
                            child: const Text(
                              "SIGN UP",
                              style: TextStyle(color: Colors.grey),
                            )))
                  ]),
            ),
            SizedBox(height: 10),
            isLogin == true
                ? CustomContainer(
                    widget: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                left: 20,
                                right: MediaQuery.of(context).size.width / 2),
                            child: const Text(
                              "SignIn into your \n Account",
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Color(0xfffe0000),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 20),
                          CustomTextField(
                            HelperText: 'johndoe@gmail.com',
                            icon: const Icon(Icons.mail,
                                color: Color(0xfffe0000)),
                            controller: emailTextEditingcontroller,
                            label: 'Email',
                          ),
                          CustomTextField(
                            HelperText: "Password",
                            icon: Icon(Icons.lock, color: Color(0xfffe0000)),
                            controller: passwordTextEditingController,
                            label: 'Password',
                          )
                        ]),
                  )
                : CustomContainer(
                    widget: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                left: 20,
                                right: MediaQuery.of(context).size.width / 2),
                            child: const Text(
                              "SignIn into your \n Account",
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.amber,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 20),
                          CustomTextField(
                            HelperText: 'johndoe@gmail.com',
                            icon: const Icon(Icons.mail,
                                color: Color(0xfffe0000)),
                            controller: emailTextEditingcontroller,
                            label: 'Email',
                          ),
                          CustomTextField(
                            HelperText: "Password",
                            icon: Icon(Icons.lock, color: Color(0xfffe0000)),
                            controller: passwordTextEditingController,
                            label: 'Password',
                          )
                        ]),
                  )
          ],
        ),
      ),
    );
  }
}
