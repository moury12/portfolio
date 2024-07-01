import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/info/personal_info.dart';
import 'package:portfolio/utils/assets_constant.dart';
import 'package:portfolio/utils/color_constant.dart';
import 'package:portfolio/utils/global.dart';

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
        SizedBox(width: defaultPadding/2,),
        Expanded(
          flex: 7,
            child: Column(
              children: [
                AspectRatio(
            aspectRatio:2.5,
            child: Stack(fit: StackFit.expand,
              children: [
                Image.asset(AssetsConstant.backgroundImg,fit: BoxFit.cover,),
                Container(color: Colors.black.withOpacity(.5),),
                Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,children: [
                  Text('Welcome to My Amazing\nArt Space',style: Theme.of(context).textTheme.bodyLarge,)
                    ],
                  ),
                )
              ],
            ))
              ],
            ))
      ],),
    );
  }
}

