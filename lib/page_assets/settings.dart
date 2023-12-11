import 'package:flutter/material.dart';

import 'package:restaurant_app/backend/settings_backend.dart';

SettingsPageBackend settingsPageBackend = SettingsPageBackend();

class ManualLocationSetting extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ManualLocationSettingState();
}

class ManualLocationSettingState extends State<ManualLocationSetting> {
  bool useManualLocation = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(16.0),
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
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: [
              Text("Use Address"),
              Spacer(flex:1),
              SizedBox(
                width: 200.0,
                child: TextField(
                  enabled: useManualLocation,
                  onSubmitted: (value) {
                    /// TODO validate entry
                    settingsPageBackend.address = value;
                  },
                )
              )
            ],
          ),
        ),
        ]
      );
  }
}
