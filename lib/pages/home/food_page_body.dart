import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:restuarant/pages/food/popular_food_detail.dart';
import 'package:restuarant/pages/food/recommended_food_detail.dart';
import 'package:restuarant/utils/colors.dart';
import 'package:restuarant/utils/components.dart';
import 'package:restuarant/utils/dimensions.dart';
import 'package:restuarant/widgets/big_text.dart';
import '../../widgets/icons_and_text_widget.dart';
import '../../widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
        // print('current value is $_currentPageValue');
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
    return Column(
      children: [
        // Slider section
        InkWell(
          onTap: () {
            navigateTo(context, RecommendedFoodDetail());
          },
          child: SizedBox(
            // color: Colors.red,
            height: Dimensions.pageView,
            child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              },
            ),
          ),
        ),
        // Dots section
        DotsIndicator(
          dotsCount: 5,
          position: _currentPageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
        // Popular text
        SizedBox(height: Dimensions.height30),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Popular"),
              SizedBox(width: Dimensions.width10),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(text: ".", color: Colors.black26),
              ), // Container
              SizedBox(width: Dimensions.width10),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: SmallText(text: "Food pairing"),
              ), // Container
            ],
          ),
        ),
        //   list of food and images
        InkWell(
          onTap: () {
            navigateTo(context, PopularFoodDetail());
          },
          child: Container(
            height: 700,
            child: ListView.builder(
              itemCount: 10,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    bottom: Dimensions.height10,
                  ),
                  child: Row(
                    children: [
                      // Image section (left)
                      Container(
                        width: Dimensions.listViewImgSize,
                        height: Dimensions.listViewImgSize,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            Dimensions.radius20,
                          ),
                          color: Colors.white,
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/image/food.png'),
                          ),
                        ),
                      ),

                      SizedBox(width: Dimensions.width10),

                      // Text container (right)
                      Expanded(
                        child: Container(
                          height: Dimensions.listViewImgSize,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(Dimensions.radius20),
                              bottomRight: Radius.circular(Dimensions.radius20),
                            ),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: Dimensions.width10,
                              right: Dimensions.width10,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BigText(text: 'Nutritious fruit meal in China'),
                                SizedBox(height: Dimensions.height10),
                                SmallText(text: 'With Chinese characteristics'),
                                SizedBox(height: Dimensions.height10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconsAndTextWidget(
                                      icon: Icons.circle,
                                      text: 'Normal',
                                      iconColor: AppColors.iconColor1,
                                    ),
                                    IconsAndTextWidget(
                                      icon: Icons.location_on,
                                      text: '1.7km',
                                      iconColor: AppColors.mainColor,
                                    ),
                                    IconsAndTextWidget(
                                      icon: Icons.watch_later_outlined,
                                      text: '32min',
                                      iconColor: AppColors.iconColor2,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        SizedBox(height: Dimensions.height20),
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = Matrix4.identity();

    // Existing scaling logic
    if (index == _currentPageValue.floor()) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    // Animation progress for smooth effects
    double distance = (_currentPageValue - index).abs();
    double opacity = (1 - distance).clamp(0.6, 1.0);
    double slideOffset = (distance * 20).clamp(0, 20); // small slide effect

    return Transform(
      transform: matrix,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        opacity: opacity,
        child: AnimatedSlide(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          offset: Offset(0, distance > 1 ? 0.1 : slideOffset / 100),
          child: Stack(
            children: [
              Container(
                height: Dimensions.pageViewContainer,
                margin: EdgeInsets.only(
                  left: Dimensions.width10,
                  right: Dimensions.width10,
                ),
                decoration: BoxDecoration(
                  color: index.isEven
                      ? const Color(0xFF69c5df)
                      : const Color(0xFF9294cc),
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  image: const DecorationImage(
                    image: AssetImage('assets/image/banner.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                alignment: Alignment.center,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: Dimensions.pageViewTextContainer,
                  margin: EdgeInsets.only(
                    left: Dimensions.width30,
                    right: Dimensions.width30,
                    bottom: Dimensions.height30,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFe8e8e8).withOpacity(0.9),
                        blurRadius: 5.0,
                        offset: const Offset(0, 5),
                      ),
                      const BoxShadow(
                        color: Colors.white,
                        offset: Offset(-5, 0),
                      ),
                      const BoxShadow(
                        color: Colors.white,
                        offset: Offset(5, 0),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: Container(
                    padding: EdgeInsets.only(
                      top: Dimensions.radius15,
                      left: Dimensions.radius15,
                      right: Dimensions.radius15,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BigText(text: 'Chinese Side'),
                        SizedBox(height: Dimensions.height10),
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(5, (index) {
                                return Icon(
                                  Icons.star,
                                  color: AppColors.mainColor,
                                  size: Dimensions.radius15,
                                );
                              }),
                            ),
                            SizedBox(width: Dimensions.width10),
                            SmallText(text: '4.5'),
                            SizedBox(width: Dimensions.width10),
                            SmallText(text: '1287 comments'),
                          ],
                        ),
                        SizedBox(height: Dimensions.height20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconsAndTextWidget(
                              icon: Icons.circle,
                              text: 'Normal',
                              iconColor: AppColors.iconColor1,
                            ),
                            IconsAndTextWidget(
                              icon: Icons.location_on,
                              text: '1.7km',
                              iconColor: AppColors.mainColor,
                            ),
                            IconsAndTextWidget(
                              icon: Icons.watch_later_outlined,
                              text: '32min',
                              iconColor: AppColors.iconColor2,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
