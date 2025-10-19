import 'package:flutter/material.dart';
import 'package:restuarant/widgets/small_text.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';
import 'collapsible_widget.dart';
import 'icons_and_text_widget.dart';

class AppColumn extends StatefulWidget {
  const AppColumn({super.key});

  @override
  State<AppColumn> createState() => _AppColumnState();
}

class _AppColumnState extends State<AppColumn>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    // Start animation slightly after build
    Future.delayed(const Duration(milliseconds: 300), () {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: SlideTransition(
        position: _slideAnimation,
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🍕 Title
                AnimatedScale(
                  scale: 1.0,
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeOutBack,
                  child: BigText(text: 'Pizza', size: Dimensions.font26),
                ),
                SizedBox(height: Dimensions.height10),

                // ⭐ Rating Row
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

                // 🔸 Info Row
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
                SizedBox(height: Dimensions.height20),

                // 📜 Introduction Section
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: Dimensions.height20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BigText(text: 'Introduce'),
                        SizedBox(height: Dimensions.height20),
                        // ✅ Remove Expanded, wrap in scroll if needed
                        SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: ExpandableTextWidget(
                            text:
                                'Freshly baked dough topped with a rich tomato sauce, melted mozzarella cheese, '
                                'and your choice of delicious toppings. The perfect mix of crispy crust and gooey cheese '
                                'makes every bite unforgettable. This pizza is cooked in a traditional stone oven '
                                'to ensure a crispy base and a flavorful finish. Whether you prefer classic toppings '
                                'or something unique, this pizza will satisfy your cravings every time!',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: Dimensions.height20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
