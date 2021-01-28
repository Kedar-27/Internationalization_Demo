import 'dart:io';

import 'package:flutter/material.dart';
import 'package:internalization_demo/helper/localization_helper.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  String dropdownValue = 'Config 1';
  LocalizationHelper localizationHelper;
  String title = "";
  String buttonTitle = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    this._setLocale();
  }

  Future<void> _setLocale() async {
    localizationHelper =
        LocalizationHelper(Localizations.localeOf(context), dropdownValue);
    await localizationHelper.load();

    setState(() {
      title = localizationHelper.translate("title");
      buttonTitle = localizationHelper.translate("buttonTitle");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Internationalization"),
        actions: [
          DropdownButton<String>(
            value: dropdownValue,
            style: TextStyle(color: Colors.black),
            underline: Container(
              height: 2,
              width: 20,
              color: Colors.black,
            ),
            onChanged: (String newValue) {
              dropdownValue = newValue;
              this._setLocale();
            },
            items: <String>['Config 1', 'Config 2', 'Config 3']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  title,
                  style: TextStyle(fontSize: 20),
                )),
            Container(
              height: 5,
            ),
            FlatButton(
              onPressed: () {},
              child: Text(buttonTitle),
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  //side: BorderSide(color: Colors.red)
                ),
            )
          ],
        ),
      ),
    );
  }
}
