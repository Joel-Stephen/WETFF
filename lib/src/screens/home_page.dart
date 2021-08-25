import 'package:app_template/src/utils/utils.dart';
import 'package:app_template/src/widgets/bottom_bar.dart';
import 'package:app_template/src/widgets/category_tile.dart';
import 'package:app_template/src/widgets/image_tile.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> category = [
    "Trending",
    "Food",
    "Activity",
    "Shopping",
    "Sports",
    "News",
    "Fashion",
  ];
  List<String> imageList = [
    'https://mcdn.wallpapersafari.com/medium/1/17/ZMBC10.jpg',
    'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
    'https://cdn.pixabay.com/photo/2020/09/18/19/31/laptop-5582775_960_720.jpg',
    'https://media.istockphoto.com/photos/woman-kayaking-in-fjord-in-norway-picture-id1059380230?b=1&k=6&m=1059380230&s=170667a&w=0&h=kA_A_XrhZJjw2bo5jIJ7089-VktFK0h0I4OWDqaac0c=',
    'https://cdn.pixabay.com/photo/2019/11/05/00/53/cellular-4602489_960_720.jpg',
    'https://cdn.pixabay.com/photo/2017/02/12/10/29/christmas-2059698_960_720.jpg',
    'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/02/06/20/01/university-library-4825366_960_720.jpg',
    'https://cdn.pixabay.com/photo/2015/06/19/21/24/avenue-815297__480.jpg',
    'https://cdn.pixabay.com/photo/2020/12/13/16/22/snow-5828736_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/12/09/09/27/women-5816861_960_720.jpg',
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark),
      child: Scaffold(
        body: Container(
          height: screenHeight(context, dividedBy: 1),
          width: screenWidth(context, dividedBy: 1),
          child: Stack(
            children: [
              Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight(context, dividedBy: 60),
                  // horizontal: screenHeight(context, dividedBy: 60)
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: screenHeight(context, dividedBy: 25),
                    ),
                    Container(
                      height: screenHeight(context, dividedBy: 15),
                      width: screenWidth(context, dividedBy: 1),
                      padding: EdgeInsets.symmetric(
                          horizontal: screenHeight(context, dividedBy: 60)),
                      child: Row(
                        children: [
                          Spacer(),
                          Container(
                            child: CachedNetworkImage(
                              imageUrl:
                                  "https://www.pngfind.com/pngs/m/611-6118299_avengers-endgame-logo-png-free-background-avengers-end.png",
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                width: screenWidth(context, dividedBy: 10),
                                height: screenWidth(context, dividedBy: 10),
                                decoration: BoxDecoration(
                                  // color: Constants.kitGradients[2],
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.cover),
                                ),
                              ),
                              placeholder: (context, url) => Container(
                                width: screenWidth(context, dividedBy: 10),
                                height: screenWidth(context, dividedBy: 10),
                                decoration: BoxDecoration(
                                    // color: Constants.kitGradients[2],
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.grey.withOpacity(0.5),
                                        width: 0.5)),
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
                          ),
                          SizedBox(width: screenWidth(context, dividedBy: 25)),
                          Text(
                            "Feed",
                            style: TextStyle(
                                fontSize: screenWidth(context, dividedBy: 15),
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(width: screenWidth(context, dividedBy: 2.4)),
                          Icon(Icons.add,
                              color: Colors.black.withOpacity(0.5),
                              size: screenWidth(context, dividedBy: 12)),
                          SizedBox(width: screenWidth(context, dividedBy: 20)),
                          Icon(Icons.mail_outline_outlined,
                              color: Colors.black.withOpacity(0.5),
                              size: screenWidth(context, dividedBy: 12)),
                          Spacer()
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenHeight(context, dividedBy: 100),
                    ),
                    Container(
                      height: screenHeight(context, dividedBy: 15),
                      width: screenWidth(context, dividedBy: 1),
                      padding: EdgeInsets.symmetric(
                          horizontal: screenHeight(context, dividedBy: 60)),
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: category.length,
                        padding: EdgeInsets.zero,
                        itemBuilder: (BuildContext context, int index) {
                          return CategoryTile(
                            categoryName: category[index],
                          );
                        },
                      ),
                    ),
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.only(
                            left: screenHeight(context, dividedBy: 80)),
                        child: StaggeredGridView.countBuilder(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 12,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: imageList.length,
                            itemBuilder: (context, index) {
                              return ImageTile(
                                image: imageList[index],
                              );
                            },
                            staggeredTileBuilder: (index) {
                              return StaggeredTile.count(
                                  1, index.isEven ? 1.2 : 1.8);
                            }),
                      ),
                    ),
                    SizedBox(height: screenHeight(context,dividedBy: 15),)
                  ],
                ),
              ),
              Positioned(bottom: 0, child: CustomBottomBar())
            ],
          ),
        ),
      ),
    );
  }
}
