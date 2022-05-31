import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paynav_for_all/resources/resources.dart' as resources;

class EnterPayNavScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Widget logo = Padding(
      padding: const EdgeInsets.only(top: 10, left: 20),
      child: Image.asset(
        resources.onBoardingLogo,
        height: 42,
        fit: BoxFit.scaleDown,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: logo,
        elevation: 0,
        backgroundColor: resources.medBlueColor,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: resources.medBlueColor),
      ),
      backgroundColor: resources.medBlueColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 25,
                ),
                Flexible(
                  child: Image.asset(
                    resources.enterPayNavImage1,
                    width: 100,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Flexible(
                  child: Image.asset(
                    resources.enterPayNavImage2,
                    width: 120,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Image.asset(
                    resources.enterPayNavImage3,
                    width: 120,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Flexible(
                  child: Image.asset(
                    resources.enterPayNavImage4,
                    width: 100,
                  ),
                ),
                const SizedBox(
                  width: 25,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            AppFeature(
              title: "Stay Connected:",
              description:
                  "Tag friends  for shared bills, expenses & experiences.",
            ),
            AppFeature(
              title: "Go Solo:",
              description:
                  "Never miss a payment, bill, subscriptions with our ultimate financial calendar. ",
            ),
            AppFeature(
              title: "Stack Gold:",
              description:
                  "Earn gold when you shop + save small amounts daily. (Coming soon) ",
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/loginScreen");
              },
              child: const Text(
                'Enter PayNav',
                style:  TextStyle(
                  color: resources.blackBlueColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 35)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
                backgroundColor:
                    MaterialStateProperty.all(resources.yellowColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 36,
              ),
              child: Text(
                resources.policyAgreement,
                style: const TextStyle(
                  fontSize: 12,
                  height: 15 / 12,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AppFeature extends StatelessWidget {
  final String title;
  final String description;
  AppFeature({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: resources.yellowColor,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            description,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
