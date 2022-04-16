import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// import './details_page.dart';
// import './chart_page.dart';
import './home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //   statusBarColor: CupertinoColors.systemYellow,
    // ));
    return const CupertinoApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: <LocalizationsDelegate<dynamic>>[
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
      ],
    );
  }
}

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   int index = 0;

//   final List<Widget> pages = [
//     const HomePage(),
//     const ChartPage(),
//     const DetailsPage(),
//   ];

//   @override
//   Widget build(BuildContext context) => CupertinoTabScaffold(
//       tabBar: CupertinoTabBar(height: 60, items: const [
//         BottomNavigationBarItem(
//           label: 'Home',
//           icon: Icon(CupertinoIcons.house_fill),
//         ),
//         BottomNavigationBarItem(
//             icon: Icon(CupertinoIcons.doc_text_fill), label: 'Details'),
//         BottomNavigationBarItem(
//             icon: Icon(CupertinoIcons.chart_bar_square_fill), label: 'Chart'),
//       ]),
//       tabBuilder: (context, index) {
//         return CupertinoTabView(builder: (BuildContext context) {
//           return const CupertinoPageScaffold(
//             navigationBar: CupertinoNavigationBar(
//               middle: Text('Page 1'),
//             ),
//             child: CupertinoButton(
//               child: Text('das'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//             };
//               },
//             ),
//           );
//         });
//         // switch (index) {
//         //   case 0:
//         //     return const HomePage();
//         //   case 1:
//         //     return const ChartPage();
//         //   case 2:
//         //   default:
//         //     return const HomePage();
//         // }
//       });
// }
