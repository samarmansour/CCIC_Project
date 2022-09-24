import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class provider_screan extends StatefulWidget {
  const provider_screan({Key? key}) : super(key: key);

  @override
  State<provider_screan> createState() => _provider_screanState();
}

class _provider_screanState extends State<provider_screan> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Model(),
      child: Scaffold(
          appBar: AppBar(
            title: Center(child: Text('Provider')),
          ),
          body: Consumer<Model>(
            builder: (context, model, child) {
              return Column(
                children: [
                  Text('${model.name}'),
                  SizedBox(height: 10),
                
                     Center(
                       child: ElevatedButton(
                        
                        child: Text('Change Name'),
                        onPressed: ( ) {
                          model.ChangeName();
                        },
                    ),
                     ),
                  
                ],
              );
            },
          )),
    );
  }
}

class Model extends ChangeNotifier {
  String name = "hi";
  ChangeName() {
    name = 'samar';
    notifyListeners();
  }
}

