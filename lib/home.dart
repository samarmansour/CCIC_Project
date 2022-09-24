
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskes_project/home_Api/home_provider.dart';


class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
     Provider.of<HomeProvider>(context, listen: false)
           .getAllData();
   
    super.initState();
  }
 
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context,homeProv,child){
        return homeProv.data==null?
        Center(
          child: CircularProgressIndicator(color: Colors.blue),
        ):
        Column(
        children: [
   
        AppBar(
        elevation: 0,
        title: Center(child: Text('Products')),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.menu),
          color: Colors.white,
          onPressed: () {
            setState(() {});
          },
        ),
      ),
   
            Expanded(
              child:
             GridView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                   
                  crossAxisCount: 2,
                  childAspectRatio: 0.59,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 3,
                    ),
                itemCount:homeProv.data!.data!.products.length,
                itemBuilder: (context, index) {
                  return homeProv.data!.data!.products.isEmpty?CircularProgressIndicator():
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                             color: Colors.grey,
                blurRadius: 10.0,
                offset: Offset(1.0, 11.0)
                          )
                       ]
                    ),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                             
                                width: MediaQuery.of(context).size.height,
                                height: 110,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image:homeProv.data!.data!.products[index].image == null
                                        ? NetworkImage(
                                            "https://cutz.com.eg/uploads/product_images/default.png")
                                        : NetworkImage(
                                          homeProv.data!.data!.products[index].image.toString()),
                                  ),
                                )),
                            Positioned(
                                right: 10,
                                top: 5,
                                child: Icon(Icons.favorite_border,
                                    color: Colors.blue)),
                            Positioned(
                                left: 10,
                                top: 0,
                                child: Container(
                                  width: 35,
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 33, 92, 140),
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(4),
                                        bottomLeft: Radius.circular(4)),
                                  ),
                                  child: Column(
                                    children: [
                                      Icon(Icons.flash_on,
                                          color: Colors.yellow, size: 21),
                                      Text(
                                       homeProv.data!.data!.products[index].discount == null
                                            ? "0%"
                                            : homeProv.data!.data!.products[index].discount.toString()+"%",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                        
                    
                         Text(
                              homeProv.data!.data!.products[index].name!,
                                 style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                                            ),
                           
                            SizedBox(height: 6),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 24),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                 homeProv.data!.data!.products[index].price==null
                                      ? SizedBox()
                                      : Row(
                                          children: [
                                            Text("EGP",
                                               style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                                            ),
                                           
                                            
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Text("${ homeProv.data!.data!.products[index].price.toString()}",
                                            style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                  Row(
                                    children: [
                                      Text("EGP"),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                     homeProv.data!.data!.products[index].old_price == null
                                            ? ""
                                            :  homeProv.data!.data!.products[index].old_price.toString(),
                                        style: TextStyle(
                                            decoration: TextDecoration.lineThrough,
                                            color: Colors.grey[400]),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Spacer(),
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.blue),
                                child: Icon(Icons.shopping_cart_outlined,
                                    color: Colors.white, size: 20),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ]);
      },
    );
  }
}

 