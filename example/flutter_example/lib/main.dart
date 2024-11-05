import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:omise_dart/omise_dart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Token? token;
  bool loading = false;
// Initialize the Omise API with your public and secret keys
  final omiseApi = OmiseApi(
    publicKey: "pkey", // Replace with your actual public key
    secretKey: "skey", // Replace with your actual secret key
    enableDebug: true, // Enables debug logging
  );

  void updateToken(Token newToken) {
    setState(() {
      token = newToken;
    });
  }

  void setLoading(bool newState) {
    setState(() {
      loading = newState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              token == null
                  ? "Click to generate a token"
                  : "Current token id: ${token!.id}",
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setLoading(true);
          try {
            final token = await omiseApi.tokens.create(CreateTokenRequest(
              name: "Name",
              number: "4242424242424242", // Example test card number
              expirationMonth: "09", // Card expiry month
              expirationYear: "27", // Card expiry year
            ));
            updateToken(token);
          } catch (e) {
            log(e.toString());
          }
          setLoading(false);
        },
        child: loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : const Icon(Icons.generating_tokens),
      ),
    );
  }
}
