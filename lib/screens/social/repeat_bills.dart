

import 'package:flutter/material.dart';
import 'package:paynav_for_all/resources/resources.dart' as resources;


class RepeatBills extends StatefulWidget {
  const RepeatBills({Key? key}) : super(key: key);

  @override
  State<RepeatBills> createState() => _RepeatBillsState();
}

class _RepeatBillsState extends State<RepeatBills>
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
                        resources.repeatBills,)),
                ),
                const SizedBox(height: 30),
                const Center(
                  child: Text(
                    "Bills can be a hassle !",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 27,
                      fontFamily: "Mukta Mahee",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Center(
                  child: Text(
                    "Now, effortlessly pay & collect all your solo and shared expenses. Take a break\n from repeating expenses by adding them here just once!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Mukta Mahee",
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold
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
          onPressed: () {
        showModalBottomSheet(
   shape:const RoundedRectangleBorder(
     borderRadius:
         BorderRadius.vertical(top:Radius.circular(25.0)),
   ),// RoundedRectangleBorder
    backgroundColor:Colors.white,
    context:context,
    isScrollControlled:true,
    builder:(context){
      return Wrap(
        children:[
          Container(
  padding: const EdgeInsets.all(8),
  child:Padding(
    padding:EdgeInsets.only(
       bottom:
           MediaQuery.of(context).viewInsets.bottom),
    child:TextFormField(),
       // TextFormField
  ),// Padding
)// Container
        ],
     );// Wrap
   });
          },
        ),
      ],),
    );
  }
}
