import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled/access_internal_storage_file.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
print("omar");
runApp(      DevicePreview(builder: (context) => MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {

        return      MaterialApp(

          builder: DevicePreview.appBuilder,
debugShowCheckedModeBanner: false,
          home:  AccessInternalStorageFile(),
        );
      }

    );
  }
}

