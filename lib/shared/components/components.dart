// ignore_for_file: non_constant_identifier_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beautiful_popup/main.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:techincal/shared/components/constants.dart';
import 'package:techincal/shared/network/local/cache_helper.dart';
import 'package:techincal/shared/styles/colors.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = defaultColor,
  bool isUpperCase = true,
  double radius = 0.0,
  required Function() function,
  required String text,
}) =>
    Container(
      width: width,
      height: 50.0,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 250, 56, 2),
            Color.fromARGB(255, 245, 140, 12),
          ],
        ),
        borderRadius: BorderRadius.circular(radius),
      ),
    );
//https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80

Widget ItemWidget(String text, String price) => Padding(
      padding: const EdgeInsets.all(12.0),
      child: Center(
        child: SizedBox(
          width: double.infinity,
          height: 70,
          child: Card(
            shadowColor: defaultColor,
            elevation: 8,
            child: Center(
                child: Column(
              children: [
                Text(
                  '$text',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '$price',
                  style:
                      TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
                ),
              ],
            )),
          ),
        ),
      ),
    );
Widget OrderItem(String comment, String status, String time, String date) =>
    Container(
      padding: EdgeInsets.all(12),
      height: 160,
      child: Card(
        elevation: 12.0,
        shadowColor: defaultColor,
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Text('$comment',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 10,
            ),
            Text(
              '$status',
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.only(right: 15, left: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('$time'),
                  SizedBox(
                    width: 10,
                  ),
                  Text('$date'),
                ],
              ),
            )
          ],
        ),
      ),
    );
TextStyle subTitleTextStyle({
  bool isDark = false,
  FontWeight fontWeight = FontWeight.w400,
  double fontSize = 14,
  FontStyle fontStyle = FontStyle.normal,
}) {
  return GoogleFonts.montserrat(
    fontSize: fontSize,
    color: isDark ? AppColors.dartSubtextColor : AppColors.subTextColor,
    fontWeight: fontWeight,
    fontStyle: fontStyle,
  );
}

TextStyle titleTextStyle({
  bool isDark = false,
  FontWeight fontWeight = FontWeight.w500,
  double fontSize = 15,
  FontStyle fontStyle = FontStyle.normal,
}) {
  return GoogleFonts.montserrat(
    fontSize: fontSize,
    color: isDark ? AppColors.darkTextColor : AppColors.textColor,
// fontWeight: fontWeight,
    fontStyle: fontStyle,
  );
}

