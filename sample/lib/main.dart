import 'dart:io';
import 'package:adforus_greenp_plugin/greenp_offer/greenp_manager.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(
    MaterialApp(
      home: HomePage(),
      builder: (context, widget) {
        return widget!;
      },
    ),
  );
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

  //Create The function
  initSDK() async {
    await greenpSdkManager.initializeSdk(
      // appId: Platform.isIOS ? "B8PcNMrpS7" : "ZBhFaS5kxE",
      appId: Platform.isIOS ? "WaFfpYFh1d" : "04tekfmn06",
      userId: "1234",
      onSuccess: () {
        print("Initialize Success");
      },
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
              greenpSdkManager.startOfferWallActivity(
                onLaunch: () {
                  //Successful Launch
                  print("OfferWall Launched");
                },
                onFailed: (String errorMessage) {
                  print("OfferWall Failed $errorMessage");
                },
              );
            },
            child: Text("Go to Offer Wall"),
          ),
        ],
      ),
    );
  }
}
