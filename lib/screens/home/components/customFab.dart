import 'package:flutter/material.dart';
import 'package:paynav_for_all/resources/resources.dart' as resources;
import 'dart:math' as math;

import 'package:paynav_for_all/screens/social/social.dart';

import '../../social/store.dart';

class CustomFab extends StatefulWidget {
  const CustomFab({Key? key}) : super(key: key);

  @override
  _CustomFabState createState() => _CustomFabState();
}

class _CustomFabState extends State<CustomFab>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _translateAnimation;
  late Animation<double> _iconRotation;
  late OverlayState overlayState;
  OverlayEntry? entryforNewTransactionFab;
  OverlayEntry? entryforSocialStoreFab;
  OverlayEntry? entryforScaffold;
  OverlayEntry? entryforRentFab;
  OverlayEntry? entryforBillsFab;
  // Contains the state whether the Custom Fab is Expanded or not
  bool _isExpanded = false;

  // this function will reverse the animation and at the end of it will
  // remove all the overlayEntries presentin the overlayState
  void reverseAnimation() {
    _animationController.reverse().then((value) {
      entryforNewTransactionFab?.remove();
      entryforSocialStoreFab?.remove();
      entryforScaffold?.remove();
      entryforBillsFab?.remove();
      entryforRentFab?.remove();
    });
  }

  // void showNewTransactionCreationBottomSheet() {
  //   showModalBottomSheet(
  //     context: context,
  //     isScrollControlled: true,
  //     backgroundColor: Colors.transparent,
  //     builder: (context) => MultiProvider(
  //       providers: [
  //         ChangeNotifierProvider<NewTransactionState>(
  //           create: (_) => NewTransactionState(),
  //         ),
  //         ChangeNotifierProvider<SendContactsViewModel>(
  //           create: (_) => SendContactsViewModel(context),
  //           // child: CreateTransaction(),
  //         ),
  //       ],
  //       child: CreateTransaction(
  //         whereToShow: UsedWhere.CreateTransaction,
  //         callBackFunction: (String msg) {
  //           ScaffoldMessenger.of(context).showSnackBar(
  //             SnackBar(
  //               behavior: SnackBarBehavior.floating,
  //               backgroundColor: resources.lightYellowColor,
  //               content: Text("$msg"),
  //               duration: Duration(seconds: 1),
  //               margin: EdgeInsets.only(bottom: 15, left: 10, right: 10),
  //             ),
  //           );
  //         },
  //       ),
  //     ),
  //   );
  // }

  void reverseAnimationAndShowBottomSheet() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
    _animationController.reverse().then(
      (value) {
        entryforNewTransactionFab?.remove();
        entryforSocialStoreFab?.remove();
        entryforScaffold?.remove();

        // showNewTransactionCreationBottomSheet();
      },
    );
  }

  // this function will first insert all the overlayEntries and the
  // start the animation in the forward direction
  void forwardAnimation() {
    overlayState.insert(entryforScaffold!);
    overlayState.insert(entryforSocialStoreFab!);
    overlayState.insert(entryforNewTransactionFab!);
    overlayState.insert(entryforBillsFab!);
    overlayState.insert(entryforRentFab!);
    _animationController.forward();
  }

  showAlertBox() {
    reverseAnimation();
    setState(() {
      _isExpanded = !_isExpanded;
    });
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: resources.whiteBlueColor,
        contentPadding:
            const EdgeInsets.only(top: 10, left: 24, right: 24, bottom: 5),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Alert",
              style: TextStyle(color: resources.blackBlueColor),
            ),
            InkWell(
              child: const Icon(
                Icons.close,
                color: resources.blackBlue50Color,
              ),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
        content: const Text(
          "Contacts are needed to create transaction with the friends. You can't proceed further without allowing contacts permission",
          style: TextStyle(color: resources.blackBlueColor),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              // await Permission.contacts.request();
              // if (await Permission.contacts.status.isGranted) {
              //   Navigator.pop(context);
              //   showNewTransactionCreationBottomSheet();
              // } else {
              //   Navigator.pop(context);
              // }
            },
            child: const Text("Ok, I understand."),
          ),
        ],
      ),
    );
  }

  // FAB that will move in the vertical direction
  // i.e. the fab for the new transaction

  Widget fab1() {
    return SizedBox(
      height: 60,
      width: 60,
      child: FittedBox(
        child: FloatingActionButton(
          heroTag: "btn3",
          child: const ImageIcon(
            AssetImage(resources.billsIcon),
            color: Colors.black,
            size: 30,
          ),
          backgroundColor: resources.whiteBlueColor,
          onPressed: ()  {
            reverseAnimation();

            Navigator.push(context, MaterialPageRoute(builder: (context) => const Social(pagenumber: 0,)));}
        ),
      ),
    );
  }

  Widget fab2() {
    return SizedBox(
      height: 60,
      width: 60,
      child: FittedBox(
        child: FloatingActionButton(
          heroTag: "btn3",
          child: const ImageIcon(
            AssetImage(resources.rentIcon),
            color: Colors.black,
            size: 30,
          ),
          backgroundColor: resources.whiteBlueColor,
          onPressed: () {
            reverseAnimation();
            Navigator.push(context, MaterialPageRoute(builder: (context) => const Social(pagenumber: 1,),));}

          
        ),
      ),
    );
  }

  Widget fab3() {
    return SizedBox(
      height: 60,
      width: 60,
      child: FittedBox(
        child: FloatingActionButton(
          heroTag: "btn3",
          child: const ImageIcon(
            AssetImage(resources.createExpenseLogo),
            color: Colors.black,
            size: 30,
          ),
          backgroundColor: resources.lightYellowColor,
          onPressed: () async {
            // state = Provider.of<NewTransactionState>(context, listen: false);
            // await Permission.contacts.request();
            // if (await Permission.contacts.status.isGranted) {
            //   reverseAnimationAndShowBottomSheet();
            // } else {
            //   showAlertBox();
            // }
          },
        ),
      ),
    );
  }

  // Fab that will move in the horizontal Direction
  // i.e. the Fab for the Store purchases
  Widget fab4() {
    return SizedBox(
      height: 60,
      width: 60,
      child: FittedBox(
        child: FloatingActionButton(
          heroTag: "btn4",
          child: const ImageIcon(
            AssetImage(resources.storeIcon),
            color: Colors.black,
            size: 30,
          ),
          backgroundColor: resources.whiteBlueColor,
          onPressed: () {
             reverseAnimation();
            Navigator.push(context, MaterialPageRoute(builder: (context) => const Store(),));
          },
        ),
      ),
    );
  }

  // The Center plus Button
  Widget fab5(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 60,
      child: FittedBox(
        child: FloatingActionButton(
          heroTag: "btn5",
          child: Transform.rotate(
            angle: _iconRotation.value,
            child: const Icon(
              Icons.add,
              color: Colors.black,
            ),
          ),
          backgroundColor: resources.lightYellowColor,
          onPressed: () async {
            showOverlay(context);
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    overlayState = Overlay.of(context)!;
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    )..addListener(() => setState(() {}));

    _iconRotation =
        Tween<double>(begin: 0, end: math.pi / 4).animate(_animationController);

    // for the translation of the FABs in the horizontal and vertical direction
    _translateAnimation = Tween<double>(begin: 0, end: 75)
        .chain(CurveTween(curve: Curves.decelerate))
        .animate(_animationController);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();

    overlayState.dispose();
    entryforNewTransactionFab?.dispose();
    entryforScaffold?.dispose();
    entryforSocialStoreFab?.dispose();
    entryforBillsFab?.dispose();
    entryforRentFab?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return fab5(context);
  }

  showOverlay(context) async {
    final double fullWidth = MediaQuery.of(context).size.width;

    _animationController.addListener(() {
      overlayState.setState(() {});
    });

    if (entryforNewTransactionFab == null ||
        entryforSocialStoreFab == null ||
        entryforScaffold == null) {
      entryforBillsFab = OverlayEntry(
        builder: (context) => Positioned(
          child: Row(
            children: [
              fab1(),
              Visibility(
                visible: _isExpanded,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  color: resources.whiteBlueColor,
                  child: const Text(
                    "Repeat Bills",
                    style: TextStyle(
                      fontFamily: "Mukta",
                      fontWeight: FontWeight.normal,
                      color: resources.blackBlueColor,
                      fontSize: 16,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
          left: fullWidth / 2 - 30,
          bottom: 175 + _translateAnimation.value,
        ),
      );

      entryforRentFab = OverlayEntry(
        builder: (context) => Positioned(
          child: Row(
            children: [
              fab2(),
              Visibility(
                visible: _isExpanded,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  color: resources.whiteBlueColor,
                  child: const Text(
                    "Rent",
                    style: TextStyle(
                      fontFamily: "Mukta",
                      fontWeight: FontWeight.normal,
                      color: resources.blackBlueColor,
                      fontSize: 16,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
          left: fullWidth / 2 - 30,
          bottom: 100 + _translateAnimation.value,
        ),
      );

      entryforNewTransactionFab = OverlayEntry(
        builder: (context) => Positioned(
          child: Row(
            children: [
              fab3(),
              Visibility(
                visible: _isExpanded,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  color: resources.whiteBlueColor,
                  child: const Text(
                    "Create Expense",
                    style: TextStyle(
                      fontFamily: "Mukta",
                      fontWeight: FontWeight.normal,
                      color: resources.blackBlueColor,
                      fontSize: 16,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
          left: fullWidth / 2 - 30,
          bottom: 25 + _translateAnimation.value,
        ),
      );

      entryforSocialStoreFab = OverlayEntry(
          builder: (context) => Positioned(
                child: fab4(),
                bottom: 25,
                left: fullWidth / 2 - 30 - _translateAnimation.value,
              ));

      entryforScaffold = OverlayEntry(
          builder: (context) => Scaffold(
                backgroundColor: Colors.black38,
                body: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  child: Container(),
                  onTap: () {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                    reverseAnimation();
                  },
                ),
              ));
    }

    if (_isExpanded) {
      reverseAnimation();
    } else {
      forwardAnimation();
    }
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }
}
