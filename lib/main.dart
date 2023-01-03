import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localnotification/notifyScreen.dart';

void main()
{
  runApp(
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/' : (context) => NotifyScreen(),
        },
      ),
  );
}