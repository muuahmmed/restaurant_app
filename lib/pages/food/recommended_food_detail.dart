import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restuarant/utils/colors.dart';
import 'package:restuarant/utils/dimensions.dart';
import 'package:restuarant/widgets/app_icon.dart';
import 'package:restuarant/widgets/big_text.dart';
import 'package:restuarant/widgets/collapsible_widget.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/image/pizza.jpg",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20),
                  ),
                ),
                // margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5, bottom: 10),
                alignment: Alignment.center,
                child: Center(child: BigText(text: "Pizza Margherita")),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(
                left: Dimensions.width20,
                right: Dimensions.width20,
              ),
              child: ExpandableTextWidget(
                text:'Freshly baked dough topped with a rich tomato sauce, melted mozzarella cheese, '
                'and your choice of delicious toppings. The perfect mix of crispy crust and gooey cheese '
                'makes every bite unforgettable. This pizza is cooked in a traditional stone oven '
                'to ensure a crispy base and a flavorful finish. Whether you prefer classic toppings '
                'or something unique, thiqwdqrwejfekrlw knjgkjtktrkjtkjktrkltlktl,lthrrjhjkqrhjkhqejk;hqgrejkhkerkg;jreh;kjqjgerh;krehgkjrhe;jkgjhqergh;k HKJ HRGKJJHGJKJREH;/QGWERFTGWEQ RGRRWE  GGGGGGG G G G G G G G G DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDWQQQQQQQQQQQQQQQQQQQQQQQQQWQ QWFDDDDDDDDDDDDDDDDDDDDDDEeewwwwwwwwwwwwwwwwwwwEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEWQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDwwwwwwwwwwwwwwwDDDDDDDDDDDDDG G G G G G G G G G G G G G G G G     QQRORIEQIOR9843s pizza will satisfy your cravings every time!',
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              AppIcon(icon: Icons.remove, iconColor: Colors.white, backgroundColor: AppColors.mainColor,),
              SizedBox(width: Dimensions.width10,),
              BigText(text: "0"),
              SizedBox(width: Dimensions.width10,),
              AppIcon(icon: Icons.add, iconColor: Colors.white, backgroundColor: AppColors.mainColor,),
            ],
          )
        ],
      ),
    );
  }
}
