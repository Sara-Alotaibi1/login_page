import 'package:flutter/material.dart';
import 'user.dart'; // Import user model here

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

bool isPasswordVisible= true; // Variable to toggle password visibility

Map<String, User> users = {
  "sara@yahoo.com": User(email: 'sara@yahoo.com', password: 'x8s1'),
  "alotaibi@yahoo.com": User(email: 'alotaibi@yahoo.com', password: '7kds'),
};

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(
          "Login Page",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Image asset for login illustration
            Image.asset(
              'assets/login.png',
              width: 350,
              height: 350,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  // Email input field
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      label: Text('Enter Email'),
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Password input field with visibility toggle
                  TextFormField(
                    controller: passwordController,
                    obscureText: isPasswordVisible,
                    decoration: InputDecoration(
                      label: Text('Enter password'),
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                        icon: Icon(Icons.remove_red_eye),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  // Login button
                  InkWell(
                    onTap: () {
                      // Authentication logic
                      User user = users[emailController.text]!;
                      if (user.email == emailController.text &&
                          user.password == passwordController.text) {
                        print('Logged in successfully');
                      } else {
                        print('Email or password is incorrect');
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.indigo,
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.login,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
