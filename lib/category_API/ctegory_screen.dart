import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:taskes_project/category_API/category_provider.dart';


class Category_screen extends StatefulWidget {
  const Category_screen({Key? key}) : super(key: key);

  @override
  State<Category_screen> createState() => _Category_screenState();
}

class _Category_screenState extends State<Category_screen> {
  
  @override
    void initState() {
     Provider.of<Categoryprovider>(context, listen: false)
           .getAllData();
   
    super.initState();}
    
  Widget build(BuildContext context) {
 
    return
     Consumer<Categoryprovider>(
      builder: (context, category, child){return ListView.builder(
        itemCount:category.category!.data!.data!.length ,
        itemBuilder:((context, index) {

        
        return Container(
         
          height: 150,
          margin: EdgeInsets.symmetric(horizontal: 30,vertical: 25),
           decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey,
                        
                      ),
          child: Column(
            children: [
           
             Expanded
             (child: Image.network(category.category!.data!.data![index].image!,fit: BoxFit.fill,
             width: MediaQuery.of(context).size.width),),
             SizedBox(height:1),
            Text('${category.category!.data!.data![index].name!}.',style: TextStyle(fontSize:20,))
            ],
          ),
        );
         }) );
      } ,
       
     );
  }
}