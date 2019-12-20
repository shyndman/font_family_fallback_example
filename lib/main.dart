import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
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
