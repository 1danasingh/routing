import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routing/configs/responsive.dart';
import 'package:routing/pages/explore_page.dart';
import 'package:routing/pages/home_page.dart';
import 'package:routing/pages/next_page.dart';
import 'package:routing/pages/profile_page.dart';

class DashboardPage extends GetResponsiveView<DashboardController> {
  static const routeName = "/";

  DashboardPage({super.key});

  @override
  Widget? phone() {
    return Obx(
          () =>
          Scaffold(
            appBar: AppBar(actions: [
              IconButton(icon: Icon(Icons.settings), onPressed: () {
                Get.rootDelegate.toNamed(SettingsPage.routeName);
              },)
            ],),
            body: controller.getPages,
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: controller.index.value,
              onTap: (index) {
                controller.index.value = index;
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: '',),
                BottomNavigationBarItem(icon: Icon(Icons.explore), label: ''),
                BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
              ],
            ),
          ),
    );

    // return GetRouterOutlet.builder(
    //     builder:(context,root,loc) {
    //       if (loc!.location!.startsWith(Explore.routeName) == true) {
    //         controller.index.value = 1;
    //       }
    //       if (loc.location!.startsWith(ProfilePage.routeName) == true) {
    //         controller.index.value = 2;
    //       }
    //       return Obx(
    //           ()=> Scaffold(
    //         appBar: AppBar(
    //           actions: [
    //             IconButton(
    //               icon: const Icon(Icons.settings),
    //               onPressed: () {
    //                 Get.rootDelegate.toNamed(SettingsPage.routeName);
    //               },
    //             )
    //           ],
    //         ),
    //         body: Navigator(
    //           onGenerateRoute: (settings) {
    //             return MaterialPageRoute(builder: (c) => controller.getPages);
    //           },
    //         ),
    //         bottomNavigationBar: BottomNavigationBar(
    //           currentIndex: controller.index.value,
    //           onTap: (index) {
    //             // controller.index.value = index;
    //             onSelect(index, root);
    //           },
    //           items: const [
    //             BottomNavigationBarItem(
    //               icon: Icon(Icons.home),
    //               label: '',
    //             ),
    //             BottomNavigationBarItem(icon: Icon(Icons.explore), label: ''),
    //             BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
    //           ],
    //           selectedItemColor: Colors.purple,
    //         ),
    //     ),
    //       );}
    // );
  }

  @override
  Widget? desktop() {
    return Obx(() => Scaffold(
      body: Row(
        children: [
          SideMenu(currentIndex: controller.index.value, onSelect: (index){controller.index.value=index;}),
          Expanded(child: controller.getPages)
        ],
      ),
    ));
    // return GetRouterOutlet.builder(
    //     builder: (context, rootDelegate, getNav) {
    //       final delegate = rootDelegate;
    //       final currentLocation = getNav!.location;
    //       print('CURRENT LOC $currentLocation');
    //       var currentIndex = 0;
    //       if (currentLocation!.startsWith(Explore.routeName) == true) {
    //         currentIndex = 1;
    //       }
    //       if (currentLocation.startsWith(ProfilePage.routeName) == true) {
    //         currentIndex = 2;
    //       }
    //       return Scaffold(
    //         drawer: SideMenu(
    //             currentIndex: currentIndex,
    //             onSelect: (value) => onSelect(value, delegate)),
    //         body: Row(
    //           children: [
    //             // Obx(
    //             //   () => Container(
    //             //     height: Get.height,
    //             //     width: 100,
    //             //     decoration: const BoxDecoration(
    //             //         border: Border.fromBorderSide(
    //             //             BorderSide(color: Colors.grey, width: 1))),
    //             //     child: Column(
    //             //       mainAxisAlignment: MainAxisAlignment.center,
    //             //       children: [
    //             //         IconButton(
    //             //           icon: controller.index.value != 0
    //             //               ? Icon(Icons.home)
    //             //               : Icon(
    //             //                   Icons.home,
    //             //                   color: Colors.purple,
    //             //                 ),
    //             //           onPressed: () {
    //             //             controller.index.value = 0;
    //             //             controller.onSelect(0, rootDelegate);
    //             //           },
    //             //         ),
    //             //         const SizedBox(
    //             //           height: 70,
    //             //         ),
    //             //         IconButton(
    //             //           icon: controller.index.value != 1
    //             //               ? Icon(Icons.explore)
    //             //               : Icon(
    //             //                   Icons.explore,
    //             //                   color: Colors.purple,
    //             //                 ),
    //             //           onPressed: () {
    //             //             controller.index.value = 1;
    //             //             controller.onSelect(1, rootDelegate);
    //             //           },
    //             //         ),
    //             //         const SizedBox(
    //             //           height: 70,
    //             //         ),
    //             //         IconButton(
    //             //           icon: controller.index.value != 2
    //             //               ? const Icon(Icons.person)
    //             //               : const Icon(
    //             //                   Icons.person,
    //             //                   color: Colors.purple,
    //             //                 ),
    //             //           onPressed: () {
    //             //             controller.index.value = 2;
    //             //             controller.onSelect(2, rootDelegate);
    //             //           },
    //             //         ),
    //             //       ],
    //             //     ),
    //             //   ),
    //             // ),
    //             SideMenu(currentIndex: currentIndex, onSelect: (value) => onSelect(value, delegate)),
    //             Expanded(
    //               child: GetRouterOutlet(
    //                 anchorRoute: DashboardPage.routeName,
    //                 initialRoute: HomePage.routeName,
    //                 delegate: delegate,
    //                 filterPages: (afterAnchor) {
    //                   return afterAnchor.take(1);
    //                 },
    //               ),
    //             )
    //           ],
    //         ),
    //       );
    //     },
    // );
  }
  onSelect(value, GetDelegate delegate) {
    print("ONSELECT $value}");
    switch (value) {
      case 0:
        delegate.toNamed(HomePage.routeName);
        break;
      case 1:
        delegate.toNamed(Explore.routeName);
        break;
      case 2:
        delegate.toNamed(ProfilePage.routeName);
        break;
      default:
    }
  }
}

