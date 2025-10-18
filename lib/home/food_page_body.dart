import 'package:flutter/material.dart';
import 'package:restuarant/utils/colors.dart';
import 'package:restuarant/widgets/big_text.dart';

import '../widgets/icons_and_text_widget.dart';
import '../widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
        print('current value is $_currentPageValue');
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      height: 320,
      child: PageView.builder(
        controller: pageController,
        itemCount: 5,
        itemBuilder: (context, position) {
          return _buildPageItem(position);
        },
      ),
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = new Matrix4.identity();
    if(index == _currentPageValue.floor()){
      var currScale = 1 - (_currentPageValue - index) * (1 - 0.8);
      var currTrans = 220 * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    } else if(index == _currentPageValue.floor() + 1){
      var currScale = 0.8 + (_currentPageValue - index + 1) * (1 - 0.8);
      var currTrans = 220 * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    } else if(index == _currentPageValue.floor() - 1){
      var currScale = 1 - (_currentPageValue - index) * (1 - 0.8);
      var currTrans = 220 * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      var currTrans = 220 * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }
    return Stack(
      children: [
        Container(
          height: 220,
          margin: EdgeInsets.only(left: 5, right: 5),
          decoration: BoxDecoration(
            color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(
              image: AssetImage('assets/image/banner.png'),
              fit: BoxFit.fill,
            ),
          ),
          alignment: Alignment.center,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 140,
            margin: EdgeInsets.only(left: 30, right: 30, bottom: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.only(top: 15, left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: 'Chinese Side'),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Wrap(
                        children: List.generate(5, (index) {
                          return Icon(
                            Icons.star,
                            color: AppColors.mainColor,
                            size: 15,
                          );
                        }),
                      ),
                      SizedBox(width: 10),
                      SmallText(text: '4.5'),
                      SizedBox(width: 10),
                      SmallText(text: '1287 comments'),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: IconsAndTextWidget(
                          icon: Icons.circle,
                          text: 'Normal',
                          iconColor: AppColors.iconColor1,
                        ),
                      ),
                      // SizedBox(width: 10),
                      Expanded(
                        child: IconsAndTextWidget(
                          icon: Icons.location_on,
                          text: '1.7km',
                          iconColor: AppColors.mainColor,
                        ),
                      ),
                      Expanded(
                        child: IconsAndTextWidget(
                          icon: Icons.watch_later_outlined,
                          text: '32min',
                          iconColor: AppColors.iconColor2,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
