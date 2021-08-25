import 'package:app_template/src/utils/constants.dart';
import 'package:app_template/src/utils/utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ImageTile extends StatefulWidget {
  final String image;
  final String desc;
  ImageTile({this.image,this.desc});
  @override
  _ImageTileState createState() => _ImageTileState();
}

class _ImageTileState extends State<ImageTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: screenHeight(context,dividedBy: 80),),
        decoration: BoxDecoration(
            color: Constants.kitGradients[0],
            borderRadius: BorderRadius.circular(15),
            boxShadow:[BoxShadow(
              blurRadius: 4,
                offset: Offset(3,5),
                color: Colors.grey
            )]
        ),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15)),
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: widget.image,fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: screenHeight(context,dividedBy: 16),
            padding: EdgeInsets.symmetric(horizontal: screenWidth(context,dividedBy: 50),vertical: screenWidth(context,dividedBy: 50)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15)),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: screenWidth(context,dividedBy: 3),
                      child: Column(
                        children: [
                          Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit.",style: TextStyle(fontSize: screenWidth(context,dividedBy: 40),fontWeight: FontWeight.bold)),
                          SizedBox(height: screenWidth(context,dividedBy: 100),),
                          Align(
                            alignment: Alignment.bottomLeft,
                              child: Text("10:25 Am",style: TextStyle(fontSize: screenWidth(context,dividedBy: 55),color: Colors.red)))
                        ],
                      ),
                    ),
                    Container(
                      width: screenWidth(context, dividedBy: 15),
                      height: screenWidth(context, dividedBy: 11),
                      child: CachedNetworkImage(
                        imageUrl:  "https://www.pngfind.com/pngs/m/611-6118299_avengers-endgame-logo-png-free-background-avengers-end.png",
                        imageBuilder: (context, imageProvider) =>
                            Container(
                              width: screenWidth(context, dividedBy: 15),
                              height: screenWidth(context, dividedBy: 15),
                              decoration: BoxDecoration(
                                // color: Constants.kitGradients[2],
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover),
                              ),
                            ),
                        placeholder: (context, url) => Container(
                          width: screenWidth(context, dividedBy: 15),
                          height: screenWidth(context, dividedBy: 15),
                          decoration: BoxDecoration(
                            // color: Constants.kitGradients[2],
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.grey.withOpacity(0.5),width: 0.5)
                          ),
                          child: Center(
                            heightFactor: 1,
                            widthFactor: 1,
                            child: SizedBox(
                              height: 16,
                              width: 16,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation(
                                    Colors.grey.withOpacity(0.5)),
                                strokeWidth: 2,
                              ),
                            ),
                          ),
                        ),
                        //fit: BoxFit.cover,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
