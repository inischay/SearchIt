import 'package:flutter/material.dart';
import 'package:search_engine/pages/auth/signUpPage.dart';
import 'package:search_engine/pages/homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1F1D45),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  "assets/images/search.png",
                  height: 300,
                ),
              ),
              const Text(
                "Login",
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              // const SizedBox(
              //   height: 15,
              // ),
              const Text(
                "Please sign in to continue",
                style: TextStyle(
                    fontSize: 17,
                    color: Color(0xFFA29FAC),
                    fontWeight: FontWeight.bold),
              ),
              // const SizedBox(
              //   height: 30,
              // ),
              Fieldtext(
                name: "Email",
                icon: Icons.email_outlined,
                appearance: false,
              ),
              // const SizedBox(
              //   height: 30,
              // ),
              Fieldtext(
                name: "PASSWORD",
                icon: Icons.lock,
                appearance: true,
              ),
              // const SizedBox(
              //   height: 40,
              // ),
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
                                    builder: (context) => HomePage()));
                          },
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: Colors.transparent),
                          child: const Text("Login",
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Color.fromARGB(255, 15, 14, 55),
                                  fontWeight: FontWeight.w600))),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    RichText(
                        text: const TextSpan(
                            text: "Forgot Password?",
                            style: TextStyle(
                                color: Color(0xFF4cffec),
                                fontSize: 18,
                                fontWeight: FontWeight.bold))),
                    const SizedBox(
                      height: 60,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text("Don't have an account? ",
                            style: TextStyle(
                                color: Color(0xFFA29FAC),
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUpPage()));
                          },
                          child: RichText(
                              text: const TextSpan(
                                  text: "Sign Up",
                                  style: TextStyle(
                                      color: Color(0xFF4cffec),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold))),
                        )
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
  });
  final String name;
  final IconData icon;
  bool appearance;

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
        keyboardType: TextInputType.emailAddress,
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
