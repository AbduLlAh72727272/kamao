// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../views/dashboard.dart';
// import '../views/account_view.dart';
// import '../common/custom_bottom_nav_bar.dart';
//
// class MainApp extends StatefulWidget {
//   @override
//   _MainAppState createState() => _MainAppState();
// }
//
// class _MainAppState extends State<MainApp> {
//   int _selectedIndex = 0;
//
//   final PageController _pageController = PageController();
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//     _pageController.jumpToPage(index);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView(
//         controller: _pageController,
//         physics: NeverScrollableScrollPhysics(), // Disable swipe to change pages
//         children: [
//           DashboardView(),
//           Container(), // Placeholder for the 2nd tab content
//           Container(), // Placeholder for the 3rd tab content
//           Container(), // Placeholder for the 4th tab content
//           AccountView(), // AccountView for the 5th tab
//         ],
//       ),
//       bottomNavigationBar: CustomBottomNavBar(
//         selectedIndex: _selectedIndex,
//         onItemSelected: _onItemTapped,
//       ),
//     );
//   }
// }
