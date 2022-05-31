import 'package:flutter/material.dart.';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paynav_for_all/resources/resources.dart' as resources;
import 'package:paynav_for_all/screens/onBoardingScreens/blocs_&_cubits/login_bloc/login_bloc.dart';

class EnterNameScreen extends StatefulWidget {
  const EnterNameScreen({Key? key}) : super(key: key);

  @override
  _EnterNameScreenState createState() => _EnterNameScreenState();
}

class _EnterNameScreenState extends State<EnterNameScreen> {
  late TextEditingController _controller;
  FocusNode? _focusNode;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    _focusNode = FocusNode();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _focusNode?.requestFocus();
    });
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget loader = const Center(
      child: CircularProgressIndicator(
        color: resources.yellowColor,
      ),
    );

    Widget enterNameText = const Text(
      "Enter your  name:",
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: resources.white50Color,
      ),
    );

    return Scaffold(
      floatingActionButton: _builtFloatingActionButton(),
      backgroundColor: resources.darkBlue,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: resources.darkBlue,
        ),
        elevation: 0,
        backgroundColor: resources.darkBlue,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_left),
          onPressed: () async {
            await _auth.signOut();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  "Sorry Logged Out...!!\nPlease Sign in Again.",
                ),
              ),
            );
            Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18),
            child: Center(
              child: RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: "Step 3 ",
                      style: TextStyle(
                        color: resources.whiteColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    ),
                    TextSpan(
                      text: "of 3",
                      style: TextStyle(
                        color: resources.white50Color,
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is PhoneAuthError) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Something went wrong please again later."),
            ));
            Navigator.of(context).pop();
          } else if (state is NewUserSigningUpComplete) {
            Navigator.of(context).pushReplacementNamed("/welcomeScreen");
          } else if (state is PhoneAuthLoading) {
            _focusNode?.unfocus();
          }
        },
        builder: (context, state) {
          if (state is PhoneAuthLoading) {
            return loader;
          }
          return Padding(
            padding: const EdgeInsets.only(left: 24, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                enterNameText,
                Padding(
                  padding: const EdgeInsets.only(
                    right: 87,
                    top: 22,
                  ),
                  child: nameTextField(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  ElevatedButton _builtFloatingActionButton() {
    return ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(
            horizontal: 24,
          ),
        ),
        backgroundColor: MaterialStateProperty.all(resources.yellowColor),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      child: const Text(
        "Finish",
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: resources.blackBlueColor,
        ),
      ),
      onPressed: () async {
        BlocProvider.of<LoginBloc>(context)
            .add(NewUserSigningUp(userName: _controller.text));
      },
    );
  }

  TextFormField nameTextField() {
    return TextFormField(
      focusNode: _focusNode,
      controller: _controller,
      style: const TextStyle(
        fontSize: 48,
        color: Color(0xfffefefe),
      ),
      keyboardType: TextInputType.name,
      textAlignVertical: TextAlignVertical.bottom,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.zero,
        isDense: true,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0x7ffefefe),
            width: 1,
          ),
        ),
        hintText: "Name",
        hintStyle: TextStyle(
          fontSize: 48,
          color: resources.white50Color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
