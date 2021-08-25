import 'package:app_template/src/utils/constants.dart';
import 'package:app_template/src/utils/utils.dart';
import 'package:flutter/material.dart';

class CategoryTile extends StatefulWidget {
  final String categoryName;
  CategoryTile({this.categoryName});
  @override
  _CategoryTileState createState() => _CategoryTileState();
}

class _CategoryTileState extends State<CategoryTile> {
  bool color= false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          GestureDetector(
            onTap: (){
              setState(() {
                color=!color;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 25),vertical: screenWidth(context,dividedBy: 50)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey.withOpacity(0.8)),
                color: color?Constants.kitGradients[5]:Colors.white
              ),
              child: Text(
                "#"+widget.categoryName,style: TextStyle(fontSize: screenWidth(context,dividedBy: 30),fontWeight: FontWeight.w700,color: Colors.black),
              ),
            ),
          ),
          SizedBox(width: screenWidth(context,dividedBy: 20))
          // Container(
          //   height: screenWidth(context, dividedBy: 3.5),
          //   child: Column(
          //     children: [
          //       Container(
          //         width: screenWidth(context, dividedBy: 1.5),
          //         padding: EdgeInsets.only(left: 5, right: 1),
          //         child: widget.title == null
          //             ? Container()
          //             : Text(
          //                 widget.title,
          //                 style: TextStyle(
          //                   fontSize: screenWidth(context, dividedBy: 25),
          //                   fontWeight: FontWeight.w600,
          //                 ),
          //                 maxLines: 2,
          //                 overflow: TextOverflow.ellipsis,
          //               ),
          //       ),
          //       SizedBox(
          //         height: screenWidth(context, dividedBy: 80),
          //       ),
          //       Container(
          //         width: screenWidth(context, dividedBy: 1.5),
          //         padding: EdgeInsets.only(left: 5, right: 1),
          //         child: widget.description == null
          //             ? Container()
          //             : Text(
          //                 widget.description,
          //                 style: TextStyle(
          //                     fontSize: screenWidth(context, dividedBy: 40),
          //                     fontWeight: FontWeight.w400),
          //                 maxLines: 5,
          //                 overflow: TextOverflow.ellipsis,
          //               ),
          //       )
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
