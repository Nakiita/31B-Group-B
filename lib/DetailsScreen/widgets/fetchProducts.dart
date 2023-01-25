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
                  ListTile(
                    leading:
                    Image.asset("images/${_documentSnapshot['images']}"),
                    title: Text(
                      "\$ ${_documentSnapshot['name']}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                    subtitle: Text(
                      "\$ ${_documentSnapshot['price']}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Quantity: ${_documentSnapshot['quantity']}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                    ],
                  ),
                  SizedBox(height: 5),
                  GestureDetector(
                    child: CircleAvatar(
                      child: Icon(Icons.remove_circle),
                    ),
                    onTap: () {
                      FirebaseFirestore.instance
                          .collection(widget.collectionName)
                          .doc(FirebaseAuth.instance.currentUser!.email)
                          .collection("items")
                          .doc(_documentSnapshot.id)
                          .delete();
                    },
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
