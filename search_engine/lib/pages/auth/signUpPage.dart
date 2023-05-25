import 'package:flutter/material.dart';

import '../homepage.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 31, 29, 69),
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 35,
            ),
          )),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Create Account ",
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              // const SizedBox(
              //   height: 15,
              // ),
              const Text(
                "Please fill the input below here",
                style: TextStyle(
                    fontSize: 17,
                    color: Color(0xFFA29FAC),
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Fieldtext(
                name: "FULL NAME",
                icon: Icons.person,
                appearance: false,
                keyboardtype: TextInputType.name,
              ),
              Fieldtext(
                name: "PHONE",
                icon: Icons.phone,
                appearance: false,
                keyboardtype: TextInputType.number,
              ),
              Fieldtext(
                name: "Email",
                icon: Icons.email_outlined,
                appearance: false,
                keyboardtype: TextInputType.emailAddress,
              ),

              // const SizedBox(
              //   height: 30,
              // ),
              Fieldtext(
                name: "PASSWORD",
                icon: Icons.lock,
                appearance: true,
                keyboardtype: TextInputType.none,
              ),
              Fieldtext(
                name: "CONFIRM PASSWORD",
                icon: Icons.lock,
                appearance: true,
                keyboardtype: TextInputType.none,
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 70,
                      width: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color(0xFF4cffec),
                      ),
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()));
                          },
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: Colors.transparent),
                          child: const Text("SIGN UP",
                              style: TextStyle(
                                  fontSize: 23,
                                  color: Color.fromARGB(255, 15, 14, 55),
                                  fontWeight: FontWeight.w600))),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text("Already have an account? ",
                            style: TextStyle(
                                color: Color(0xFFA29FAC),
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                        RichText(
                            text: const TextSpan(
                                text: "Sign In",
                                style: TextStyle(
                                    color: Color(0xFF4cffec),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)))
                      ],
                    )
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

class Fieldtext extends StatelessWidget {
  Fieldtext({
    super.key,
    required this.name,
    required this.icon,
    required this.appearance,
    required this.keyboardtype,
  });
  final String name;
  final IconData icon;
  bool appearance;
  final TextInputType keyboardtype;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 70,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromARGB(255, 140, 138, 242).withOpacity(0.2)),
      child: TextField(
        style: const TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
        obscureText: appearance,
        keyboardType: keyboardtype,
        keyboardAppearance: Brightness.dark,
        decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              size: 30,
              color: Colors.white,
            ),
            labelText: name,
            labelStyle: const TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
            border: InputBorder.none),
      ),
    );
  }
}
