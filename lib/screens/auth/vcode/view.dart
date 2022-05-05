import 'package:flutter/material.dart';
import 'package:maktabat_alharam/screens/auth/new_password/view.dart';
import 'package:maktabat_alharam/screens/widgets/constants.dart';
import 'package:get/get.dart';
import 'package:maktabat_alharam/screens/widgets/customButton.dart';
import 'package:maktabat_alharam/screens/widgets/customTextFeild.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';
class VCodeScreen extends StatefulWidget {
  const VCodeScreen({Key? key}) : super(key: key);

  @override
  State<VCodeScreen> createState() => _VCodeScreenState();
}

class _VCodeScreenState extends State<VCodeScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final CountdownController _countdownController = CountdownController(autoStart: true);

  void _handleConfirmCode() {
    final text = _emailController.text;
    if (text.isNotEmpty) {
      // ConfirmCodeCubit.of(context).checkCode(_pinFieldController.text);
    }
  }

  @override
  void dispose() {

    //_pinFieldController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
   // double width = MediaQuery.of(context).size.width;
    return Container(
      color: kAppBarColor,
      child: SafeArea(
        child: Scaffold(

          backgroundColor: kHomeColor,
          key: _scaffoldKey,
          body: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(height: height*0.05,),
                  InkWell(
                    onTap: ()=>Get.back(),
                    child:  Container(
                      margin: const EdgeInsetsDirectional.only(start: 280),
                      child:  Image.asset("assets/image/backbutton.png"),
                    ),),
                  SizedBox(height: height*0.3,),
                  CustomTextField(

                    hint: "EnterVcode".tr,
                    dIcon: Icons.verified_user_outlined,
                    label:"EnterVcode".tr ,
                    controller: _emailController,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Please enter a verify code";
                      }
                    },
                    type: TextInputType.emailAddress,

                  ),
              _buildResendCounter(),
                  SizedBox(height: height*0.05,),
                  CustomButton(color: kSmallIconColor,title:"confirm".tr ,onPressed: ()=>Get.to(()=>NewPasswordScreen()),),
                  SizedBox(height: height*0.01,),

                ],
              ),
            ),
          ),
        ),
      ),
    );



  }

  Widget _buildResendCounter() {
    return Countdown(
      seconds: 75,
      controller: _countdownController,
      onFinished: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            content: Text(
                'If you not sent an verification code please try again !',  style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Cairo',
                fontSize: 12)),
          ),
        );
      },
      build: (context, time) {
        final showResetBottom = time.toInt() == 0;
        final minutes = time >= 60 ? (time / 60).round() : 0;
        final seconds = (time - minutes * 60).round();
        return GestureDetector(
          onTap: () {
            // _handleCodeResend();
            if (showResetBottom) {
              _countdownController.restart();
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            //mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'resent'.tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: showResetBottom ? Colors.black : kPrimaryColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'DinReguler',
                  fontSize: 12,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '$minutes:${seconds < 10 ? 0 : ''}${seconds.toInt()}',
                  style: TextStyle(
                    color: !showResetBottom ? Colors.black : Colors.black45,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
