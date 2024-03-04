import 'package:flutter/material.dart';
import 'package:migraine_meter/components/bottomAppBar.dart';
import 'package:migraine_meter/services/data.dart';
import 'package:migraine_meter/utils/alert_utils.dart';
import 'package:quickalert/quickalert.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.purple.shade900),
                    ),
                    onPressed: () async {
                      bool answer = await AlertUtils().confirmDelete(
                          "Geçmişi silmek istediğinize emin misiniz?", context);
                      if (answer) {
                        await StorageServices.clearData();
                        await Future.delayed(Duration(milliseconds: 1000));
                        await AlertUtils().successfulAlert(
                            "Geçmiş veriler başarıyla silindi", context);
                        await Future.delayed(Duration(milliseconds: 1000));
                      }

                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Geçmişi sil",
                        style: TextStyle(color: Colors.white, fontSize: 28),
                      ),
                    )),
              ],
            ),
          ],
        ),
        bottomNavigationBar: BottomBar(pageName: "settings"),
      ),
    );
  }
}
