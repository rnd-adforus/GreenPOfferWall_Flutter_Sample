import 'dart:io';
import 'package:adforus_greenp_plugin/green_p/greenp_sdk_manager.dart';
import 'package:flutter/material.dart';


void main() async {
  runApp(MaterialApp(home: HomePage()));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GreenpSdkManager greenpSdkManager = GreenpSdkManager();

  @override
  void initState() {
    super.initState();
    initSDK();
  }

  initSDK() async {
    await greenpSdkManager.initGreenpSDK(
      appCode: Platform.isIOS ? "B8PcNMrpS7" : "ZBhFaS5kxE",
      userId: "1234",
      onFailed: (error) {
        print("Initialize Error $error");
      },
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text("${greenpSdkManager.sdkStatus}")),
          TextButton(
            onPressed: () {
              greenpSdkManager.navigateToOfferWall();
            },
            child: Text("Go to Offerwall for test"),
          ),
        ],
      ),
    );
  }
}
