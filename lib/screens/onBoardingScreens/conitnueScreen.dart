import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paynav_for_all/resources/resources.dart' as resources;

import 'blocs_&_cubits/select_one/selectone_bloc.dart';

class ContinueScreen extends StatelessWidget {
  const ContinueScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: resources.medBlueColor,
        leading: Padding(
          padding: const EdgeInsets.only(top: 10, left: 20),
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
      bottomNavigationBar: Container(
        color: const Color(0xff2D2A6A),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Row(
          children: [
            Expanded(
              child: BlocBuilder<SelectoneBloc, String>(
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: state == 'None'
                        ? null
                        : () => Navigator.of(context).pushNamed("/"),
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                        color: resources.blackBlueColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(vertical: 10)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                      backgroundColor: MaterialStateProperty.all(state == 'None'
                          ? resources.lightBrownColor
                          : resources.yellowColor),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
            child: RichText(
              text: const TextSpan(
                style: TextStyle(fontSize: 30),
                children: [
                  TextSpan(text: 'Social '),
                  TextSpan(
                    text: 'split',
                    style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      decorationColor: resources.whiteColor,
                      color: resources.yellowColor,
                    ),
                  ),
                  TextSpan(text: ' payments made easy !'),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20, bottom: 25),
            child: Text(
              'What\u2019s your upcoming payment.',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          _buildCarousel(),
          const Padding(
            padding: EdgeInsets.only(bottom: 10, top: 10, left: 20),
            child: Text(
              'Select One',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          const SelectionGrid()
        ],
      ),
    );
  }

  Container _buildCarousel() {
    return Container(
      color: const Color(0xff1A1243),
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 10, top: 15, bottom: 10),
            child: Text(
              'Planned & Coming Soon',
              style: TextStyle(fontSize: 16),
            ),
          ),
          Expanded(
            child: PageView(
              padEnds: false,
              physics: const BouncingScrollPhysics(),
              controller: PageController(viewportFraction: 0.95),
              children: [
                _buildPageItem(resources.goldWinAndStack),
                _buildPageItem(resources.subscriptionMade),
                _buildPageItem(resources.rentPoolPay),
                _buildPageItem(resources.billPayment)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding _buildPageItem(String source) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Image.asset(source),
    );
  }
}

class SelectionGrid extends StatelessWidget {
  const SelectionGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectoneBloc, String>(
      builder: (context, state) {
        return GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(10),
          crossAxisSpacing: 5,
          mainAxisSpacing: 15,
          crossAxisCount: 3,
          children: resources.selects.entries
              .map((entry) => Column(
                    children: [
                      Expanded(
                        child: Container(
                          child: InkWell(
                            onTap: () {
                              BlocProvider.of<SelectoneBloc>(context).add(
                                  ChangeSelection(newSelection: entry.key));
                            },
                            child: ClipOval(
                              clipBehavior: Clip.hardEdge,
                              child: Image.asset(entry.value),
                            ),
                          ),
                          padding: state == entry.key
                              ? const EdgeInsets.all(3)
                              : null,
                          decoration: BoxDecoration(
                            color: state == entry.key
                                ? resources.yellowColor
                                : null,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      Text(entry.key),
                    ],
                  ))
              .toList(),
        );
      },
    );
  }
}
