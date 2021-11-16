import 'package:flutter/material.dart';
import 'package:flutter_test_package/main.dart';
import 'package:flutter_test_package/pages/manager/presentation/page/manager_page.dart';
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
                    builder: (context) => MyHomePage(),
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
