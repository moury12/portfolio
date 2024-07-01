import 'package:flutter/material.dart';
import 'package:portfolio/info/personal_info.dart';
import 'package:portfolio/utils/assets_constant.dart';
import 'package:portfolio/utils/color_constant.dart';

import 'widgets/side_menu_widget.dart';

class DashboardScreen extends StatelessWidget {

  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Row(children: [
        const Expanded(flex: 2,
            child: Drawer(
              child:
            SideMenuWidget(),)),
        Expanded(
          flex: 7,
            child: Container(color: Colors.red,))
      ],),
    );
  }
}

