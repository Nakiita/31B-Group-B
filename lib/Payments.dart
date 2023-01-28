import 'package:flutter/material.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KhaltiScope(
        publicKey: 'test_public_key_fdeeb6ede1c3489b9f35f22a0292c440',
        enabledDebugging: false,
        builder: (context, navKey) {
          return MaterialApp(
              home: ePayment(),
              navigatorKey: navKey,
              localizationsDelegates: const [
                KhaltiLocalizations.delegate,
              ]);
        });
  }
}

class ePayment extends StatefulWidget {
  const ePayment({Key? key}) : super(key: key);

  @override
  State<ePayment> createState() => _ePaymentState();
}

class _ePaymentState extends State<ePayment> {
  String referenceId = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Payment"),
        backgroundColor: Colors.deepOrange,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              const Text(
                "Payment Methods",
                style: TextStyle(
                  fontSize: 28,
                  color: Color.fromARGB(255, 92, 15, 163),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                color: Color.fromARGB(255, 92, 15, 163),
                height: 20,
                thickness: 1,
              ),
              SizedBox(
                height: 20,
              ),

              //Image for Khalti
              InkWell(
                splashColor: Colors.grey,
                onTap: () {
                  print("Image Tapped");
                  khaltiWallet();
                }, // Image tapped
                child: Image.asset(
                  'assets/images/khaltilogo.jpg',
                  width: 200,
                ),
              ),

              SizedBox(
                height: 50,
              ),

              //Cash on Delivery
              InkWell(
                splashColor: Colors.grey,
                onTap: () {
                  AlertDialog(
                    title: const Text("Cash on Delivery"),
                    content: const Text("Payment successful"),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("OK"))
                    ],
                  );
                },
                child: Image.asset(
                  'assets/images/th.jpg',
                  width: 200,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Divider(
                color: Color.fromARGB(255, 92, 15, 163),
                height: 20,
                thickness: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }

  khaltiWallet() {
    KhaltiScope.of(context).pay(
      config: PaymentConfig(
          amount: 1000,
          productIdentity: "1",
          productName: "Hunger Cravings",
          mobile: "9827723996"),
      preferences: [
        PaymentPreference.khalti,
        PaymentPreference.connectIPS,
        PaymentPreference.eBanking
      ],
      onSuccess: onSuccess,
      onFailure: onFailure,
      onCancel: onCanceled,
    );
  }

  // mentod to handle success
  void onSuccess(PaymentSuccessModel success) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Success"),
            content: Text("Payment successful"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("OK"),
              ),
            ],
          );
        });
  }

  // method to handle failure
  void onFailure(PaymentFailureModel failure) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Failure"),
            content: Text("Payment failed"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("OK"))
            ],
          );
        });
  }

  // method to handle onCanceled

  void onCanceled() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Canceled"),
            content: Text("Payment canceled"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("OK"))
            ],
          );
        });
  }
}