import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:paynav_for_all/localdatabase/sessionManager.dart';
import 'package:paynav_for_all/resources/resources.dart' as resources;
import 'package:share/share.dart';

class BurgerMenu extends StatefulWidget {
  const BurgerMenu({Key? key}) : super(key: key);

  @override
  _BurgerMenuState createState() => _BurgerMenuState();
}

class _BurgerMenuState extends State<BurgerMenu>
    with SingleTickerProviderStateMixin {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // SpDbHelper _spDbHelper = SpDbHelper();
  final SessionManager _sessionManager = SessionManager();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final Widget container = Container(
      margin: const EdgeInsets.only(top: 5, bottom: 5, left: 10),
      color: resources.white50Color,
      height: 1,
    );
    return Stack(
      children: [
        Container(
          color: resources.darkBlue,
          height: size.width * 0.85,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 20,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 25, top: 30, right: 8, bottom: 8),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                    ),
                    color: Color(0xff2e2b69),
                  ),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const BurgerMenuItem(
                          navigationRoute: "/dashboard",
                          optionName: "DashBoard",
                          imagePath: resources.dashboardIcon,
                        ),
                        const BurgerMenuItem(
                          navigationRoute: "/messages",
                          optionName: "Groups & Friends",
                          imagePath: resources.groupsIcon,
                        ),
                        const BurgerMenuItem(
                          navigationRoute: "/Still not decided",
                          optionName: "Buy and Stack Gold",
                          imagePath: resources.goldIcon,
                        ),
                        container,
                        const BurgerMenuItem(
                          navigationRoute: "/settings",
                          optionName: "Settings",
                          imagePath: resources.settingsIcon,
                        ),
                        const BurgerMenuItem(
                          imagePath: resources.addFriendsIcon,
                          navigationRoute: '/addFriends',
                          optionName: 'Invite Pal',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 34,
          child: Container(
            padding: const EdgeInsets.all(6),
            child: CircleAvatar(
              radius: 21,
              child:
                  // Image.asset(resources.dummyProfilePhoto),
                  ClipOval(
                    child: CachedNetworkImage(
                                  imageUrl: _sessionManager.getUserAvatarUrl() ??
                      resources.dummyProfilePhoto,
                                  placeholder: (context, url) => const CircularProgressIndicator(),
                                  errorWidget: (context, url, error) => const Icon(Icons.error),
                                ),
                  ),
            ),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: resources.darkBlue,
            ),
          ),
        ),
        // ),
      ],
    );
  }

  // ignore: unused_element
  Widget _getCardButton() {
    return ElevatedButton.icon(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
      ),
      icon: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          Icon(
            Icons.keyboard_arrow_up,
            color: Colors.white,
          ),
          Image(
            image: AssetImage(resources.payNavLogoLight),
          ),
        ],
      ),
      label: const Text(
        "Card",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      onPressed: () {},
    );
  }

  Widget addFriedndTile(context) {
    return ListTile(
      onTap: () async {
        // final String invitationUrl = await ShortDynamicLink(type: type, shortUrl: shortUrl);

        final RenderBox box = context.findRenderObject();

        await Share.share(
          "${resources.addFriendsInviteText} ",
          subject: "Welcome to PayNav",
          sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
        );
      },
      leading: const ImageIcon(
        AssetImage(resources.addFriendsIcon),
        size: 30,
        color: resources.whiteColor,
      ),
      title: const Text(
        "Add Friends",
        style: TextStyle(
          color: resources.bottomSheetTextColor,
          fontSize: 16,
          height: 1.5,
        ),
      ),
    );
  }
}

class BurgerMenuItem extends StatelessWidget {
  final String imagePath;
  final String optionName;
  final String navigationRoute;

  const BurgerMenuItem(
      {Key? key,
      required this.imagePath,
      required this.navigationRoute,
      required this.optionName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget optionIcon = ImageIcon(
      AssetImage(imagePath),
      color: resources.whiteColor,
    );

    final Widget optionLabel = Text(
      optionName,
      style: const TextStyle(
        color: resources.bottomSheetTextColor,
        fontSize: 16,
        height: 1.5,
      ),
    );

    return ListTile(
      isThreeLine: false,
      onTap: () => Navigator.of(context).pushNamed(navigationRoute),
      minVerticalPadding: 5,
      leading: optionIcon,
      title: optionLabel,
    );
  }
}
