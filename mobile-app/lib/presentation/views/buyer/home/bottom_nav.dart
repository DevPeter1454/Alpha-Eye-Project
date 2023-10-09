import 'package:alpha_eye/presentation/views/buyer/home/tabs/home.dart';
import 'package:alpha_eye/presentation/views/buyer/home/tabs/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

//import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../core/cores.dart';

class BuyerHome extends HookWidget {
  const BuyerHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabIndex = useState(0);
    final bottomNavIndex = useState(0);
    List<Widget> children = const [
      HomeView(),
      SettingsView(),
    ];
    return DefaultTabController(
      length: 2,
      initialIndex: tabIndex.value,
      child: Scaffold(
        backgroundColor: AppColors.homeScaffold,
        // appBar: HomeAppBar(),
        body: children[bottomNavIndex.value],

        ///Bottom Navigation Bar for controlling the body or home view.
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.sdn600,
          iconSize: 20.0,
          selectedFontSize: 14.0,
          unselectedFontSize: 14.0,
          onTap: (value) => bottomNavIndex.value = value,
          currentIndex: bottomNavIndex.value,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          selectedIconTheme: const IconThemeData(
            color: AppColors.primary,
          ),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}

// class BuyerHome extends StatelessWidget {
//   const BuyerHome({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: AppText('Home'),
//       ),
//       body: Container(
//         child: AppText('Home'),
//       ),
//     );
//   }
// }
