import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/account_page/account_provider/provider.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController p_mail = TextEditingController();
  final TextEditingController p_password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In Page"),
      ),
      body: Center(
        child: Container(
          height: size.height * .455,
          width: size.width * .9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 5)],
          ),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  "Sign In",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: p_mail,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Enter E-mail"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: p_password,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Enter Password"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, 'account_page');
                        },
                        child: const Text("Create Account"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          bool accountFound = false;
                          for (var eaccount
                              in context.read<AccountProvider>().account) {
                            if (eaccount.email == p_mail.text &&
                                eaccount.password == p_password.text) {
                              accountFound = true;
                              Navigator.pushReplacementNamed(
                                context,
                                '/',
                                arguments: eaccount,
                              );
                              setState(() {});
                              break;
                            }
                          }
                          if (!accountFound) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Invalid email or password")),
                            );
                          }
                        },
                        child: const Text("Sign In"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
