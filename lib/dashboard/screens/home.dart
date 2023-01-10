import 'dart:ui';

import 'package:flutter/material.dart';
// import 'package:31B-Group-B/dashboard/widgets/categories.dart';
// import 'package:31B-Group-B/dashboard/widgets/featured_products.dart';

import '../widgets/categories.dart';
import '../widgets/commons.dart';
import '../widgets/featured_products.dart';
import '../widgets/small_floating_button.dart';
import '../widgets/title.dart';
import 'location_screens.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController pageController = PageController();
  int selectedIndex = 0;
  _onPageChanged(int index) {
    // onTap
    setState(() {
      selectedIndex = index;
    });
  }

  _itemTapped(int selectedIndex) {
    pageController.jumpToPage(selectedIndex);
    setState(() {
      this.selectedIndex = selectedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        body: PageView(controller: pageController, children: [Homepage(), Container(), Container()],) ,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 0,
          currentIndex: selectedIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: TextStyle(color: Colors.blue),
          unselectedLabelStyle: TextStyle(color: Colors.grey),
          type: BottomNavigationBarType.fixed,
          onTap: _itemTapped,
          items: [
            BottomNavigationBarItem(icon: Image.asset("images/home.jpg",width: 26,height: 26,), label: "Dashboard"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "Favorite"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
          ],
        )
      // Container(
      //   color: white,
      //
      //   child:Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: <Widget>[
      //       // FlatButton(
      //       //   onPressed: () {
      //       //     // Perform some action
      //       //   },
      //       //   child: Image.asset("images/home.jpg",width: 26,height: 26,)
      //       // ),
      //       InkWell(
      //         onTap: (){
      //
      //         },
      //         child: Padding(
      //           padding: const EdgeInsets.all(8.0),
      //           child: Image.asset("images/home.jpg",width: 26,height: 26,),
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Image.asset("images/review.jpg",width: 26,height: 26,),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Image.asset("images/shop.jpg",width: 26,height: 26,),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Image.asset("images/you.jpg",width: 26,height: 26,),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Image.asset("images/cart.jpg",width: 26,height: 26,),
      //       ),
      //     ],
      //   ) ,
      // ),
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  "images/logo.jpg",
                  width: 40,
                  height: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomText(text: "Hungry Craving", size: 18),
              ),
              Stack(
                children: <Widget>[
                  IconButton(
                      icon: Icon(
                        Icons.notifications_none,
                      ),
                      onPressed: () {}),
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                          color: red,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: white,
                  boxShadow: [
                    BoxShadow(
                        color: grey, offset: Offset(1, 1), blurRadius: 4),
                  ],
                ),
                child: ListTile(
                  leading: IconButton(
                      icon: Icon(
                        Icons.filter_list,
                        color: Colors.red,
                      ),
                      onPressed: () {}),
                  title: TextField(
                    decoration: InputDecoration(
                        hintText: "Find food and resturants",
                        border: InputBorder.none),
                  ),
                  trailing: Wrap(
                    children: [
                      // IconButton(
                      // icon: Icon(Icons.location_on,color: Colors.red,),
                      //     onPressed: () {}
                      // ),
                      //     ElevatedButton(
                      //         onPressed: () {
                      //           Navigator.of(context).push(//Replacement
                      //             MaterialPageRoute(
                      //               builder: (BuildContext context) => LocationScreen(),
                      //             ),
                      //           );
                      //         },
                      //         child:Icon(
                      //           Icons.location_on,
                      //           color: Colors.black,),
                      //         ),
                      IconButton(
                          icon: Icon(
                            Icons.location_on,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              //Replacement
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    LocationScreen(),
                              ),
                            );
                          }),
                      IconButton(
                          icon: Icon(
                            Icons.search,
                            color: Colors.red,
                          ),
                          onPressed: () {}),
                    ],
                  ),
                ),
              )),
          SizedBox(
            height: 6,
          ),
          Categories(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomText(text: "Featured", size: 20),
          ),
          Featured(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomText(text: "Popular", size: 20),
          ),
          Padding(
            padding: const EdgeInsets.all(2),
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40)),
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          "images/tikka.jpg",
                          scale: 1,
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      // SmallButton(Icons.favorite),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 50,
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 20,
                                ),
                              ),
                              Text("4.5")
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
        ],
      ),
    );
  }
}