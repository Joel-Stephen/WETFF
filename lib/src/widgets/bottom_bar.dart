import 'package:app_template/src/utils/constants.dart';
import 'package:app_template/src/utils/utils.dart';
import 'package:flutter/material.dart';

class CustomBottomBar extends StatefulWidget {
  @override
  _CustomBottomBarState createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  int count;
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: screenWidth(context, dividedBy: 1),
        height: screenHeight(context, dividedBy: 12),
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth(context, dividedBy: 20),
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Constants.kitGradients[6],
          boxShadow: [
            BoxShadow(
                blurRadius: 15,
                offset: Offset(0, 0),
                color: Constants.kitGradients[1].withOpacity(0.3))
          ],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: screenHeight(context, dividedBy: 22),
                width: screenWidth(context, dividedBy: 7),
                child: Padding(
                    padding: EdgeInsets.all(7),
                    child: Icon(Icons.home_outlined,color: Colors.white))),
            Spacer(),
            Container(
                height: screenHeight(context, dividedBy: 22),
                width: screenWidth(context, dividedBy: 7),
                child: Padding(
                    padding: EdgeInsets.all(7), child: Icon(Icons.search,color: Colors.white))),
            Spacer(),
            Container(
                height: screenHeight(context, dividedBy: 22),
                width: screenWidth(context, dividedBy: 7),
                child: Padding(
                  padding: EdgeInsets.all(7),
                  child: Icon(Icons.radio_button_checked_rounded,color: Colors.white)
                )),
            Spacer(),
            Container(
                height: screenHeight(context, dividedBy: 22),
                width: screenWidth(context, dividedBy: 7),
                child: Padding(
                  padding: EdgeInsets.all(7),
                  child: Icon(Icons.check_circle_outline,color: Colors.white)
                )),
            Spacer(),
            Container(
                height: screenHeight(context, dividedBy: 22),
                width: screenWidth(context, dividedBy: 7),
                child: Padding(
                  padding: EdgeInsets.all(7),
                  child: Icon(Icons.person_outline_rounded,color: Colors.white)
                )),
          ],
        ),
      ),
    );
  }
}
