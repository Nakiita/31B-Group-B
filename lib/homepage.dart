import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Container(
        child: Center(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Center(
              child: Container(
                child: Image.asset('images/Logo.jpg'),
                height: 100,
                width: 400,
              ),
            ),

            //Heading
            Center(
              child: Text(
                'ADD ADDRESS',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
            ),
            SizedBox(height: 20),
            //Address Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Address Title',
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            //Detail Address Direction
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Detail Address Direction',
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),
            //Alternate Phone Number
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Alternate Phone Number',
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),
            //Set as
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Set as Default Address',
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.0),
              child: Switch(
                value: value,
                onChanged: (onChanged) {
                  setState(() {
                    value = onChanged;
                  });
                },
                activeColor: Colors.purple,
                inactiveTrackColor: Colors.red,
                thumbColor: MaterialStateProperty.all(value
                    ? const Color.fromARGB(245, 241, 238, 238)
                    : const Color.fromARGB(245, 51, 4, 143)),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Add'),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
