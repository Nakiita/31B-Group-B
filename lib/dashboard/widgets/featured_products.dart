import 'package:flutter/material.dart';
// import 'package:31B-Group-B/dashboard/models/products.dart';
// import 'package:31B-Group-B/Code/widgets/title.dart';
import 'package:hunger_cravings/dashboard/widgets/title.dart';

import '../../models/products.dart';
import '../screens/detail_screens.dart';
import 'commons.dart';

List<Product> productList=[
  Product(name:"Cereals",image:"cereals.jpg",price:5.99, rating:4.2, vendor:"GoodFood", whishList:true),
  Product(name:"Burger",image:"burger.jpg",price:6.99, rating:4.7, vendor:"GoodFood", whishList:true),
  Product(name:"Pizza",image:"pizza.jpg",price:6.00, rating:4.8, vendor:"GoodFood", whishList:true),
  Product(name:"Steak",image:"steak.jpg",price:4.99, rating:4.4, vendor:"GoodFood", whishList:true),
];

class Featured extends StatelessWidget {
  const Featured({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 240,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: productList.length,
          itemBuilder: (_, index) {
            return InkWell(
              onTap: (){
                Navigator.of(context).push(
                  //Replacement
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        DetailScreen( image: productList[index].image.toString(),
                          name: productList[index].name.toString(),
                          price: productList[index].price,),
                  ),
                );
              },
              child: Padding(
                padding: EdgeInsets.fromLTRB(12,14,16,12),
                child: Container(
                  height: 240,
                  width: 220,
                  decoration: BoxDecoration(
                      color: white,
                      boxShadow: [
                        BoxShadow(
                            color: red,
                            offset: Offset(15, 5),
                            blurRadius: 30),
                      ]),
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        "images/${productList[index].image}",
                        height: 140,
                        width: 140,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomText(
                              text: productList[index].name,
                              size: 10,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: grey,
                                        offset: Offset(1, 1),
                                        blurRadius: 4)
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.all(4),
                                child: productList[index].whishList? Icon(
                                  Icons.favorite,
                                  color: red,
                                  size: 18,
                                ):Icon(
                                  Icons.favorite_border,
                                  color: red,
                                  size: 18,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:<Widget> [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: CustomText(
                                  text: productList[index].rating.toString(),
                                  size: 14,
                                ),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Icon(
                                Icons.star,
                                color: red,
                                size: 16,
                              ),
                              Icon(
                                Icons.star,
                                color: red,
                                size: 16,
                              ),
                              Icon(
                                Icons.star,
                                color: red,
                                size: 16,
                              ),
                              Icon(
                                Icons.star,
                                color: red,
                                size: 16,
                              ),
                              Icon(
                                Icons.star,
                                color: grey,
                                size: 16,
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: CustomText(text: "\$${productList[index].price}", size: 15,),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
