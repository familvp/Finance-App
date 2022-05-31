import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:paynav_for_all/resources/resources.dart' as resources;
import 'package:sms_autofill/sms_autofill.dart';

import 'blocs_&_cubits/login_bloc/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final SmsAutoFill _autoFill = SmsAutoFill();
  late TextEditingController _phoneNumberController;
  String otpString = "";
  FocusNode? _phoneNumberFocusNode;
  final formkey = GlobalKey<FormState>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      _getPhoneNumberHint();
    });
    _phoneNumberFocusNode = FocusNode();
    _phoneNumberController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    formkey.currentState?.dispose();
    _phoneNumberController.dispose();
    _phoneNumberFocusNode?.dispose();
    super.dispose();
  }

  _getPhoneNumberHint() async {
    String? hint = await _autoFill.hint;
    if (hint == null) {
      _phoneNumberFocusNode?.requestFocus();
    } else {
      final int len = hint.length;
      _phoneNumberController.text = hint.substring(len - 10);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: resources.darkBlue,
      floatingActionButton: Visibility(
        visible: BlocProvider.of<LoginBloc>(context).state is! PhoneAuthLoading,
        child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
          return ElevatedButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(
                  horizontal: 32,
                ),
              ),
              backgroundColor: MaterialStateProperty.all(
                resources.lightYellowColor,
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            child: const Text(
              "Next",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: resources.blackBlueColor,
              ),
            ),
            onPressed: () async {
              if (state is LoginInitial) {
                BlocProvider.of<LoginBloc>(context).add(PhoneNumberVerify(
                    phoneNumber: "+91" + _phoneNumberController.text));
              } else if (state is CodeSent) {
                BlocProvider.of<LoginBloc>(context).add(EnteredCodeVeirfy(
                  verificationId: state.verificationId,
                  otpEntered: otpString,
                ));
              } else if (state is CodeAuthFailure) {
                BlocProvider.of<LoginBloc>(context).add(EnteredCodeVeirfy(
                  verificationId: state.verificationId,
                  otpEntered: otpString,
                ));
              }
            },
          );
        }),
      ),
      appBar: _builtAppBar(),
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: _blocListeners,
        builder: _blocBuilders,
      ),
    );
  }

  Widget _buildTextField() {
    return TextFormField(
      cursorWidth: 3,
      controller: _phoneNumberController,
      autovalidateMode: AutovalidateMode.disabled,
      focusNode: _phoneNumberFocusNode,
      style: const TextStyle(
        fontSize: 48,
        color: resources.whiteColor,
      ),
      maxLength: 10,
      keyboardType: TextInputType.number,
      textAlignVertical: TextAlignVertical.bottom,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.zero,
        isDense: true,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: resources.white50Color,
            width: 1,
          ),
        ),
        counter: Offstage(),
        hintText: "Number",
        hintStyle: TextStyle(
          color: resources.white50Color,
          fontSize: 48,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  AppBar _builtAppBar() {
    bool isPhoneNumberTaken =
        BlocProvider.of<LoginBloc>(context).state is LoginInitial ||
            BlocProvider.of<LoginBloc>(context).state is PhoneAuthFailure;

    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: resources.darkBlue,
      ),
      elevation: 0,
      backgroundColor: resources.darkBlue,
      automaticallyImplyLeading: false,
      leading: IconButton(
        icon: const Icon(Icons.keyboard_arrow_left),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 18),
          child: Center(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Step ${isPhoneNumberTaken ? 1 : 2} ",
                    style: const TextStyle(
                      color: resources.whiteColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                  ),
                  const TextSpan(
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
        ),
      ],
    );
  }

  getEnterPhoneNumberWidget(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          resources.enterPhoneNo,
          style: TextStyle(
            fontSize: 18,
            height: 1.5,
            fontWeight: FontWeight.w400,
            color: resources.white50Color,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            right: 87,
            top: 23,
          ),
          child: Form(
            key: formkey,
            child: _buildTextField(),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 14),
          child: Text(
            resources.willreceiveOtp,
            style: TextStyle(
              fontSize: 12,
              height: 15 / 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }

  getEnterOtpWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          resources.enterOtp,
          style: TextStyle(
            fontSize: 18,
            height: 1.5,
            fontWeight: FontWeight.w400,
            color: resources.white50Color,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 87, top: 23),
          child: PinCodeTextField(
            autovalidateMode: AutovalidateMode.disabled,
            animationType: AnimationType.fade,
            onChanged: (text) {},
            length: 6,
            keyboardType: TextInputType.number,
            appContext: context,
            cursorHeight: 30,
            onCompleted: (value) {
              setState(() {
                otpString = value;
              });
            },
            pinTheme: PinTheme(
              fieldHeight: 52,
              activeColor: resources.whiteBlueColor,
              selectedColor: resources.whiteBlueColor,
              inactiveColor: resources.whiteBlueColor,
            ),
            textStyle: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 48,
              color: resources.whiteColor,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 14),
          child: RichText(
            text: TextSpan(
              children: [
                const TextSpan(text: "Code was sent via SMS to "),
                TextSpan(
                  text: _phoneNumberController.text,
                  style: const TextStyle(
                    color: resources.white50Color,
                    decoration: TextDecoration.underline,
                  ),
                ),
                const TextSpan(text: ". Didn’t receive \nthe code? "),
                const TextSpan(
                  text: "Resend",
                  style: TextStyle(
                    color: resources.yellowColor,
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.solid,
                    letterSpacing: 1,
                  ),
                ),
                const TextSpan(text: "."),
              ],
              style: const TextStyle(
                color: resources.whiteColor,
                fontSize: 13,
                height: 15 / 13,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _blocBuilders(context, state) {
    if (state is PhoneAuthLoading) {
      return const Center(
        child: CircularProgressIndicator(
          color: resources.yellowColor,
        ),
      );
    } else if (state is LoginInitial || state is PhoneAuthFailure) {
      return Padding(
          padding: const EdgeInsets.only(left: 24, top: 20),
          child: getEnterPhoneNumberWidget(context));
    } else if (state is PhoneAuthSuccess ||
        state is CodeAuthFailure ||
        state is CodeSent) {
      return Padding(
        padding: const EdgeInsets.only(left: 24, top: 20),
        child: getEnterOtpWidget(),
      );
    }
    return Container();
  }

  void _blocListeners(context, state) {
    if (state is CodeSent) {
      _showSnackBar('Otp Sent');
    } else if (state is PhoneAuthFailure) {
      _showSnackBar(state.message);
    } else if (state is CodeAuthFailure) {
      _showSnackBar(state.message);
    } else if (state is CodeAuthSucces) {
      _showSnackBar('Successfully Logged In');
      Navigator.pop(context);
      Navigator.pushReplacementNamed(context, "/welcomeScreen");
    } else if (state is PhoneAuthError) {
      _showSnackBar("Something Went Wrong please try again.");
      Navigator.of(context).pop();
    } else if (state is NewUserSignUp) {
      _showSnackBar("Successfully Signed Up...!!");
      Navigator.pushReplacementNamed(context, "/enterNameScreen");
    }
  }

  _showSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
