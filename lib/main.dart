import 'package:custom_circular_animated_bottom_sheet/custom_circular_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', home: const MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ElevatedButton(onPressed: _onBottonTapped, child: Text('Show')),
      ),
    );
  }

  void _onBottonTapped() => showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    useSafeArea: true,
    isScrollControlled: true,
    constraints: const BoxConstraints(maxWidth: double.infinity),
    builder: (context) => CustomCircularBottomSheet(
      backgroundColor: Color(0xFFc8e1cc),
      padding: EdgeInsetsDirectional.only(top: 48.h, start: 14.w, end: 14.w, bottom: 24.h),
      widget: Column(
        children: [
          ///   Avatar
          Image.asset("assets/gifs/man_avatr.gif"),
          SizedBox(height: 20.h),

          ///   title
          Text(
            'Congratulations',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32.sp, color: Colors.white),
          ),
          SizedBox(height: 4.h),

          ///   subtitle
          Text(
            "Your account has been created successfully",
            style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white.withValues(alpha: 0.9)),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 37.h),
        ],
      ),
    ),
  );
}
