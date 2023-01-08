import 'package:flutter/material.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:motion_tab_bar_v2/motion-badge.widget.dart';

class MotionBarDemo extends StatefulWidget {
  MotionBarDemo({Key? key}) : super(key: key);

  @override
  State<MotionBarDemo> createState() => _MotionBarDemoState();
}

class _MotionBarDemoState extends State<MotionBarDemo>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 1, length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Sarav App",
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Motion Badge and Bar",
            ),
          ),
          bottomNavigationBar: MotionTabBar(
            initialSelectedTab: "Home",
            useSafeArea: true, // default: true, apply safe area wrapper
            labels: const ["Dashboard", "Home", "Profile", "Settings"],
            icons: const [
              Icons.dashboard,
              Icons.home,
              Icons.people_alt,
              Icons.settings
            ],

            // optional badges, length must be same with labels
            badges: [
              // Default Motion Badge Widget
              const MotionBadgeWidget(
                text: '99+',
                textColor: Colors.white, // optional, default to Colors.white
                color: Colors.red, // optional, default to Colors.red
                size: 18, // optional, default to 18
              ),

              // custom badge Widget
              Container(
                color: Colors.black,
                padding: const EdgeInsets.all(2),
                child: const Text(
                  '48',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),

              // allow null
              null,

              // Default Motion Badge Widget with indicator only
              const MotionBadgeWidget(
                isIndicator: true,
                color: Colors.red, // optional, default to Colors.red
                size: 5, // optional, default to 5,
                show: true, // true / false
              ),
            ],
            tabSize: 50,
            tabBarHeight: 55,
            textStyle: const TextStyle(
              fontSize: 12,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
            tabIconColor: Colors.blue[600],
            tabIconSize: 28.0,
            tabIconSelectedSize: 26.0,
            tabSelectedColor: Colors.blue[900],
            tabIconSelectedColor: Colors.white,
            tabBarColor: Colors.greenAccent,
            onTabItemSelected: (int value) {
              setState(() {
                _tabController!.index = value;
              });
            },
          ),
          body: TabBarView(
            physics:
                NeverScrollableScrollPhysics(), // swipe navigation handling is not supported
            controller: _tabController,
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              const Center(
                child: Text("Dashboard"),
              ),
              const Center(
                child: Text("Home"),
              ),
              const Center(
                child: Text("Profile"),
              ),
              const Center(
                child: Text("Settings"),
              ),
            ],
          ),
        ));
  }
}
