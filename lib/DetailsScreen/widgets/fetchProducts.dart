import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  final String collectionName;

  MyWidget({required this.collectionName});

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection(widget.collectionName)
          .doc(FirebaseAuth.instance.currentUser!.email)
          .collection("items")
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text("Something is wrong"),
          );
        }
        return ListView.builder(
            itemCount: snapshot.data == null ? 0 : snapshot.data!.docs.length,
            itemBuilder: (_, index) {
              DocumentSnapshot _documentSnapshot = snapshot.data!.docs[index];
              return Card(
                elevation: 5,
                child: Column(children: [
                  Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          leading: Image.asset("images/${_documentSnapshot['images']}",
                              width: 150,
                              height: 150,fit: BoxFit.cover),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "\$ ${_documentSnapshot['name']}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red),
                              ),
                              Text(
                                "\$ ${_documentSnapshot['price']}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          "Quantity: ${_documentSnapshot['quantity']}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          _incrementQuantity(index, snapshot);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: _documentSnapshot['quantity'] > 1
                            ? () {
                                _decrementQuantity(index, snapshot);
                              }
                            : null,
                      ),
                      Spacer(),
                      ElevatedButton(onPressed: () {},
                          style: ElevatedButton.styleFrom(elevation: 10,
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0),
                                side: BorderSide(color: Colors.red),
                              ),
                              primary: Color.fromRGBO(214, 0, 27, 1)
                          ),
                          child: Text("Buy Now")),
                    ],
                  ),
                  SizedBox(height: 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        child: Text(
                          "Delete",
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          FirebaseFirestore.instance
                              .collection(widget.collectionName)
                              .doc(FirebaseAuth.instance.currentUser!.email)
                              .collection("items")
                              .doc(_documentSnapshot.id)
                              .delete();
                        },
                        style: ElevatedButton.styleFrom(elevation: 10,
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                              side: BorderSide(color: Colors.red),
                            ),
                            primary: Color.fromRGBO(214, 0, 27, 1)
                        ),
                      ),
                    ],
                  )
                ]),
              );
            });
      },
    );
  }

  void _incrementQuantity(int index, AsyncSnapshot<QuerySnapshot> snapshot) {
    // get the documentSnapshot for this index
    DocumentSnapshot _documentSnapshot = snapshot.data!.docs[index];
    // increment the quantity
    int newQuantity = _documentSnapshot['quantity'] + 1;
    // calculate the new price
    double newPrice = _documentSnapshot['pricePerItem'] * newQuantity;
    // update the quantity and price in the Firestore document
    FirebaseFirestore.instance
        .collection(widget.collectionName)
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection("items")
        .doc(_documentSnapshot.id)
        .update({'quantity': newQuantity, 'price': newPrice});
    setState(() {});
  }

  void _decrementQuantity(int index, AsyncSnapshot<QuerySnapshot> snapshot) {
    // get the documentSnapshot for this index
    DocumentSnapshot _documentSnapshot = snapshot.data!.docs[index];
    // decrement the quantity
    int newQuantity = _documentSnapshot['quantity'] - 1;
    // calculate the new price
    double newPrice = _documentSnapshot['pricePerItem'] * newQuantity;
    // update the quantity and price in the Firestore document
    FirebaseFirestore.instance
        .collection(widget.collectionName)
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection("items")
        .doc(_documentSnapshot.id)
        .update({'quantity': newQuantity, 'price': newPrice});
    setState(() {});
  }
}

// class MyWidget extends StatefulWidget {
//   final String collectionName;
//
//   MyWidget({required this.collectionName});
//
//   @override
//   _MyWidgetState createState() => _MyWidgetState();
// }
//
// class _MyWidgetState extends State<MyWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(8.0),
//       child: StreamBuilder(
//           stream: FirebaseFirestore.instance
//               .collection(widget.collectionName)
//               .doc(FirebaseAuth.instance.currentUser!.email)
//               .collection("items")
//               .snapshots(),
//           builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//             if (snapshot.hasError) {
//               return Center(
//                 child: Text("Something is wrong"),
//               );
//             }
//             return ListView.builder(
//                 itemCount: snapshot.data == null ? 0 : snapshot.data!.docs.length,
//                 itemBuilder: (_, index) {
//                   DocumentSnapshot _documentSnapshot = snapshot.data!.docs[index];
//                   print(_documentSnapshot);
//                   return Card(
//                     elevation: 5,
//                     child: Column(
//                       children: [
//                         ListTile(
//                           leading: Container(
//                             width: 105,
//                             height: 1000,
//                             child: Image.asset(
//                                 "images/${_documentSnapshot['images']}"),
//                           ),
//                           title: Text(
//                             "\$ ${_documentSnapshot['name']}",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold, color: Colors.red),
//                           ),
//                           subtitle: Text(
//                             "\$ ${_documentSnapshot['price']}",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold, color: Colors.red),
//                           ),
//                           trailing: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               GestureDetector(
//                                 child: CircleAvatar(
//                                   child: Icon(Icons.delete),
//                                 ),
//                                 onTap: () {
//                                   FirebaseFirestore.instance
//                                       .collection(widget.collectionName)
//                                       .doc(FirebaseAuth.instance.currentUser!.email)
//                                       .collection("items")
//                                       .doc(_documentSnapshot.id)
//                                       .delete();
//                                 },
//                               ),
//                               SizedBox(height: 10),
//                               Row(
//                                 children: [
//                                   GestureDetector(
//                                     child: CircleAvatar(
//                                       child: Icon(Icons.add),
//                                     ),
//                                     onTap: () {
//                                       FirebaseFirestore.instance
//                                           .collection(widget.collectionName)
//                                           .doc(FirebaseAuth.instance.currentUser!.email)
//                                           .collection("items")
//                                           .doc(_documentSnapshot.id)
//                                           .update({
//                                         "quantity": _documentSnapshot['quantity'] + 1
//                                       });
//                                     },
//                                   ),
//                                 ],
//                               ),
//
//                               SizedBox(height: 10),
//                               GestureDetector(
//                                 child: CircleAvatar(
//                                   child: Icon(Icons.remove),
//                                 ),
//                                 onTap: () {
//                                   if (_documentSnapshot['quantity'] > 0) {
//                                     FirebaseFirestore.instance
//                                         .collection(widget.collectionName)
//                                         .doc(FirebaseAuth
//                                             .instance.currentUser!.email)
//                                         .collection("items")
//                                         .doc(_documentSnapshot.id)
//                                         .update({
//                                       "quantity":
//                                           _documentSnapshot['quantity'] - 1
//                                     });
//                                   }
//                                 },
//                               ),
//                               Text(
//                                 "${_documentSnapshot['quantity']}",
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },);
//             },
//       ),
//     );
//   }
// }
