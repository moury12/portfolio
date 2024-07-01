import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:portfolio/info/data.dart';
import 'package:portfolio/info/personal_info.dart';
import 'package:portfolio/utils/assets_constant.dart';
import 'package:portfolio/utils/color_constant.dart';
import 'package:portfolio/utils/global.dart';

class SideMenuWidget extends StatelessWidget {
  const SideMenuWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const MyInfo(),
        Expanded(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Column(
              children: [
                const AreaWidget(
                  title: 'Residence',
                  value: country,
                ),
                const AreaWidget(
                  title: 'City',
                  value: 'Dhaka',
                ),
                const AreaWidget(
                  title: 'Area',
                  value: 'Mirpur',
                ),
                const Divider(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Skills',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Row(
                      children: List.generate(skill.length, (index) => Expanded(child: AnimatedCircularProgress(percentage: skill[index]['percentage'], label: skill[index]['label']))),
                    ),
                  ],
                ),
                Divider(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Coding',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
SizedBox(height: defaultPadding/2,),
                    ...List.generate(coding.length, (index) => AnimationLinearProgress(percentage: coding[index]['percentage'], label: coding[index]['label'])),

                  ],
                ),
            Divider(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Knowledge',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                 SizedBox(height: defaultPadding/2,),
                ...List.generate(knowledge.length, (index) => KnowledgeWidget(label: knowledge[index]))
              ])
              ],
            ),
          ),
        ))
      ],
    );
  }
}

class KnowledgeWidget extends StatelessWidget {
  final String label;
  const KnowledgeWidget({
    super.key, required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding/2),
      child: Row(
crossAxisAlignment: CrossAxisAlignment.start,
        textBaseline: TextBaseline.ideographic,
        children: [
        Image.asset(AssetsConstant.checkIcon,color: primaryColor,
          height: 15,),
        SizedBox(width: defaultPadding/2,),
        Expanded(
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
      ],),
    );
  }
}

class AnimationLinearProgress extends StatelessWidget {
  final double percentage;
  final String label;
  const AnimationLinearProgress({
    super.key, required this.percentage, required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding/2),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w600),
          ),
          Text(
            "${(percentage*100).toInt().toString()}%",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
        SizedBox(
          height: defaultPadding / 2,
        ),
        TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end:percentage),
            duration: defaultDuration,
            builder: (context, value, child) => LinearProgressIndicator(
              minHeight: 5,
              value: value,
              backgroundColor: primaryAccentColor.withOpacity(0.5),
              color: primaryColor,
              borderRadius: BorderRadius.circular(10),
            ))],),
    );
  }
}

class AnimatedCircularProgress extends StatelessWidget {
  final double percentage;
  final String label;
  const AnimatedCircularProgress({
    super.key,
    required this.percentage,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 4, vertical: defaultPadding / 1.5),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: percentage),
              duration: defaultDuration,
              builder: (context, value, child) => Stack(
                fit: StackFit.expand,
                children: [
                  CircularProgressIndicator(
                    value: value,
                    backgroundColor: primaryAccentColor.withOpacity(0.5),
                    color: primaryColor,
                    strokeWidth: 5,
                  ),
                  Center(
                      child: Text(
                    '${(value * 100).toInt().toString()}%',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold),
                  ))
                ],
              ),
            ),
          ),
          const SizedBox(
            height: defaultPadding / 2,
          ),
          FittedBox(
              fit: BoxFit.fill,
              child: Text(
                label,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w600),
              ))
        ],
      ),
    );
  }
}

class AreaWidget extends StatelessWidget {
  final String title;
  final String value;
  const AreaWidget({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.bodySmall,
          )
        ],
      ),
    );
  }
}

class MyInfo extends StatelessWidget {
  const MyInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        color: drawerHeaderColor,
        child: Column(
          children: [
            const Spacer(
              flex: 2,
            ),
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(AssetsConstant.profileImage),
            ),
            const Spacer(),
            Text(
              name,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              designation,
              style: Theme.of(context).textTheme.bodySmall!,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
