import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:techincal/shared/components/components.dart';
import 'package:techincal/shared/styles/colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SignUpScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          // ignore: deprecated_member_use
          Scaffold.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: 'http://technician.amrhs.tech/register',
      javascriptMode: JavascriptMode.unrestricted,
      onProgress: (int progress) {
        print('WebView is loading (progress : $progress%)');
      },
      javascriptChannels: <JavascriptChannel>{
        _toasterJavascriptChannel(context),
      },
      onPageStarted: (String url) {
        print('Page started loading: $url');
      },
      onPageFinished: (String url) {
        print('Page finished loading: $url');
      },
      gestureNavigationEnabled: true,
      backgroundColor: const Color(0x00000000),
    );
  }
}
