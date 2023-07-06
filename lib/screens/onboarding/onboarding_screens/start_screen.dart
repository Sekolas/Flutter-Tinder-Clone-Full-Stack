import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tinder/screens/onboarding/widgets/custom_button.dart';

class Start extends StatelessWidget {
  final TabController tabController;

  const Start({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  height: 200,
                  width: 200,
                  child: SvgPicture.asset('assets/couple.svg'),
                ),
                SizedBox(height: 50),
                Text(
                  'Welcome To SyncSpace',
                  style: Theme.of(context).textTheme.headline2,
                ),
                 SizedBox(height: 20),
                Text(
                  'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.',
                  textAlign: TextAlign.center,
                  style:
                      Theme.of(context).textTheme.headline6!.copyWith(height: 1.8,),
                ),
              ],
            ),
            CustomButton(tabController: tabController, text: 'START',),
          ],
        ));
  }
}
