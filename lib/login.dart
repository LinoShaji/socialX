import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:news/HomePage.dart';
import 'package:news/custom.dart';

final TextEditingController nameTextEditingController = TextEditingController();
final TextEditingController emailTextEditingcontroller =
    TextEditingController();
final TextEditingController passwordTextEditingController =
    TextEditingController();
final TextEditingController phoneTextEditingController =
    TextEditingController();

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isLogin = false;
  bool agree = false;
  Color colors = Colors.white; // used for Login Button
  Color colors2 = Color(0xfffe0000); // used for signup Button
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

    Firebase.initializeApp();

    void registerNewUser(BuildContext context) async {
      final User? firebaseUser = (await _firebaseAuth
              .createUserWithEmailAndPassword(
                  email: emailTextEditingcontroller.text,
                  password: passwordTextEditingController.text)
              .catchError((errMsg) {
        Fluttertoast.showToast(msg: "Error:  " + errMsg.toString());
      }))
          .user;

      if (User != null) {
        Map userDataMap = {
          "name": nameTextEditingController.text.trim(),
          "email": emailTextEditingcontroller.text.trim(),
          "phone": phoneTextEditingController.text.trim(),
        };

        // userRef.child(firebaseUser!.uid).set(userDataMap);
        // Fluttertoast.showToast(msg:
        //     "Congratulation, your user account has been created. ",);

        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (_) => HomePage()), (route) => false);
      } else {
        Fluttertoast.showToast(
          msg: "New user account has not been created",
        );
      }
    }

    Future getUser(
        {required String name,
        required String phone,
        required String email}) async {
      final docUser = FirebaseFirestore.instance
          .collection('users')
          .doc(emailTextEditingcontroller.text);
      final json = {
        'name': nameTextEditingController.text,
        'email id': emailTextEditingcontroller.text,
        'phone number': phoneTextEditingController.text
      };
      await docUser.set(json);
    }

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
                ? Column(
                    children: [
                      CustomContainer(
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

                            // Email TextFormField
                            CustomTextField(
                              HelperText: 'johndoe@gmail.com',
                              icon: const Icon(Icons.mail,
                                  color: Color(0xfffe0000)),
                              controller: emailTextEditingcontroller,
                              label: 'Email',
                              isObscure: false,
                            ),

                            // Password TextFormField
                            CustomTextField(
                              HelperText: "Password",
                              icon: Icon(Icons.lock, color: Color(0xfffe0000)),
                              controller: passwordTextEditingController,
                              label: 'Password',
                              isObscure: true,
                            ),

                            // Forgot Password Button
                            Container(
                              margin: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).size.width / 1.6),
                              child: TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "Forgot Password ?",
                                    style: TextStyle(color: Color(0xffff0100)),
                                  )),
                            ),

                            Text("Login With"),

                            // FaceBook and Google login buton
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: Image.asset(
                                        'lib/Assets/Icons/icons8-google-48.png')),
                                IconButton(
                                    onPressed: () {},
                                    icon: Image.asset(
                                        'lib/Assets/Icons/icons8-facebook-48.png'))
                              ],
                            ),

                            TextButton(
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text("Dont have an account ? ",
                                        style: TextStyle(color: Colors.grey)),
                                    Text(
                                      "Register Now",
                                      style:
                                          TextStyle(color: Color(0xffff0100)),
                                    )
                                  ],
                                )),
                          ],
                        ),
                        height: MediaQuery.of(context).size.height / 1.4,
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        margin: const EdgeInsets.only(top: 10),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30)),
                            color: Color(0xffff0100)),
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()));
                            },
                            child: const Text(
                              "LOGIN",
                              style: TextStyle(color: Colors.white),
                            )),
                      )
                    ],
                  )

                //signup page starting
                : CustomContainer(
                    widget: SingleChildScrollView(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  left: 10,
                                  right: MediaQuery.of(context).size.width / 2),
                              alignment: Alignment.topLeft,
                              child: const Text(
                                "Create an \n Account",
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(height: 20),

                            // name TextFormField
                            CustomTextField(
                              HelperText: 'john doe',
                              icon: const Icon(Icons.mail,
                                  color: Color(0xfffe0000)),
                              controller: nameTextEditingController,
                              label: 'Name',
                              isObscure: false,
                            ),

                            // emailTextFormField
                            CustomTextField(
                              HelperText: "johndoe@gmail.com",
                              icon: const Icon(Icons.mail,
                                  color: Color(0xffff0100)),
                              controller: emailTextEditingcontroller,
                              label: "Email",
                              isObscure: false,
                            ),

                            // phoneTextFormFiels
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 20, right: 20, top: 20),
                              child: TextFormField(
                                controller: phoneTextEditingController,
                                decoration: const InputDecoration(
                                  labelText: "Contact Number",
                                  labelStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                  hintText: "98476543210",
                                  suffixIcon: Icon(Icons.phone,
                                      color: Color(0xffff0100)),
                                ),
                              ),
                            ),

                            // Password TextFormField
                            CustomTextField(
                              HelperText: "Password",
                              icon: Icon(Icons.lock, color: Color(0xfffe0000)),
                              controller: passwordTextEditingController,
                              label: 'Password',
                              isObscure: true,
                            ),

                            // Forgot Password Button
                            Container(
                              margin: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).size.width / 1.6),
                              child: TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "Forgot Password ?",
                                    style: TextStyle(color: Color(0xffff0100)),
                                  )),
                            ),

                            //check box and the button to terms and conditions
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                          activeColor: Colors.red,
                                          value: agree,
                                          onChanged: (value) {
                                            setState(() {
                                              agree = value ?? false;
                                            });
                                          }),
                                      Text("I agree with"),
                                      TextButton(
                                          onPressed: () {},
                                          child: const Text(
                                            "term & condition",
                                            style: TextStyle(color: Colors.red),
                                          ))
                                    ],
                                  )
                                ]),
                            TextButton(
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text("Already have an account ? ",
                                        style: TextStyle(color: Colors.grey)),
                                    Text(
                                      "Sign In!",
                                      style:
                                          TextStyle(color: Color(0xffff0100)),
                                    )
                                  ],
                                ))
                          ]),
                    ),
                    height: MediaQuery.of(context).size.height / 1.5,
                  ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 8.5,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Color(0xffff0100),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30))),
              child: TextButton(
                  onPressed: () {
                    if (nameTextEditingController.text.isEmpty) {
                      Fluttertoast.showToast(msg: "Enter the name");
                    } else if (!emailTextEditingcontroller.text.contains("@")) {
                    } else if (!emailTextEditingcontroller.text.contains("@")) {
                      Fluttertoast.showToast(msg: "Enter email correctly");
                    } else if (phoneTextEditingController.text.isEmpty) {
                      Fluttertoast.showToast(msg: "Enter the phone number");
                    } else if (passwordTextEditingController.text.length < 6) {
                      Fluttertoast.showToast(
                          msg: "Password must be at least 6 characters");
                    } else {
                      registerNewUser(context);
                      getUser(
                          name: nameTextEditingController.text,
                          phone: phoneTextEditingController.text,
                          email: emailTextEditingcontroller.text);
                    }
                  },
                  child: const Text(
                    "REGISTER",
                    style: TextStyle(color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
