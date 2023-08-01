// for all related system design configurations

import 'package:flutter/material.dart';
import 'package:points_rewards/colors.dart';
import 'package:points_rewards/extensions/navigation.dart';
import 'package:points_rewards/widgets/custom_card.dart';

extension System on BuildContext {
  void showSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void openDrawer() {
    Scaffold.of(this).openDrawer();
  }

  void showAlertDialog(
      {bool? showActions,
      Widget? child,
      VoidCallback? onOkPressed,
      VoidCallback? onCancelPressed}) {
    showDialog(
        context: this,
        builder: (context) => AlertDialog(
              backgroundColor: Colors.transparent,
              elevation: 0,
              contentPadding: const EdgeInsets.all(0),
              insetPadding: const EdgeInsets.all(0),
              alignment: Alignment.bottomCenter,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              content: CascadeCard(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    child ?? const SizedBox(),
                    showActions!
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextButton(
                                  style: TextButton.styleFrom(
                                      backgroundColor: InductionAppColor.red),
                                  onPressed:
                                      onCancelPressed ?? () => context.pop(),
                                  child: const Text(
                                    "No",
                                    style: TextStyle(color: Colors.white),
                                  )),
                              TextButton(
                                  style: TextButton.styleFrom(
                                      backgroundColor:
                                          InductionAppColor.yellow),
                                  onPressed: onOkPressed ?? () => context.pop(),
                                  child: const Text("Yes",
                                      style: TextStyle(color: Colors.white))),
                            ],
                          )
                        : const SizedBox()
                  ],
                ),
              )),
            ));
  }

  // get dimension from build context
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
}
