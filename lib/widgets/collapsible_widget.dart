import 'package:flutter/material.dart';
import 'package:restuarant/utils/dimensions.dart';
import 'package:restuarant/widgets/small_text.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({super.key, required this.text});

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;
  bool hiddenText = true;
  double textLimit =
      200; // <-- FIXED: use a character limit instead of pixel height

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textLimit) {
      firstHalf = widget.text.substring(0, textLimit.toInt());
      secondHalf = widget.text.substring(textLimit.toInt(), widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? Text(firstHalf)
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SmallText(
                  text: hiddenText
                      ? ("$firstHalf...")
                      : (firstHalf + secondHalf),
                  height: 1.8,
                  size: Dimensions.font16,
                  color: Colors.grey[700],
                ),
                const SizedBox(height: 5),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SmallText(
                        text: hiddenText ? "Show more" : "Show less",
                        color: Colors.blue,
                        size: Dimensions.font16,
                      ),
                      Icon(
                        hiddenText
                            ? Icons.arrow_drop_down
                            : Icons.arrow_drop_up,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
