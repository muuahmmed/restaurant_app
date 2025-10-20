import 'package:flutter/material.dart';
import 'package:restuarant/utils/colors.dart';
import 'package:restuarant/utils/components.dart';
import 'package:restuarant/utils/dimensions.dart';
import 'package:restuarant/widgets/app_icon.dart';
import '../../widgets/app_column.dart';
import '../../widgets/big_text.dart';
import '../home/main_food_page.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        height: 140,
        padding: EdgeInsets.only(
          top: Dimensions.height30,
          bottom: Dimensions.height30,
          left: Dimensions.width20,
          right: Dimensions.width20,
        ),
        decoration: BoxDecoration(
          color: AppColors.buttonBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius20 * 2),
            topRight: Radius.circular(Dimensions.radius20 * 2),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(
                top: Dimensions.height20,
                bottom: Dimensions.height20,
                left: Dimensions.width20,
                right: Dimensions.width20,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(Dimensions.radius20),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.remove,
                    color: AppColors.signColor,
                    size: Dimensions.iconsSize24,
                  ),
                  SizedBox(width: Dimensions.width10),
                  BigText(text: '0'),
                  SizedBox(width: Dimensions.width10),
                  Icon(
                    Icons.add,
                    color: AppColors.signColor,
                    size: Dimensions.iconsSize24,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: Dimensions.height20,
                bottom: Dimensions.height20,
                left: Dimensions.width20,
                right: Dimensions.width20,
              ),
              decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.circular(Dimensions.radius20),
              ),
              child: BigText(
                text: '\$10 | Add to cart',
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      //
      body: Stack(
        children: [
          //background image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.popularFoodImgSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/image/pizza.jpg'),
                ),
              ),
            ),
          ),
          Positioned(
            left: Dimensions.width20,
            right: Dimensions.width20,
            top: Dimensions.height45,
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      navigateTo(context, MainFoodPage());
                    },
                    icon: AppIcon(icon: Icons.arrow_back_ios, ),
                   ),
                Spacer(),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
          ),
          Positioned(
            top: Dimensions.popularFoodImgSize - 20,
            left: 0,
            right: 0,
            bottom: 0, // ✅ add bottom to allow scrolling down
            child: Container(
              padding: EdgeInsets.only(
                left: Dimensions.width20,
                right: Dimensions.width20,
                top: Dimensions.height20,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimensions.radius20),
                  topLeft: Radius.circular(Dimensions.radius20),
                ),
              ),
              child: SingleChildScrollView( // ✅ wrap AppColumn
                physics: const BouncingScrollPhysics(),
                child: AppColumn(),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
