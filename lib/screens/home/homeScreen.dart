import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paynav_for_all/resources/resources.dart' as resources;
import 'package:paynav_for_all/screens/home/blocs/weekDatesBloc/datePicker.dart';
import 'package:paynav_for_all/screens/home/components/burgerMenu.dart';
import 'package:paynav_for_all/screens/home/components/week_days.dart';

import 'blocs/pageview_height/pageview_height_cubit.dart';
import 'components/customFab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late PageController _pageController;

  @override
  void initState() {
    tabController = TabController(initialIndex: 0, length: 3, vsync: this);
    super.initState();
  }

  showBurgerMenu(context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      clipBehavior: Clip.hardEdge,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
        ),
      ),
      context: context,
      builder: (context) => const BurgerMenu(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Widget allTab = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 1),
      child: Text(resources.sortButtons[0]),
    );

    final Widget incomingTab = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 1),
      child: Text(resources.sortButtons[1]),
    );

    final Widget outgoingTab = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 1),
      child: Text(resources.sortButtons[2]),
    );

    final Widget searchButton = IconButton(
      icon: const ImageIcon(
        AssetImage(resources.searchIcon),
        size: 20,
      ),
      onPressed: () => Navigator.pushNamed(context, "/searchScreen"),
    );

    final Widget burgerMenuButton = IconButton(
      icon: const ImageIcon(
        AssetImage(
          resources.burgerMenuIcon,
        ),
        size: 23,
        color: resources.whiteColor,
      ),
      onPressed: () => showBurgerMenu(context),
    );

    final Widget notificationButton = IconButton(
      icon: const Image(
        image: AssetImage(
          resources.notificationIcon,
        ),
        height: 25,
      ),
      onPressed: () => Navigator.pushNamed(context, "/notifications"),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      backgroundColor: resources.darkBlue,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: resources.darkBlue,
        ),
        elevation: 0,
        // backgroundColor: resources.darkBlue,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: searchButton,
          ),
        ],
        title: Container(
          child: TabBar(
            indicatorColor: resources.yellowColor,
            isScrollable: true,
            indicatorPadding: const EdgeInsets.symmetric(horizontal: 8),
            labelStyle: const TextStyle(fontSize: 18),
            onTap: (tabNo) {
              // state.changeTransactionCategory(tabNo);
            },
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
        ),
        leadingWidth: 0,
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 6,
        color: resources.darkBlue,
        clipBehavior: Clip.antiAlias,
        shape: const CircularNotchedRectangle(),
        child: SizedBox(
          height: 55,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              burgerMenuButton,
              notificationButton,
            ],
          ),
        ),
      ),
      floatingActionButton: CustomFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Column(
        children: [
          AnimatedSize(
            duration: const Duration(milliseconds: 700),
            child: BlocBuilder<PageviewHeightCubit, double>(
              builder: (context, state) {
                return Container(
                  height: state,
                  color: resources.darkBlue,
                  child: PageView(
                    physics: const BouncingScrollPhysics(),
                    onPageChanged: (pageNo) {
                      if (pageNo == 1) {
                        BlocProvider.of<PageviewHeightCubit>(context)
                            .changeToPage2();
                      } else {
                        BlocProvider.of<PageviewHeightCubit>(context)
                            .changeToPage1();
                      }
                    },
                    children: const [
                      WeekDays(),
                      DateRangePicker(),
                    ],
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: resources.blueCream,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(23.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
