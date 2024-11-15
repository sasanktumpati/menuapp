import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

void debugLog(
  String logTag,
  dynamic msg, {
  bool showToast = false,
}) {
  logger(
    logTag,
    msg,
    showToast: showToast,
  );
}

void prodLog(
  String logTag,
  dynamic msg, {
  bool showToast = false,
}) {
  logger(
    logTag,
    msg,
    showToast: showToast,
  );
}

void logger(
  String logTag,
  dynamic msg, {
  showToast = false,
  Color backgroundColor = Colors.black,
  Color textColor = Colors.white,
}) {
  String logMsg = "$logTag: $msg";

  if (showToast) {
    Fluttertoast.showToast(
      msg: logMsg,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: 16.0,
    );
    log("$logMsg\n");
  } else {
    // Log to console
    log("$logMsg\n");
  }
}
