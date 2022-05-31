

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paynav_for_all/resources/resources.dart' as resources;
import 'package:paynav_for_all/screens/social/rent.dart';
import 'package:paynav_for_all/screens/social/repeat_bills.dart';
import 'package:paynav_for_all/screens/social/store.dart';
import 'package:paynav_for_all/screens/social/subscriptions.dart';


class Social extends StatefulWidget {
  const Social( {Key? key,this.pagenumber=0}) : super(key: key);

  @override
  State<Social> createState() => _SocialState();
  final int pagenumber;
}

class _SocialState extends State<Social>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(initialIndex: widget.pagenumber, length: 3, vsync: this);
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    final Widget allTab = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 1),
      child: Text(resources.repeatButtons[0]),
    );

    final Widget incomingTab = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 1),
      child: Text(resources.repeatButtons[1]),
    );

    final Widget outgoingTab = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 1),
      child: Text(resources.repeatButtons[2]),
    );
    




    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: resources.social,
          ),
          elevation: 0,
          // backgroundColor: resources.darkBlue,
          bottom: TabBar(
            padding: const EdgeInsets.only(right: 70),
            indicatorColor: resources.yellowColor,
            isScrollable: true,

            indicatorPadding: const EdgeInsets.symmetric(horizontal: 8),
            labelStyle: const TextStyle(fontSize: 15),


            labelColor: resources.yellowColor,
            unselectedLabelColor: resources.whiteColor,
            labelPadding: EdgeInsets.zero,
            indicatorSize: TabBarIndicatorSize.label,
            controller: tabController,
            tabs: [
              allTab,
              incomingTab,
              outgoingTab,
            ],
          ),
            automaticallyImplyLeading: false,
          // leading: IconButton(icon: const Icon( Icons.home,color: Colors.white,size: 30,),onPressed: () => Navigator.pop(context),),

          leadingWidth: 0,
        ),
      ),
      body:  TabBarView(
        
          controller: tabController,
          children: const [
              
                RepeatBills(),

            Rent(),

            Subscriptions(),
            



          ])
      ,
    );
  }
}
