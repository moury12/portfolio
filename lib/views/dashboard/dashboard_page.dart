import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/info/data.dart';
import 'package:portfolio/info/personal_info.dart';
import 'package:portfolio/utils/assets_constant.dart';
import 'package:portfolio/utils/color_constant.dart';
import 'package:portfolio/utils/global.dart';

import 'widgets/dashboard_banner.dart';
import 'widgets/side_menu_widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Row(
        children: [
          Expanded(
              flex: 2,
              child: Drawer(
                child: SideMenuWidget(),
              )),
          SizedBox(
            width: defaultPadding / 2,
          ),
          Expanded(
              flex: 7,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    DashboardBanner(),
                   GridView.builder(
                     padding: EdgeInsets.all( defaultPadding/2),
                      shrinkWrap: true,
                      // primary: false,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: projects.length,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 250, crossAxisSpacing:defaultPadding/2,mainAxisSpacing: defaultPadding/2 ), itemBuilder: (context, index) => Card(color: Colors.red,child: Text(projects[index]['Name']),),)
                ],
                ),
              ))
        ],
      ),
    );
  }
}

