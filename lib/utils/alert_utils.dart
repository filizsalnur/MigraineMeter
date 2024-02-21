import 'package:flutter/material.dart';

import 'package:quickalert/quickalert.dart';

class AlertUtils {
  bool isDialogOpen = false;
  Future<void> successfulAlert(
      String successMessage, BuildContext context) async {
    isDialogOpen = true;
    await QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      showConfirmBtn: false,
      title: successMessage,
      backgroundColor: Theme.of(context).colorScheme.background,
      autoCloseDuration: Duration(milliseconds: 1500),
      titleColor: Colors.green,
    );
    isDialogOpen = false;
  }

  Future<void> errorAlert(String errorMessage, BuildContext context) async {
    isDialogOpen = true;
    await QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      title: errorMessage,
      backgroundColor: Theme.of(context).colorScheme.background,
      titleColor: Colors.red,
      showConfirmBtn: false,
      autoCloseDuration: Duration(milliseconds: 3000),
    );
    isDialogOpen = false;
  }

  Future<void> InfoAlert(String infoMessage, BuildContext context) async {
    isDialogOpen = true;
    await QuickAlert.show(
      context: context,
      type: QuickAlertType.info,
      showConfirmBtn: false,
      title: infoMessage,
      backgroundColor: Theme.of(context).colorScheme.background,
      autoCloseDuration: Duration(milliseconds: 1500),
      titleColor: Colors.yellow,
    );
    isDialogOpen = false;
  }

  Future<void> loadingAlert(BuildContext context) async {
    isDialogOpen = true;
    await QuickAlert.show(
      context: context,
      type: QuickAlertType.loading,
      showConfirmBtn: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      title: 'Loading',
      autoCloseDuration: Duration(milliseconds: 1500),
      titleColor: Colors.yellow,
    );
    isDialogOpen = false;
  }
}
