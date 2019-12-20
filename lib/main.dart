import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: FontFallbackDemo(),
      ),
    );
  }
}

class FontFallbackDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const stringToRender = 'a1 ⅔';

    /// Trigger a download of Noto, which we know to include ⅔, and Comfortaa,
    /// which does not.
    final noto = GoogleFonts.notoSans(fontSize: 96);
    final comfortaa = GoogleFonts.comfortaa(fontSize: 96);

    return Center(
      child: Column(
        children: [
          // This will render as tofu (a missing character)
          Text(stringToRender, style: comfortaa),
          // This will render successfully
          Text(stringToRender, style: noto),
          // This successfully falls back on Noto for only the missing character
          Text(
            stringToRender,
            style: comfortaa.copyWith(fontFamilyFallback: [noto.fontFamily]),
          ),
        ],
        mainAxisSize: MainAxisSize.min,
      ),
    );
  }
}
