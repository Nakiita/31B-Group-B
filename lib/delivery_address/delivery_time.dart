


import 'package:flutter/material.dart';

void main() => runApp(Delivertimee());

class Delivertimee extends StatelessWidget {
  const Delivertimee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("Deliver Time"),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  shape: RoundedRectangleBorder(),
                  primary: Theme.of(context).colorScheme.secondary,
                ),
                child: Text("Select"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Choose A Date",style: TextStyle(fontSize: 18,),
            ),
            Container (
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of (context) .showSnackBar(
                        SnackBar (
                          content: Text('Delivery is Today!'),
                          duration: Duration(seconds: 2),
                        ), // SnackBar
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Today',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ), // ElevatedButton
                  SizedBox (width: 10),
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Delivery is Tomorrow!'),
                          duration: Duration(seconds: 2),
                        ), // SnackBar
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Tommorrow',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ), // ElevatedButton
                ],
              ),
            ),

            Text(
              "Choose the Time",style: TextStyle(fontSize: 18,),
            ),


            Container (
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of (context) .showSnackBar(
                        SnackBar (
                          content: Text('Set Time For Faster'),
                          duration: Duration(seconds: 2),
                        ), // SnackBar
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'As Soon As Possible',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ), // ElevatedButton
                  SizedBox (width: 10),
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Delivery Time Set to 8:30pm'),
                          duration: Duration(seconds: 2),
                        ), // SnackBar
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      '8:30pm',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),

                  ), // ElevatedButton
                  SizedBox (width: 10),
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Delivery Time Set to 9:00pm'),
                          duration: Duration(seconds: 2),
                        ), // SnackBar
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      '9:30pm',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),

                  ), // ElevatedButton
                  //
                  // ElevatedButton(
                  //   onPressed: () {
                  //     ScaffoldMessenger.of (context) .showSnackBar(
                  //       SnackBar (
                  //         content: Text('Set Time For 10:00am'),
                  //         duration: Duration(seconds: 2),
                  //       ), // SnackBar
                  //     );
                  //   },
                  //   child: Text('10:00am'),
                  // ), // ElevatedButton
                  // SizedBox (width: 10),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     ScaffoldMessenger.of(context).showSnackBar(
                  //       SnackBar(
                  //         content: Text('Delivery Time Set to 11:30am'),
                  //         duration: Duration(seconds: 2),
                  //       ), // SnackBar
                  //     );
                  //   },
                  //   child: Text('11:30am'),
                  // ), // ElevatedButton
                  // SizedBox (width: 10),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     ScaffoldMessenger.of(context).showSnackBar(
                  //       SnackBar(
                  //         content: Text('Delivery Time Set to 12:00pm'),
                  //         duration: Duration(seconds: 2),
                  //       ), // SnackBar
                  //     );
                  //   },
                  //   child: Text('12:00pm'),
                  // ), // ElevatedButton


                ],
              ),
            ),
            Container (
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of (context) .showSnackBar(
                        SnackBar (
                          content: Text('Set Time For Faster'),
                          duration: Duration(seconds: 2),
                        ), // SnackBar
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'As Soon As Possible',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ), // ElevatedButton
                  SizedBox (width: 10),
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Delivery Time Set to 8:30pm'),
                          duration: Duration(seconds: 2),
                        ), // SnackBar
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      '8:30pm',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),

                  ), // ElevatedButton
                  SizedBox (width: 10),
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Delivery Time Set to 9:00pm'),
                          duration: Duration(seconds: 2),
                        ), // SnackBar
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      '9:30pm',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),

                  ), // ElevatedButton
                  //
                  // ElevatedButton(
                  //   onPressed: () {
                  //     ScaffoldMessenger.of (context) .showSnackBar(
                  //       SnackBar (
                  //         content: Text('Set Time For 10:00am'),
                  //         duration: Duration(seconds: 2),
                  //       ), // SnackBar
                  //     );
                  //   },
                  //   child: Text('10:00am'),
                  // ), // ElevatedButton
                  // SizedBox (width: 10),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     ScaffoldMessenger.of(context).showSnackBar(
                  //       SnackBar(
                  //         content: Text('Delivery Time Set to 11:30am'),
                  //         duration: Duration(seconds: 2),
                  //       ), // SnackBar
                  //     );
                  //   },
                  //   child: Text('11:30am'),
                  // ), // ElevatedButton
                  // SizedBox (width: 10),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     ScaffoldMessenger.of(context).showSnackBar(
                  //       SnackBar(
                  //         content: Text('Delivery Time Set to 12:00pm'),
                  //         duration: Duration(seconds: 2),
                  //       ), // SnackBar
                  //     );
                  //   },
                  //   child: Text('12:00pm'),
                  // ), // ElevatedButton


                ],
              ),
            ),
            Container (
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of (context) .showSnackBar(
                        SnackBar (
                          content: Text('Set Time For Faster'),
                          duration: Duration(seconds: 2),
                        ), // SnackBar
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'As Soon As Possible',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ), // ElevatedButton
                  SizedBox (width: 10),
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Delivery Time Set to 8:30pm'),
                          duration: Duration(seconds: 2),
                        ), // SnackBar
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      '8:30pm',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),

                  ), // ElevatedButton
                  SizedBox (width: 10),
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Delivery Time Set to 9:00pm'),
                          duration: Duration(seconds: 2),
                        ), // SnackBar
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      '9:30pm',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),

                  ), // ElevatedButton
                  //
                  // ElevatedButton(
                  //   onPressed: () {
                  //     ScaffoldMessenger.of (context) .showSnackBar(
                  //       SnackBar (
                  //         content: Text('Set Time For 10:00am'),
                  //         duration: Duration(seconds: 2),
                  //       ), // SnackBar
                  //     );
                  //   },
                  //   child: Text('10:00am'),
                  // ), // ElevatedButton
                  // SizedBox (width: 10),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     ScaffoldMessenger.of(context).showSnackBar(
                  //       SnackBar(
                  //         content: Text('Delivery Time Set to 11:30am'),
                  //         duration: Duration(seconds: 2),
                  //       ), // SnackBar
                  //     );
                  //   },
                  //   child: Text('11:30am'),
                  // ), // ElevatedButton
                  // SizedBox (width: 10),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     ScaffoldMessenger.of(context).showSnackBar(
                  //       SnackBar(
                  //         content: Text('Delivery Time Set to 12:00pm'),
                  //         duration: Duration(seconds: 2),
                  //       ), // SnackBar
                  //     );
                  //   },
                  //   child: Text('12:00pm'),
                  // ), // ElevatedButton


                ],
              ),
            ),





            // extra code


            // Expanded (
            //   child: Container (
            //       margin: const EdgeInsets.only(top: 10, bottom: 10),
            //       child: GridView.builder(
            //           gridDelegate:
            //                 const SliverGridDelegateWithFixedCrossAxisCount(
            //                     crossAxisCount: 3, childAspectRatio: 2.5), // Slive
            // itemCount: DeliveryTime.deliveryTimes. length,
            // itemBuilder: (context, index) {
            //   return Card(
            //     child: TextButton(
            //       onPressed: () {},
            //       child: Text(
            //           ‘${DeliveryTime.deliveryTimes[index] .value}',
            //           style: Theme.of(context).textTheme.headline6),
            //   ), // TextButton
            //   ); // Card
            // },
            // ), // GridView.builder

            // ) // Expanded


          ],
        ),
      ),
    );
  }
}



