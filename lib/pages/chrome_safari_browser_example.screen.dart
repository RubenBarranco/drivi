import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class MyChromeSafariBrowser extends ChromeSafariBrowser {
  @override
  void onOpened() {
    print("ChromeSafari browser opened");
  }

  @override
  void onCompletedInitialLoad() {
    print("ChromeSafari browser initial load completed");
  }

  @override
  void onClosed() {
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    print("ChromeSafari browser closed");
  }
}

class ChromeSafariBrowserExampleScreen extends StatefulWidget {
  final ChromeSafariBrowser browser = MyChromeSafariBrowser();

  @override
  _ChromeSafariBrowserExampleScreenState createState() =>
      _ChromeSafariBrowserExampleScreenState();
}

class _ChromeSafariBrowserExampleScreenState
    extends State<ChromeSafariBrowserExampleScreen> {
  launchWeb() async {
    await widget.browser.open(
        url: Uri.parse(
            "https://go.drivi.com.do/login/?redirect_to=https%3A%2F%2Fgo.drivi.com.do%2F"),
        options: ChromeSafariBrowserClassOptions(
            android: AndroidChromeCustomTabsOptions(
                enableUrlBarHiding: true,
                isSingleInstance: false,
                isTrustedWebActivity: true,
                showTitle: false,
                keepAliveEnabled: true),
            ios: IOSSafariOptions(
                dismissButtonStyle: IOSSafariDismissButtonStyle.CLOSE,
                presentationStyle:
                    IOSUIModalPresentationStyle.OVER_FULL_SCREEN)));
  }

  @override
  void initState() {
    launchWeb();

    widget.browser.addMenuItem(ChromeSafariBrowserMenuItem(
        id: 2,
        label: 'Custom item menu 1',
        action: (url, title) {
          print('Custom item menu 1 clicked!');
          print(url);
          print(title);
        }));
    widget.browser.addMenuItem(ChromeSafariBrowserMenuItem(
        id: 3,
        label: 'Custom item menu 2',
        action: (url, title) {
          print('Custom item menu 2 clicked!');
          print(url);
          print(title);
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/drivi.png"),
                  fit: BoxFit.fitWidth),
            ),
            child: CircularProgressIndicator()),
      ),
    );
  }
}
