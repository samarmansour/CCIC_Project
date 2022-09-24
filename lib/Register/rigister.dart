
import 'package:flutter/material.dart';
import 'package:taskes_project/bottom_nav.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController mail = TextEditingController();
  TextEditingController Password = TextEditingController();
  TextEditingController Name = TextEditingController();
  TextEditingController Phone = TextEditingController();
  var formkey = GlobalKey<FormState>();
  bool ispass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: ListView(
          children: [
            SizedBox(
              height: 50,
            ),
            Center(
                child: Text(
              'REGISTER',
              style: TextStyle(
                color: Colors.black,
                fontSize: 40,
              ),
            )),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                'Register now to see your products',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                controller: Name,
                decoration: InputDecoration(
                    labelText: 'Name', border: OutlineInputBorder()),
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return ('Name can not be empty');
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                controller: mail,
                decoration: InputDecoration(
                    labelText: 'Email', border: OutlineInputBorder()),
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return ('email can not be empty');
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return ('please enter your password');
                  }
                },
                controller: Password,
                keyboardType: TextInputType.visiblePassword,
                obscureText: ispass,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          ispass = !ispass;
                        });
                      },
                      icon: ispass
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                controller: Phone,
                decoration: InputDecoration(
                    labelText: 'Phone', border: OutlineInputBorder()),
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return ('Phone can not be empty');
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 40, left: 40),
              child:
               ElevatedButton(
                child: Text('Register'),
                onPressed: () {
                  print('mail' + Name.text.toString());
                  print('mail' + mail.text.toString());
                  print('pass' + Password.text.toString());
                  print('pass' + Phone.text.toString());
                  if (formkey.currentState!.validate()) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => bottom_navigation()));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
