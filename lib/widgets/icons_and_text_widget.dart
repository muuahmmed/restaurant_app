import 'package:flutter/material.dart';
import 'package:restuarant/utils/dimensions.dart';
import 'package:restuarant/widgets/small_text.dart';

class IconsAndTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  const IconsAndTextWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: Dimensions.iconsSize24,),
        SizedBox(width: 5),
        SmallText( text: text, ),
      ],
    );
  }
}
