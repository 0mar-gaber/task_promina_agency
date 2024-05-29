import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogUtil {
  static showMessageDialog(
      {required BuildContext context,
      required String message,
      VoidCallback? onOkPressed,
      VoidCallback? onCancelPressed,
      required bool oneButtonDialog}) {
    showDialog(
      context: context,
      builder: (context) {
        return Material(
          color: Colors.transparent,
          child: Center(
            child: Container(
              width: double.infinity,
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
              margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.04),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Text(message),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  oneButtonDialog == false
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: onOkPressed ?? () {},
                              child: const Text("yes",
                                  style: TextStyle(
                                      color:
                                          Color.fromRGBO(53, 152, 219, 1.0))),
                            ),
                            SizedBox(width: 16.w),
                            TextButton(
                              onPressed: onCancelPressed ??
                                  () {
                                    Navigator.pop(context);
                                  },
                              child: const Text("Cancel",
                                  style: TextStyle(
                                      color:
                                          Color.fromRGBO(53, 152, 219, 1.0))),
                            ),
                          ],
                        )
                      : TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("OK",
                              style: TextStyle(
                                  color: Color.fromRGBO(53, 152, 219, 1.0))),
                        ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
