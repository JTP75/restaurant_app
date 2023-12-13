import 'package:flutter/material.dart';

import 'package:restaurant_app/backend/backend.dart';

SettingsPageBackend settingsPageBackend = SettingsPageBackend();

class ManualLocationSetting extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ManualLocationSettingState();
}

class ManualLocationSettingState extends State<ManualLocationSetting> {
  bool useManualLocation = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 657.0,
      child: Column(
        children: [

          Padding(
            padding: EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              top: 4.0,
              bottom: 4.0
            ),
            child: Row(
              children: [
                Text("Use Manual Location"),
                Spacer(flex:1),
                Switch(
                  value: useManualLocation,
                  onChanged: (value) {
                    setState(() {
                      useManualLocation = value;
                    });
                    settingsPageBackend.manualLocation = value;
                  },
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              top: 4.0,
              bottom: 4.0
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40.0,
                  width: 348.0,
                  child: TextField(
                    enabled: useManualLocation,
                    textAlignVertical: TextAlignVertical.bottom,
                    onSubmitted: (value) {
                      /// TODO validate entry
                      settingsPageBackend.address = value;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter Address..."
                    ),
                    style: TextStyle(
                      fontSize: 14.0
                    )
                  )
                )
              ],
            ),
          ),

          Spacer(flex:1),

          Padding(
            padding: EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              top: 4.0,
              bottom: 4.0
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Version 0.0.2-alpha",
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Color.fromARGB(255, 128, 128, 128),
                  ),
                )
              ],
            )
          )
          
        ]
      )
    );
  }
}
