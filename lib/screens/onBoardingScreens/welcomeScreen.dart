import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paynav_for_all/resources/resources.dart' as resources;
import 'package:paynav_for_all/screens/onBoardingScreens/components/roundedExpandedButton.dart';

class WelcomeScreen extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  WelcomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print("UUID  ${_auth.currentUser?.uid}");
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: resources.medBlueColor,
        leading: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            left: 20,
          ),
          child: Image.asset(
            resources.onBoardingLogo,
            height: 42,
            fit: BoxFit.scaleDown,
          ),
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: resources.medBlueColor,
        ),
      ),
      backgroundColor: const Color(0xff2D2A6A),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: RichText(
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Welcome ',
                      style: TextStyle(fontSize: 27),
                    ),
                    TextSpan(
                      text: ' ${_auth.currentUser?.displayName}!',
                      style: const TextStyle(
                        color: resources.yellowColor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'We are nominated for',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '\“10 Most Promising Fintech Startups 2022\”',
                          style: TextStyle(
                            color: Color(0xff37CFF4),
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Image.asset('images/welcome/startup.png'),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Supported By',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Flexible(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 7,
                          child: Image.asset('images/welcome/startupIndia.png'),
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                        Expanded(
                          flex: 7,
                          child: Image.asset('images/welcome/dstgi.png'),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Powered By',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Image.asset(
                            'images/welcome/payu.png',
                            alignment: Alignment.centerLeft,
                            height: 40,
                          ),
                        ),
                        Expanded(
                          child: Image.asset(
                            'images/welcome/razorpay.png',
                            height: 40,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const RoundedExpandedButton(
              navigateTo: '/permissionAcess',
              buttonText: 'Next',
            ),
          ],
        ),
      ),
    );
  }
}