class DashboardBinding extends Bindings {
  late DashboardController dashboardController;

  @override
  void dependencies() {
    dashboardController = Get.put(DashboardController());
  }
}

class DashboardController extends GetxController {
  RxInt index = RxInt(0);
  Rx<String?> currentRoute = Rx(null);
  List<Widget> pages = [HomePage(), Explore(), ProfilePage()];

  get getPages => pages[index.value];
  List routes = [HomePage.routeName, Explore.routeName, ProfilePage.routeName];

  @override
  void onInit() {
    currentRoute.value = Get.routing.current;
    super.onInit();
  }
}

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
    required this.currentIndex,
    required this.onSelect,
  }) : super(key: key);
  final int currentIndex;
  final Function(int) onSelect;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.grey.shade400,
      child: Drawer(
        backgroundColor: Colors.grey[200],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(icon: Icon(Icons.settings), onPressed: () {
              Get.rootDelegate.toNamed(SettingsPage.routeName);
            },),
            Expanded(
              child: ListView(
                children: [
                  ...drawerData
                      .map((e) => DrawerEntryItem(
                          e, currentIndex, (index) => onSelect(index)))
                      .toList()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerEntry {
  final String title;
  final int index;
  final Widget child;
  final List<DrawerEntry> children;

  DrawerEntry(this.title, this.index, this.child,
      [this.children = const <DrawerEntry>[]]);
}

final List<DrawerEntry> drawerData = <DrawerEntry>[
  DrawerEntry('Home', 0, HomePage()),
  DrawerEntry('Explore', 1, Explore()),
  DrawerEntry('Profile', 2, ProfilePage()),
];

class DrawerEntryItem extends StatelessWidget {
  const DrawerEntryItem(this.entry, this.selectedIndex, this.onTap);

  final DrawerEntry entry;
  final int selectedIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    Widget _buildTiles(DrawerEntry root) {
      if (root.children.isEmpty) {
        return ListTile(
          tileColor: root.index == selectedIndex
              ? Theme.of(context).scaffoldBackgroundColor
              : Colors.transparent,
          selected: root.index == selectedIndex,
          onTap: () {
            onTap(root.index);
          },
          title: Text(root.title),
        );
      }
      return ExpansionTile(
        backgroundColor: Colors.transparent,
        key: PageStorageKey<DrawerEntry>(root),
        title: Text(root.title),
        initiallyExpanded: root.children.first.index <= selectedIndex &&
            selectedIndex <= root.children.last.index,
        children: root.children.map<Widget>(_buildTiles).toList(),
      );
    }

    return _buildTiles(entry);
  }
}
