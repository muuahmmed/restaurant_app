import 'package:flutter/material.dart';
import 'package:restuarant/utils/colors.dart';
import 'package:restuarant/utils/components.dart';
import 'package:restuarant/utils/dimensions.dart';
import 'package:restuarant/widgets/app_icon.dart';
import 'package:restuarant/widgets/big_text.dart';
import 'package:restuarant/widgets/collapsible_widget.dart';
import '../home/main_food_page.dart';

class RecommendedFoodDetail extends StatefulWidget {
  const RecommendedFoodDetail({super.key});

  @override
  State<RecommendedFoodDetail> createState() => _RecommendedFoodDetailState();
}

class _RecommendedFoodDetailState extends State<RecommendedFoodDetail>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    // Start animation when screen builds
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          // 🔹 Animated App Bar with Hero image
          SliverAppBar(
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: "foodImageHero",
                child: Image.asset(
                  "assets/image/pizza.jpg",
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    navigateTo(context, MainFoodPage());
                  },
                  icon: const AppIcon(icon: Icons.clear),
                ),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20),
                  ),
                ),
                width: double.maxFinite,
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                alignment: Alignment.center,
                child: Center(
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: BigText(text: "Pizza Margherita"),
                  ),
                ),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
          ),

          // 🔹 Animated text body
          SliverToBoxAdapter(
            child: SlideTransition(
              position: _slideAnimation,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Container(
                  margin: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                  ),
                  child: ExpandableTextWidget(
                    text:
                        'Freshly baked dough topped with a rich tomato sauce, melted mozzarella cheese, '
                        'and your choice of delicious toppings. The perfect mix of crispy crust and gooey cheese '
                        'makes every bite unforgettable. This pizza is cooked in a traditional stone oven '
                        'to ensure a crispy base and a flavorful finish. Whether you prefer classic toppings '
                        'or something unique, this pizza will satisfy your cravings every time!',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

      // 🔹 Animated bottom bar
      bottomNavigationBar: SlideTransition(
        position: Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
            .animate(
              CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
            ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(
                left: Dimensions.width20 * 2.5,
                right: Dimensions.width20 * 2.5,
                top: Dimensions.height10,
                bottom: Dimensions.height10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(
                    icon: Icons.remove,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    size: Dimensions.iconsSize32,
                  ),
                  BigText(
                    text: "\$10.00  X  0",
                    color: Colors.black,
                    size: Dimensions.font26,
                  ),
                  AppIcon(
                    icon: Icons.add,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    size: Dimensions.iconsSize32,
                  ),
                ],
              ),
            ),
            Container(
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
                  // ❤️ Favorite button with animation
                  GestureDetector(
                    onTap: _toggleFavorite,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding: EdgeInsets.all(Dimensions.height20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          Dimensions.radius20,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Icon(
                        _isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: _isFavorite
                            ? AppColors.mainColor
                            : AppColors.mainColor,
                        size: Dimensions.iconsSize24,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: Dimensions.height20,
                      horizontal: Dimensions.width20,
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
          ],
        ),
      ),
    );
  }
}
