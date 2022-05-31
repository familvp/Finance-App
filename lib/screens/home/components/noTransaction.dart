import 'package:flutter/material.dart';
import 'package:paynav_for_all/resources/resources.dart' as resources;

class NewUserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 40,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(23)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: const EdgeInsets.only(left: 19.58),
                  child: Opacity(
                    opacity: 0.5,
                    child: const Text(
                      "TODAY",
                      style: const TextStyle(
                        fontSize: 12,
                        height: 1.5,
                        color: resources.blackBlueColor,
                      ),
                    ),
                  ),
                ),

                // Filter Icon
                Padding(
                  padding: const EdgeInsets.only(right: 0),
                  child: IconButton(
                    padding: const EdgeInsets.all(0),
                    icon: const Icon(
                      Icons.filter_list,
                      color: resources.blackBlueColor,
                    ),
                    onPressed: () {
                     
                    },
                  ),
                ),
              ],
            ),
          ),
          // Expanded(
          //   child: WelcomeWidget(),
          // ),
        ],
      ),
      decoration: const BoxDecoration(
        color: resources.blueCream,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(23.0),
        ),
      ),
    );
  }
}