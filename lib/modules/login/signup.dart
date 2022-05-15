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
    // return Container(
    //   color: HexColor('#001a2b'),
    //   child: Padding(
    //     padding: const EdgeInsets.all(12.0),
    //     child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         children: [
    //           Text(
    //             'Welcome',
    //             style: TextStyle(
    //                 fontSize: 40,
    //                 fontWeight: FontWeight.bold,
    //                 color: Colors.white),
    //           ),
    //           SizedBox(
    //             height: 15,
    //           ),
    //           Text(
    //             'Lorem ipsum dolor sit amst , consetetur sadipscing elitr ,sed diam nonmy eirmod',
    //             style: TextStyle(
    //                 fontSize: 14,
    //                 fontWeight: FontWeight.bold,
    //                 color: Colors.white),
    //           ),
    //           SizedBox(
    //             height: 15,
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: defaultFormField(
    //                 controller: emailController,
    //                 type: TextInputType.emailAddress,
    //                 validate: (String? valur) {},
    //                 label: 'Email',
    //                 prefix: Icons.email),
    //           ),
    //           SizedBox(
    //             height: 15,
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: defaultFormField(
    //                 controller: passwordController,
    //                 type: TextInputType.number,
    //                 validate: (String? valur) {},
    //                 label: 'Password',
    //                 suffix: Icons.remove_red_eye,
    //                 prefix: Icons.lock),
    //           ),
    //           SizedBox(
    //             height: 15,
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: defaultButton(
    //                 function: () {},
    //                 text: 'Sign Up',
    //                 radius: 12.0,
    //                 isUpperCase: true),
    //           ),
    //           SizedBox(
    //             height: 15,
    //           ),
    //           SizedBox(
    //             height: 15,
    //           ),
    //           myDivider(),
    //           SizedBox(
    //             height: 15,
    //           ),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               Icon(
    //                 Icons.face,
    //                 color: defaultColor,
    //                 size: 30,
    //               ),
    //               SizedBox(
    //                 width: 15,
    //               ),
    //               Icon(
    //                 Icons.social_distance,
    //                 color: defaultColor,
    //                 size: 30,
    //               ),
    //               SizedBox(
    //                 width: 15,
    //               ),
    //               Icon(
    //                 Icons.message,
    //                 color: defaultColor,
    //                 size: 30,
    //               ),
    //             ],
    //           )
    //         ]),
    //   ),
    // );
  }
}
