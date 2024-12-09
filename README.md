# net_aware
net_aware is a Flutter plugin that allows you to easily integrate no internet handling into your Flutter application. 
This plugin is designed to be initialized in the main.dart file or any other entry point of your app, 
ensuring it wraps the MaterialApp widget for proper functionality.

## Features

- **Customizable No Internet Widget**: Display a widget when the device is offline.
- **Auto Reconnection Handling**: Automatically checks for internet availability and updates the UI.
- **Lightweight and Easy to Use**: Plug-and-play solution for Flutter developers.

## Installation
Add the following line to your pubspec.yaml file under `dependencies`:
```yaml
dependencies:
  net_aware: 0.0.1
```

## Usage
Basic Usage: <br>
Wrap your main widget or specific screens with NoInternetWidget:
```dart
import 'package:net_aware/net_aware.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NetAware(
      child: MaterialApp(
        home: MyHomePage(),
      ),
    );
  }
}
```
You can also use a custom offline widget you want to show:
```dart
import 'package:flutter/material.dart';
import 'package:net_aware/net_aware.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NetAware(
      checkInterval: Duration(seconds: 5),
      imageAsset: 'assets/custom_no_internet.png',
      bgColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Offline Mode"),
      ),
      customWidget: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.wifi_off, size: 80, color: Colors.red),
            SizedBox(height: 16),
            Text(
              "You are offline",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text('Home')),
          body: Center(child: Text('Welcome online!')),
        ),
      ),
    );
  }
}

```

## Additional Details
Parameters that can be used:
| Parameter     | Type     | Default Value          | Description                                                                  |
|---------------|----------|------------------------|------------------------------------------------------------------------------|
| child         | Widget   | required               | The main widget to display when connected to the internet.                   |
| checkInterval | Duration | Duration(seconds: 3)   | The interval for checking internet connectivity.                             |
| imageAsset    | String?  | assets/no_internet.jpg | Path to a custom offline image asset.                                        |
| bgColor       | Color?   | Colors.white           | Background color for the offline screen.                                     |
| appBar        | AppBar?  | null                   | A custom AppBar for the offline screen.                                      |
| offlineWidget  | Widget?  | null                   | A fully custom widget for the offline state. Overrides all other parameters. |

Default screen when device will be offline: <br>
![Screenshot](assets/app_ss.png)

Developed by: <br>
Pranav Patel <br>
Personal email - pranav.patel2001@gmail.com <br>
Work email - pranavp@fermion.in <br>
LinkedIn - https://www.linkedin.com/in/pranav-patel-7b06a4188 <br>
Publisher's LinkedIn - https://www.linkedin.com/company/fermioninfotech?trk=profile-position
