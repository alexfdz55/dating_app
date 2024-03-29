import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/widgets.dart';

class Start extends StatelessWidget {
  final TabController tabController;
  const Start({Key? key, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 200,
                  width: 200,
                  child: SvgPicture.asset('assets/couple.svg'),
                ),
                const SizedBox(height: 50),
                Text('Welcome to Arrow', style: textTheme.headline2),
                const SizedBox(height: 20),
                Text(
                  'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.',
                  style: textTheme.headline6!.copyWith(height: 1.8),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            CustomButton(tabController: tabController),
          ],
        ));
  }
}
