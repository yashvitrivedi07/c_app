import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/views/account_page/account_provider/provider.dart';
import 'package:flutter_application_1/views/home_page/modal/modal.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController mail = TextEditingController();
  TextEditingController num = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up Page"),
      ),
      body: Center(
        child: Container(
          height: size.height * .7,
          width: size.width * .855,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(color: Colors.grey.shade300, blurRadius: 5)
              ]),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Sign Up",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: firstname,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Enter First Name")),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: lastname,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Enter Last Name")),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: num,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Enter Contact")),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: mail,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Enter Email")),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: pass,
                    obscureText: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Enter Password")),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          firstname.clear();
                          lastname.clear();
                          mail.clear();
                          num.clear();
                          pass.clear();
                        },
                        child: const Text("Cancel"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (firstname.text.isEmpty ||
                              lastname.text.isEmpty ||
                              mail.text.isEmpty ||
                              num.text.isEmpty ||
                              pass.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Please fill all fields")),
                            );
                            return;
                          }
            
                          bool accountExists = context.read<AccountProvider>().doesAccountExist(mail.text);
            
                          if (accountExists) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Account already exists")),
                            );
                          } else {
                            AccountModal modal = AccountModal(
                              email: mail.text,
                              firstName: firstname.text,
                              lastName: lastname.text,
                              number: num.text,
                              password: pass.text,
                            );
            
                            context.read<AccountProvider>().signup(modal);
            
                            Navigator.pushReplacementNamed(context, 'sign_in');
                          }
                        },
                        child: const Text("Sign Up"),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text("Already have an account?"),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'sign_in');
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
