import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'loading.dart';

void showSnackBar({
  required String text,
  VoidCallback? press,
  required GlobalKey<ScaffoldState> scaffoldKey,
}) {
  // ignore: deprecated_member_use
  scaffoldKey.currentState?.showSnackBar(
    SnackBar(
      content: Text(
        text,
      ),
      backgroundColor: Colors.grey,
      duration: const Duration(
        seconds: 2,
      ),
      behavior: SnackBarBehavior.fixed,
      elevation: 0.0,
      action: press != null ? SnackBarAction(
        label: 'UNDO',
        onPressed: press,
      ) : null,
    ),
  );
}





void buildProgress({
  context,
  text,
  bool error = false,
}) =>
    showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                if (!error)  Loading(),
                if (!error)
                  const SizedBox(
                    width: 20.0,
                  ),
                Expanded(
                  child: Text(
                    text,
                  ),
                ),
              ],
            ),
            if (error)
              const SizedBox(
                height: 20.0,
              ),
            if (error)
              defaultButton(
                function: () {
                  Navigator.pop(context);
                },
                text: 'cancel',
              )
          ],
        ),
      ),
    );

Widget defaultButton({
  Color background = Colors.deepOrange,
  double radius = 5.0,
  required VoidCallback function,
  required String text,
  bool toUpper = true,
}) =>
    Container(
      width: double.infinity,
      height: 40.0,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(
          radius,
        ),
      ),
      child: FlatButton(
        onPressed: function,
        child: Text(
          toUpper ? text.toUpperCase() : text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );

void showToast({
  @required text,
  @required error,
}) =>
    Fluttertoast.showToast(
      msg: text.toString(),
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: error ? Colors.red : Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );
