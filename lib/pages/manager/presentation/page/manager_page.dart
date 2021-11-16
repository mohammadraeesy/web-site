
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_package/pages/manager/presentation/bloc/mager_bloc_cubit.dart';
import 'package:sizer/sizer.dart';

class ManagerPage extends StatefulWidget {
  @override
  _ManagerPageState createState() => _ManagerPageState();
}

class _ManagerPageState extends State<ManagerPage> {
  final ManagerBlocCubit managerBlocCubit = ManagerBlocCubit();

  @override
  void initState() {
    super.initState();
    managerBlocCubit.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "پیام ها",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11.0.sp),
        ),
        centerTitle: true,
      ),
      body: Container(
          width: 100.0.w,
          height: 100.0.h,
          child: Column(
            children: [
              Container(
                width: 100.0.w,
                alignment: Alignment.center,
                margin: EdgeInsets.only(right: 5.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "نام",
                      style: TextStyle(fontSize: 8.0.sp),
                    ),
                    Text(
                      "پیام",
                      style: TextStyle(fontSize: 8.0.sp),
                    ),
                    Text(
                      "شماره تماس",
                      style: TextStyle(fontSize: 8.0.sp),
                    ),
                    Container()
                  ],
                ),
              ),
              Container(
                height: 85.0.h,
                width: 100.0.w,
                child: BlocBuilder<ManagerBlocCubit, ManagerBlocState>(
                  bloc: managerBlocCubit,
                  builder: (context, state) {
                    if (state is ManagerBlocLoaded) {
                      return ListView.builder(
                          itemCount: state.loadedMassage.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 30.0.h,
                              width: 100.0.w,
                              margin: EdgeInsets.only(top: 5.0.h),
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    width: 25.0.w,
                                    child: SelectableText(
                                      state.loadedMassage[index].name,
                                      style: TextStyle(fontSize: 10.0.sp),
                                    ),
                                  ),
                                  Container(
                                    width: 25.0.w,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.green),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30))),
                                    alignment: Alignment.center,
                                    child: SelectableText(
                                      state.loadedMassage[index].massage,
                                      style: TextStyle(fontSize: 10.0.sp),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width: 25.0.w,
                                    child: SelectableText(
                                      state.loadedMassage[index].phone,
                                      style: TextStyle(fontSize: 10.0.sp),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width: 25.0.w,
                                    child: FlatButton(
                                      child: Text(
                                        "حذف پیام",
                                        style: TextStyle(fontSize: 10.0.sp),
                                      ),
                                      onPressed: (){
                                        managerBlocCubit.deletePost(state.loadedMassage[index].id);
                                      },
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });
                    }
                    return Center(
                      child: Text('loading ...'),
                    );
                  },
                ),
              ),
            ],
          )
          //
          ),
    );
  }
}
