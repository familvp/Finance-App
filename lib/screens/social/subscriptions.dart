

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paynav_for_all/resources/resources.dart' as resources;


class Subscriptions extends StatefulWidget {
  const Subscriptions({Key? key}) : super(key: key);

  @override
  State<Subscriptions> createState() => _SubscriptionsState();
}

class _SubscriptionsState extends State<Subscriptions>
    with SingleTickerProviderStateMixin {


  @override
  void initState() {
    super.initState();
  }




  @override
  Widget build(BuildContext context) {



    return Scaffold(
      backgroundColor: resources.social,
      body:
      SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 70),
                Center(
                  child: SizedBox(
                      height: 260,
                      width: 260,
                      child: Image.asset(
                        resources.subscriptions,)),
                ),
                const SizedBox(height: 50),
                const Center(
                  child: Text(
                    "Subscriptions made simple",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: "Mukta Mahee",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Center(
                  child: Text(
                    "Maintain all of them hassle free : shared,\nroommates,colleagues, solo, recurring,\nnon-recurring, various billing cycles, etc ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Mukta Mahee",
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
        Container(
          decoration: BoxDecoration(
            color: const Color(0xff5f609d),
            borderRadius: BorderRadius.circular(20.0),
          ),
          margin: const EdgeInsets.only(right: 15),
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
        
        
          child: const Text(
            'Add',
            style: TextStyle(
              fontFamily: 'Mukta Mahee',
              fontSize: 16,
              color: Color(0xffffffff),
              fontWeight: FontWeight.w700,
            ),
            softWrap: false,
          ),
        )
      ,
         FloatingActionButton(
          heroTag: "btn5",
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
          backgroundColor: resources.lightYellowColor,
          onPressed: () async {
        
          },
        ),
      ],),
    );
  }
}
