import 'package:flutter/cupertino.dart';
import 'package:restuarant/utils/dimensions.dart';

// ignore: must_be_immutable
class BigText extends StatelessWidget {
  Color color;
  final String text;
  double size ;
  TextOverflow overFlow;

   BigText({
    super.key,
    this.color = const Color(0xFF332d2b),
    this.overFlow = TextOverflow.ellipsis,
    required this.text,
    this.size = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overFlow,
      style: TextStyle(
        color: color,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        fontSize: size==0?Dimensions.font20:size,
      ),
    );
  }
}
