import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ResponsiveUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(height: 10.h, child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: ListView.separated(shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey,

                        ),
                        width: 5.h,
                        child: Center(
                          child: Text("Omar", style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.sp
                          ),),
                        ),
                      ),
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 10,),
                  itemCount: 10),
            )),
          ],
        ),
      ),
    );
  }

}