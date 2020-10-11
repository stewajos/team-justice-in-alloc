import 'package:flutter/material.dart';

class SideNavTile extends StatefulWidget {
  final String title;
  final IconData icon;
  final AnimationController aniController;
  final bool isSelected;
  final Function onTap;

  SideNavTile(
      {@required this.title,
        @required this.icon,
        @required this.aniController,
        this.isSelected = false,
        this.onTap,
      });

  @override
  _SideNavTileState createState() => _SideNavTileState();
}

class _SideNavTileState extends State<SideNavTile>{

  Animation<double> widthAnimation;
  Animation<double> sizedBoxAnimation;

  @override
  void initState(){
    super.initState();
    widthAnimation = Tween<double>(begin: 200, end: 80).animate(widget.aniController);
    sizedBoxAnimation = Tween<double>(begin: 10, end: 0).animate(widget.aniController);
  }

  @override
  Widget build(BuildContext context) {
   return InkWell(
     onTap: widget.onTap,
     child: Container(
       decoration: BoxDecoration(
         borderRadius: BorderRadius.all(Radius.circular(16.0)),
         color: widget.isSelected ? Colors.transparent.withOpacity(0.3) : Colors.transparent,
       ),
        width: widthAnimation.value,
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: Row(
          children: [
            Icon(widget.icon, color: Colors.white, size:35),
            SizedBox(width: sizedBoxAnimation.value,),
            (widthAnimation.value >= 200) ? Text(widget.title, style: TextStyle(color: Colors.white)) : Container(), //Todo: Change this to the theme file
          ],
        ),
      ),
   );
  }

}