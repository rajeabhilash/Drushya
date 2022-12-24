import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  signIn() {
    if (_emailController.text == 'admin@rajeabhilash.com' && _passwordController.text == 'One@123' ) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar( content: Text('Login Successfull.! Taking to Dashboard.,.')));
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar( content: Text('Login Failed, Please Check Credentials.!')));
    }
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Title Logo
                Icon(Icons.account_balance_sharp,
                    size: 130, color: Colors.deepPurple),
                const SizedBox(height: 90),

                // Greetings
                Text(
                  "Hello Again.!",
                  style: GoogleFonts.exo(
                      fontWeight: FontWeight.bold, fontSize: 35),
                ),
                const SizedBox(height: 8),

                //Slogan Kind of thing
                Text(
                  'Welcome Back, You\'ve been missed!',
                  style: GoogleFonts.exo(fontSize: 20),
                ),
                const SizedBox(height: 70),

                // Email Field
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    controller: _emailController,
                    cursorColor: Colors.deepPurple,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple),
                          borderRadius: BorderRadius.circular(12)),
                      hintText: "Email",
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                // Password Field
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    cursorColor: Colors.deepPurple,
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(12)),
                        border: InputBorder.none,
                        hintText: "Password"),
                  ),
                ),
                const SizedBox(height: 18),

                //Login  button
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: GestureDetector(
                    onTap: signIn,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: Text(
                          "Login",
                          style: GoogleFonts.exo(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Not a member.?"),
                    Text(
                      " Register Now",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
