import 'package:flutter/material.dart';

class TrackSuccessfulContent extends StatelessWidget {
  const TrackSuccessfulContent({
    super.key,
    required this.orderNumber,
    required this.title,
    required this.image,
  });

  final String orderNumber;
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 23, vertical: 10),
      decoration: BoxDecoration(
        color: Color(0x0D81B622),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              color: Color(0xFF3E8672),
              borderRadius: BorderRadius.all(Radius.circular(100)),
            ),
            child: Center(
              child: Text(
                orderNumber,
                style: Theme.of(
                  context,
                ).textTheme.titleSmall!.copyWith(color: Colors.white),
              ),
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.03),
          Expanded(child: Text(title)),
          Image.asset(image, fit: BoxFit.contain, width: 50, height: 50),
        ],
      ),
    );
  }
}
