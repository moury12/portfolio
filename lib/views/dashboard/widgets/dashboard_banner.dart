import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/utils/assets_constant.dart';
import 'package:portfolio/utils/color_constant.dart';
import 'package:portfolio/utils/global.dart';

class DashboardBanner extends StatelessWidget {
  const DashboardBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 2.5,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              AssetsConstant.backgroundImg,
              fit: BoxFit.cover,
            ),
            Container(
              color: Colors.black.withOpacity(.5),
            ),
            Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome to My Amazing\nArt Space',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: defaultPadding/2,),
                  DefaultTextStyle(
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white),
                      child: Row(
                        children: [
                          RichText(
                              text: TextSpan(text: '', children: [
                                TextSpan(text: '<'),
                                TextSpan(text: 'Flutter', style: Theme.of(context).textTheme.bodySmall!.copyWith(color: primaryColor)),
                                TextSpan(text: '>'),
                              ])),
                          Text('I build '),
                          AnimatedTextKit(isRepeatingAnimation: true, animatedTexts: [
                            TyperAnimatedText("Responsive web/Desktop and mobile app"),
                            TyperAnimatedText("E-commerce Application using rest api and attractive UI"),
                            TyperAnimatedText("Handle complex json Data"),
                            TyperAnimatedText("Chat Application, Ticket booking system, Regular Gaming Application"),
                          ]),
                          RichText(
                              text: TextSpan(text: '', children: [
                                TextSpan(text: '<'),
                                TextSpan(text: 'Flutter', style: Theme.of(context).textTheme.bodySmall!.copyWith(color: primaryColor)),
                                TextSpan(text: '>'),
                              ])),
                        ],
                      )),
                  SizedBox(height: defaultPadding/2,),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(backgroundColor: primaryColor,shadowColor: Colors.white),
                      child: Text(
                        "Download CV",
                        style: Theme.of(context).textTheme.bodyMedium,
                      )),

                ],
              ),
            )
          ],
        ));
  }
}
