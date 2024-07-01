import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/color_constant.dart';
import 'package:portfolio/views/dashboard/dashboard_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sadia Bennthe Azad',
      theme: ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        drawerTheme: const DrawerThemeData(backgroundColor: bgColor,shape:LinearBorder() ),
        textTheme: GoogleFonts.actorTextTheme(Theme.of(context).textTheme).apply(bodyColor: textColor).copyWith(
          bodySmall: const TextStyle(color: textAccentColor,fontSize: 10,fontWeight: FontWeight.w500),
          bodyMedium: const TextStyle(color: textColor,fontWeight: FontWeight.bold),
          bodyLarge: const TextStyle(color: textColor,fontWeight: FontWeight.w700,fontSize: 25),
        )
      ),
      home: const DashboardScreen(),
    );
  }
}

