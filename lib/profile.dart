import 'package:flutter/material.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  TextEditingController Password = TextEditingController();
  TextEditingController Name = TextEditingController();
  TextEditingController Phone = TextEditingController();
  var formkey = GlobalKey<FormState>();
  bool ispass = true;

  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        elevation: 0,
        title: Center(child: Text('')),
        
        leading: IconButton(
          icon: Icon(Icons.menu),
          color: Colors.white,
          onPressed: () {
            setState(() {});
          },
        ),
      ),
        backgroundColor: Colors.white,
        body: ListView(children: [
          Container(
            height: 260,
            color: Colors.white,
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 190,
                  color: Colors.blue,
                  child: Center(
                      child: Text(
                    "Choose a cover photo",
                    style: TextStyle(color: Colors.grey.shade300),
                  )),
                ),
                Positioned(
                    top: 140,
                    left: 110,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 208, 204, 204).withOpacity(0.9),
                          shape: BoxShape.circle),
                      child: (Icon(
                        Icons.camera,
                        color: Colors.white,
                      )),
                    )),
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 5),
              child: SingleChildScrollView(
                child: Form(
                  autovalidateMode: AutovalidateMode.always,
                 
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Edit Your Profile:",
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                      SizedBox(height: 15),
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
                    
                    ],
                  ),
                ),
              ))
        ]));
  }
}
