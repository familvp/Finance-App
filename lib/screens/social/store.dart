

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paynav_for_all/resources/resources.dart' as resources;
import 'package:paynav_for_all/resources/social_store.dart';


class Store extends StatefulWidget {
  const Store({Key? key}) : super(key: key);

  @override
  State<Store> createState() => _StoreState();
}

class _StoreState extends State<Store>
    with SingleTickerProviderStateMixin {


  @override
  void initState() {
    super.initState();
  }




  @override
  Widget build(BuildContext context) {



    return Scaffold(
      backgroundColor: const Color(0xff1A1443),
      body:
      Column(
        children: [
          Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
                      child: TextField(
                            onChanged: (value) {
                              setState(() {});
                              
                            },
                            autocorrect: true,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Mukta Mahee",
                              color: Color(0xff707070),
                            ),
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.search_rounded,
                          color: resources.whiteColor),
                          counter: Offstage(),
                          hintText: "Search Social Store",
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffaeaeae),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffaeaeae),
                            ),
                          ),
                          hintStyle: TextStyle(
                            fontFamily: "Mukta Mahee",
                            color: Color(0xffaeaeae),
                            fontSize: 18,
                            fontWeight: FontWeight.normal
                          ),
                        ),
                          ),
                    ),
                    ListView.separated(
                      itemCount: socialStore['data'].length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Column(
                        children: [
                        Text(socialStore['data'][index]['name'],),
                      ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => Container(width: 100,height:100,color: Colors.green,), separatorBuilder: (context,index)=> SizedBox(width: 10,), itemCount: 3),]),
                      

                      
                      
                     separatorBuilder: (context,index)=>const Divider(
                       color: Colors.white,
                     ),
                      ),
                     
        ],
      
      ),

    );
  }
}
