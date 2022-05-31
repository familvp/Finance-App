import 'package:flutter/material.dart';
import 'package:paynav_for_all/resources/resources.dart' as resources;

class RoundedExpandedButton extends StatelessWidget {
  final String navigateTo;
  final String buttonText;
  const RoundedExpandedButton({
    Key? key,
    required this.navigateTo,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(navigateTo);
            },
            child: Text(
              buttonText,
              style: const TextStyle(
                color: resources.blackBlueColor,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            style: ButtonStyle(
              padding:
                  MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 10)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30))),
              backgroundColor: MaterialStateProperty.all(resources.yellowColor),
            ),
          ),
        ),
      ],
    );
  }
}