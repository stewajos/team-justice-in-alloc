import 'package:allocation_app/model/navigation_model.dart';
import 'package:allocation_app/pages/landing_page/widgets/side_nav_tile.dart';
import 'package:flutter/material.dart';

class NavigationDrawer extends StatefulWidget {
  final String email;

  NavigationDrawer({this.email});

  @override
  NavigationDrawerState createState() {
    return new NavigationDrawerState(userEmail: email);
  }
}
class NavigationDrawerState extends State<NavigationDrawer> with SingleTickerProviderStateMixin{
  double maxWidth = 200.0;
  double minWidth = 70.0;
  bool isCollapsed = true;
  AnimationController _animationController;
  Animation<double> widthAnimation;
  int selectedIndex;
  String userEmail;

  NavigationDrawerState({@required this.userEmail,});

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    widthAnimation = Tween<double>(begin: maxWidth, end: minWidth).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: _animationController, builder: (context, widget) => getWidget(context, widget),);
  }

  Widget getWidget(context, widget){
    return Material(
      elevation: 8.0,
      child: Container(
          width: widthAnimation.value,
          color: Colors.blueAccent,
          child: Column(
            children: [
              SizedBox(height: 10.0,),
              //ToDo: Fix the email formatting so that a long email will actually fit properly
              SideNavTile(title: userEmail,icon: Icons.person, aniController: _animationController),
              Divider(color:Colors.white, height: 30, thickness: 2.0,),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider(color: Colors.blueAccent, height: 20.0);
                  },
                  itemBuilder: (context, index) {
                  return SideNavTile(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      isSelected: selectedIndex == index,
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
          )),
    );
  }
}
