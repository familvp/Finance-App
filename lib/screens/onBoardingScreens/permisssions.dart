import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paynav_for_all/resources/resources.dart' as resources;
import 'package:paynav_for_all/screens/onBoardingScreens/components/roundedExpandedButton.dart';

class PermissionAcess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: EdgeInsets.only(
            top: 10,
            left: 20,
          ),
          child: Image.asset(
            resources.onBoardingLogo,
            height: 42,
            fit: BoxFit.scaleDown,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: resources.medBlueColor,
        ),
        elevation: 0,
        backgroundColor: resources.medBlueColor,
      ),
      backgroundColor: Color(0xff2D2A6A),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 25),
              child: RichText(
                  text: TextSpan(
                children: [
                  TextSpan(
                    text: 'OK!',
                    style:
                        TextStyle(color: resources.yellowColor, fontSize: 27),
                  ),
                  TextSpan(
                    text: ' we need some access!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              )),
            ),
            Expanded(
              flex: 3,
              child: PermissionTab(
                title: "Location",
                description:
                    "To provide location specific offers, prevent fraudulent activities and display fun facts",
                imagePath: "images/permissions/location.png",
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: Color(0xff5F609D),
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: Image.asset('images/permissions/contacts.png'),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Contacts" + "\n",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text:
                                  "To connect with your friends and family while adding expenses.",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: PermissionTab(
                title: "SMS",
                description:
                    "PayNav organises your bills, subscriptions and other expenses by reading your business messages. Help you invest spare change by rounding off. No personal sms are read.",
                imagePath: "images/permissions/sms.png",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0, left: 20, right: 20),
              child: RoundedExpandedButton(
                navigateTo: "/continue",
                buttonText: "Allow access",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PermissionTab extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  PermissionTab({required this.description, required this.title, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: title + "\n",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: description,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Image.asset(imagePath),
            ),
          ),
        ],
      ),
    );
  }
}

class Triangle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}
