

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paynav_for_all/resources/resources.dart' as resources;


class Rent extends StatefulWidget {
  const Rent({Key? key}) : super(key: key);

  @override
  State<Rent> createState() => _RentState();
}

class _RentState extends State<Rent>
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
                const SizedBox(height: 40),
                Center(
                  child: SizedBox(
                      height: 260,
                      width: 260,
                      child: Image.asset(
                        resources.rent,)),
                ),
                const SizedBox(height: 30),
                const Center(
                  child: Text(
                    "Collecting or Paying rent ?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: "Mukta Mahee",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                 Center(
                  child: RichText(
                    text:const TextSpan(
                      children: [
                        TextSpan(
                          text: "Landlord:",
                           style: TextStyle(
                      color: resources.redAlertColor,
                      fontSize: 15,
                      fontFamily: "Mukta Mahee",
                      fontWeight: FontWeight.bold,
                    ),
                        ),  
                        TextSpan(
                          text: " Add details about tenants, send\n auto reminders and collect directly into\n your bank account.",
                          style: TextStyle(
                      color: resources.whiteColor,
                      fontSize: 15,
                      fontFamily: "Mukta Mahee",
                      fontWeight: FontWeight.bold,
                    ),
                        ),

                      ]
                    ),
                    
                  ),
                 ),
                 const SizedBox(height: 15,),
                  RichText(
                    text:const TextSpan(
                      children: [
                        TextSpan(
                          text: "Tenant:",
                          style: TextStyle(
                      color: resources.yellowColor,
                      fontSize: 15,
                      fontFamily: "Mukta Mahee",
                      fontWeight: FontWeight.bold,
                    ),
                        ),
                        TextSpan(
                          text: "Share and collect the easy way\n from flatmates.",
                          style: TextStyle(
                      color: resources.whiteColor,
                      fontSize: 15,
                      fontFamily: "Mukta Mahee",
                      fontWeight: FontWeight.bold,
                    ),
                        ),

                      ]
                    ),
                    
                  ),
                  const SizedBox(height: 15,),
                  RichText(
                    text:const TextSpan(
                      children: [
                        TextSpan(
                          text: "         Pay using",
                          style: TextStyle(
                      color: resources.whiteColor,
                      fontSize: 15,
                      fontFamily: "Mukta Mahee",
                      fontWeight: FontWeight.bold,
                    ),
                        ),
                        TextSpan(
                          text: " CREDIT CARD",
                          style: TextStyle(
                      color: resources.fadeGreenColor,
                      fontSize: 15,
                      fontFamily: "Mukta Mahee",
                      fontWeight: FontWeight.bold,
                    ),
                        ),
                        TextSpan(
                          text: " or ",
                          style: TextStyle(
                      color: resources.whiteColor,
                      fontSize: 15,
                      fontFamily: "Mukta Mahee",
                      fontWeight: FontWeight.bold,
                    ),
                        ),
                        TextSpan(
                          text: "UPI",
                          style: TextStyle(
                      color: resources.fadeGreenColor,
                      fontSize: 15,
                      fontFamily: "Mukta Mahee",
                      fontWeight: FontWeight.bold,
                    ),
                        ),

                      ]
                    ),
                    
                  ),
                
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
