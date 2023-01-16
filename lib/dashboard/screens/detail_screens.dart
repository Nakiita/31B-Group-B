import 'package:flutter/material.dart';

import 'home.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.image, required this.name, required this.price});
  final String image;
  final String name;
  final double price;
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}
class _DetailScreenState extends State<DetailScreen> {
  @override
  int count =1;
  Widget build(BuildContext context) {
    final TextStyle myStyle = TextStyle(
      fontSize: 18,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.black,),
          onPressed: () {
            Navigator.of(context).push(
              //Replacement
              MaterialPageRoute(
                builder: (BuildContext context) =>
                    Home(),
              ),
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications_none,
              color: Colors.black,
            ),
            onPressed: (){},
          ),
        ],
      ),
      body: Container(
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Center(
                  child: Container(
                    width: 350,
                    child: Card(
                      child: Container(
                        padding: EdgeInsets.all(13),
                        child: Container(
                          height: 220,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage("images/${widget.image}"),
                              )
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        height: 100,
                        child: Row(
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                    widget.name,
                                    style: myStyle
                                ),
                                Row(
                                  children: [
                                    Text("\$ ${widget.price.toString()}",style: TextStyle(fontSize: 20),),
                                  ],
                                ),
                                Text(
                                    "Description",
                                    style: myStyle
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 160,
                        child: Wrap(
                          children: <Widget>[
                            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."
                                ,style: myStyle
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40),
                      Text("Quantity",
                        style: TextStyle(
                            fontSize: 18),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        height: 40,
                        width: 150,
                        decoration:BoxDecoration(
                          color: Colors.blue[200],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  if(count>1){
                                    count--;
                                  }
                                });
                              },
                              child: Icon(Icons.remove),
                            ),
                            Text(
                              count.toString(), style:myStyle,),
                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  count++;
                                });
                              },
                              child: Icon(Icons.add),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15,),
                      Container(
                        height: 45,
                        width: double.infinity,
                        child: ElevatedButton(onPressed: (){},
                            style:ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                primary: Colors.purple
                            ),
                            child: Text("Add To Cart",
                              style: myStyle,)),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}