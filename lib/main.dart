import 'package:app_suporte_whatsapp/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(DevicePreview(builder: (context) => MyApp(), enabled: false));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Registros Suportes HW',
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF028FCF)),

        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.white, fontSize: 16),
        ),

        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.w600
          ),

          iconTheme: IconThemeData(
            color: Colors.white
          )
        ),

        textSelectionTheme: const TextSelectionThemeData(
          selectionColor: Colors.white24,
          selectionHandleColor: Colors.white24,
          cursorColor: Color(0xFF028FCF),
        ),
      ),
      home: HomePage(),
    );
  }
}
