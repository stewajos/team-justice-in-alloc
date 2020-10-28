import 'package:allocation_app/model/navigation_model.dart';
import 'package:allocation_app/pages/allocation_page/allocation_page.dart';
import 'package:allocation_app/pages/help_page/help_page.dart';
import 'package:allocation_app/pages/history_page/history_page.dart';
import 'package:allocation_app/pages/home_page/home_page.dart';
import 'package:allocation_app/pages/settings_page/settings_page.dart';
import 'package:allocation_app/providers/allocation_provider.dart';
import 'package:allocation_app/widgets/side_nav_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavigationDrawer extends StatefulWidget {
  int selectedIndex = 0;

  @override
  NavigationDrawerState createState() {
    return new NavigationDrawerState();
  }
}

class NavigationDrawerState extends State<NavigationDrawer> with SingleTickerProviderStateMixin{
  double maxWidth = 200.0;
  double minWidth = 70.0;
  bool isCollapsed = true;
  AnimationController _animationController;
  Animation<double> widthAnimation;

  List<NavigationModel> navItems = [
    NavigationModel(
        title: "Home",
        icon: Icons.home,
        page: HomePage()),
    NavigationModel(
        title: "History",
        icon: Icons.history,
        page: HistoryPage()),
    NavigationModel(
        title: "Settings",
        icon: Icons.settings,
        page: SettingsPage()),
    NavigationModel(
        title: "Help",
        icon: Icons.help,
        page: HelpPage())
  ];

  @override
  void initState() {
    super.initState();
    ///Initiate the animation controller which will control the sidebar
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 300), value: 70.0);
    widthAnimation = Tween<double>(begin: maxWidth, end: minWidth).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
            padding: EdgeInsets.only(left: minWidth),
            child: navItems[widget.selectedIndex].page,
        ),
        AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) => getWidget(context, child)
        ),
      ] //children
    );
  }

  Widget getWidget(context, child){

    final allocationProvider = Provider.of<AllocationProvider>(context);

    return Material(
      elevation: 8.0,
      child: Container(
          width: widthAnimation.value,
          color: Colors.blueAccent,
          child: Column(
            children: [
              SizedBox(height: 40.0,),
              SideNavTile(
                title: allocationProvider.state.userEmail,
                icon: Icons.person,
                aniController: _animationController,),
              Divider(
                color:Colors.white,
                height: 25.0,
                thickness: 2.0,),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider(color: Colors.blueAccent, height: 30.0);
                  },
                  itemBuilder: (context, index) {
                  return SideNavTile(
                      onTap: () {
                        setState(() {
                          widget.selectedIndex = index;
                        });
                      },
                      isSelected: widget.selectedIndex == index,
                      title: navItems[index].title,
                      icon: navItems[index].icon,
                      aniController: _animationController,
                  );
                },
                  itemCount: navItems.length,
                ),
              ),
              InkWell(
                onTap: (){
                  setState((){
                    isCollapsed = !isCollapsed;
                    isCollapsed ? _animationController.forward()
                        : _animationController.reverse();
                  });
                },
                child: AnimatedIcon(
                  icon: AnimatedIcons.arrow_menu,
                  progress: _animationController,
                  color: Colors.white,
                  size: 35.0,
                ),
              ),
              SizedBox(height: 50.0,),
            ],
          )
        ),
    );
  }
}