Widget UserItem(
        double q,
        String Networkimage,
        String name,
        int rate,
        String descrption,
        BuildContext context,
        VoidCallback? voidCallback,
        VoidCallback? voidCallback2,
        String phone) =>
    Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        color: HexColor('#001a2b'),
        elevation: 12,
        shadowColor: Colors.white,
        child: Container(
          height: 120,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipOval(
                child: SizedBox.fromSize(
                  size: Size.fromRadius(48), // Image radius
                  child: Image.network('$Networkimage', fit: BoxFit.cover),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$name',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RatingBar(
                      initialRating: rate.toDouble(),
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 18,
                      ratingWidget: RatingWidget(
                        full: const Icon(
                          Icons.star,
                          color: Colors.white,
                        ),
                        half: const Icon(
                          Icons.star_half,
                          color: Colors.white,
                        ),
                        empty: const Icon(
                          Icons.star_border,
                          color: Colors.white,
                        ),
                      ),
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: q,
                      child: Text(
                        '$descrption',
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    defaultButton(
                      function: () {
                        final popup = BeautifulPopup(
                          context: context,
                          template: TemplateGift,
                        );
                        popup.show(
                          title: 'Technician',
                          content: 'Create An Order !!',
                          // close: defaultButton(
                          //     function: () {
                          //       List<String> genderList = ['Male', 'Female'];
                          //       String? dropmenuGender;
                          //       late String valuegender;
                          //       DropdownButtonFormField(
                          //         isExpanded: true,
                          //         decoration: InputDecoration(
                          //             border: const OutlineInputBorder(
                          //               borderRadius: BorderRadius.all(
                          //                 Radius.circular(15.0),
                          //               ),
                          //             ),
                          //             filled: true,
                          //             hintStyle:
                          //                 TextStyle(color: Colors.grey[800]),
                          //             hintText: "Gender",
                          //             fillColor: Colors.white),
                          //         value: dropmenuGender,
                          //         onChanged: (String? Value) {
                          //           valuegender = Value!;
                          //         },
                          //         items: genderList
                          //             .map((cityTitle) => DropdownMenuItem(
                          //                 value: cityTitle,
                          //                 child: Text(cityTitle)))
                          //             .toList(),
                          //       );
                          //     },
                          //     text: 'Please choose your area',
                          //     radius: 12,
                          //     width: 250),
                          actions: [
                            popup.button(
                              label: 'Create',
                              onPressed: voidCallback!,
                            ),
                            popup.button(
                              label: 'Close',
                              onPressed: Navigator.of(context).pop,
                            ),
                          ],
                          // bool barrierDismissible = false,
                          // Widget close,
                        );
                      },
                      text: 'Book',
                      radius: 12.0,
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    defaultButton(
                        function: () {
                          Phone = CacheHelper.getData(key: 'phone');

                          final popup = BeautifulPopup(
                            context: context,
                            template: TemplateGift,
                          );
                          popup.show(
                            title: 'Technician',
                            content:
                                'Call The Technician?  \nname : $name \nphone : $phone',
                            actions: [
                              popup.button(
                                label: 'Call',
                                onPressed: voidCallback2!,
                              ),
                              popup.button(
                                label: 'Close',
                                onPressed: Navigator.of(context).pop,
                              ),
                            ],
                            // bool barrierDismissible = false,
                            // Widget close,
                          );
                        },
                        text: 'Contact',
                        radius: 12.0)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );

Widget CategoryItem(String? image, String? title) => Card(
      elevation: 5,
      margin: EdgeInsets.all(15),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          side: BorderSide(width: 2, color: defaultColor)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          gradient: LinearGradient(
            colors: [
              HexColor('#3a4c58'),
              Color.fromARGB(255, 174, 174, 174),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: double.infinity,
              height: 100,
              padding: EdgeInsets.only(left: 4, right: 4, top: 4),
              child: CachedNetworkImage(
                imageUrl: "$image",
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Text(
              '$title',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );

Widget CommentItem(String comment, BuildContext context, String name) => Card(
      elevation: 3.0,
      shadowColor: Colors.blueGrey,
      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(6.0),
                alignment: Alignment.topLeft,
                child: Text(
                  name,
                  style: const TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.all(6.0),
                alignment: Alignment.topLeft,
                child: Text(
                  comment,
                  style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.black87),
                ),
              ),
            ],
          ),
        ],
      ),
    );

Widget defaultTextButton({
  required VoidCallback function,
  required String text,
}) =>
    TextButton(
      onPressed: function,
      child: Text(
        text.toUpperCase(),
      ),
    );

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  ValueChanged<String>? onSubmit,
  ValueChanged<String>? onChange,
  GestureTapCallback? onTap,
  bool isPassword = false,
  required FormFieldValidator<String>? validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  VoidCallback? suffixPressed,
  bool isClickable = true,
  int? lines,
}) =>
    Container(
      color: Colors.white,
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        obscureText: isPassword,
        enabled: isClickable,
        onFieldSubmitted: onSubmit,
        onChanged: onChange,
        onTap: onTap,
        maxLines: lines,
        validator: validate,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(
            prefix,
            color: defaultColor,
          ),
          suffixIcon: suffix != null
              ? IconButton(
                  onPressed: suffixPressed,
                  icon: Icon(
                    suffix,
                  ),
                )
              : null,
        ),
      ),
    );

Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(start: 20.0, end: 20),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );

void NavigateTo(context, widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ));

void NavigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (Route<dynamic> route) => false,
    );

void showToast({required String message, required ToastStates toastStates}) =>
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: chooseToastColor(toastStates),
        textColor: Colors.white,
        fontSize: 16.0);

// ignore: constant_identifier_names
enum ToastStates { SUCCESS, EROOR, WARNING }
Color chooseToastColor(ToastStates states) {
  Color color;
  switch (states) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.EROOR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.blue;
      break;
  }
  return color;
}
