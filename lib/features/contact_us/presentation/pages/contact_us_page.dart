import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test_package/core/snack_bar_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

class ContactUsPage extends StatefulWidget {
  ContactUsPage({Key key}) : super(key: key);

  @override
  _ContactUsPageState createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> with TickerProviderStateMixin {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController massageController = TextEditingController();
  final http.Client client = http.Client();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "ارتباط با ما",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.0.sp),
          ),
          centerTitle: true,
          elevation: 10,
          backgroundColor: Colors.orange,
        ),
        body: Container(
          width: 100.0.w,
          height: 100.0.h,
          color: Colors.teal,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 5.0.w, vertical: 5.0.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Material(
              elevation: 10,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: Stack(
                children: [
                  Positioned(
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      child: Image.asset(
                        'asset/pngtree-red-phone-background-and-text-contact-us-picture-image_1304019.png',
                        height: 90.0.h,
                        width: 90.0.w,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5.0.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _contactUsTextFiled(
                            hintText: "نام و نام خانوادگی",
                            maxLength: 20,
                            controller: nameController),
                        _contactUsTextFiled(
                            hintText: "Email",
                            maxLength: 20,
                            controller: emailController),
                        _contactUsTextFiled(
                            hintText: "شماره تلفن",
                            maxLines: 1,
                            maxLength: 11,
                            controller: phoneController),
                        _contactUsTextFiled(
                            hintText: "متن پیام",
                            maxLength: 250,
                            maxLines: 20,
                            height: 30.0.h,
                            controller: massageController),
                        Container(
                            height: 8.0.h,
                            margin: EdgeInsets.symmetric(horizontal: 30.0.w),
                            decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            child: FlatButton(
                              onPressed: () async {
                                bool emailValid = RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(emailController.text);
                                if (!emailValid) {
                                  SnackBarWidget(
                                          context: context,
                                          text: "ایمیل معتبر نیست",
                                          duration: Duration(seconds: 3))
                                      .showErrorSnackBar();
                                } else if (nameController.text.length < 4) {
                                  SnackBarWidget(
                                          context: context,
                                          text:
                                              "نام ونام خانوادگی باید حد اقل 4 کاراکتر باشد",
                                          duration: Duration(seconds: 3))
                                      .showErrorSnackBar();
                                } else if (phoneController.text.length != 11) {
                                  SnackBarWidget(
                                          context: context,
                                          text: "شماره تلفن معتبر نیست",
                                          duration: Duration(seconds: 3))
                                      .showErrorSnackBar();
                                } else if (massageController.text.length < 5) {
                                  SnackBarWidget(
                                          context: context,
                                          text:
                                              "متن پیام شما باید حد اقل 5 کاراکتر باشد",
                                          duration: Duration(seconds: 3))
                                      .showErrorSnackBar();
                                } else {
                                  Uri uri = Uri.parse(
                                      "http://localhost/testPhp/testPhp.php");
                                  var respunse;
                                  try {
                                    respunse = await http.post(uri,
                                        body: json.encode({
                                          "massage": massageController.text,
                                          "phone": phoneController.text,
                                          "name": nameController.text,
                                          "email": emailController.text
                                        }));
                                  } catch (a) {
                                    print(a);
                                    print(respunse);
                                  }

                                  SnackBarWidget(
                                          context: context,
                                          text: "اطلاعات با موفقیت ثبت شد",
                                          duration: Duration(seconds: 3))
                                      .showSucceedSnackBar();
                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 8.0.h,
                                child: Text(
                                  "ثبت",
                                  style: TextStyle(
                                      fontSize: 8.0.sp, color: Colors.white),
                                ),
                              ),
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  Container _contactUsTextFiled(
      {String hintText,
      int maxLength,
      int maxLines,
      double height,
      TextEditingController controller}) {
    return Container(
      height: height == null ? 10.0.h : height,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 8.0.sp),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
        ),
        style: TextStyle(),
        textAlign: TextAlign.center,
        maxLines: maxLines,
        maxLength: maxLength,
      ),
    );
  }
}
