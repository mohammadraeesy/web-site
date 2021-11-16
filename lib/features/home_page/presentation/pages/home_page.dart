import 'package:flutter/material.dart';
import 'package:flutter_test_package/features/contact_us/presentation/pages/contact_us_page.dart';
import '../../../manager/presentation/pages/manager_page.dart';
import 'package:sizer/sizer.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0.w,
      height: 100.0.h,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FlatButton(onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ContactUsPage(),
                  ),
                );
              }, child: Text("ارتباط باما")),
              FlatButton(onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ManagerPage(),
                  ),
                );
              }, child: Text("مدیریت")),
            ],
          ),
          Image.asset("asset/coming_soon.png",height: 80.0.h,),
        ],
      ),
    );
  }
}
