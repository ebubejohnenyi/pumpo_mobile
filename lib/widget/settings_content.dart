import 'package:flutter/material.dart';

class SettingsContent extends StatelessWidget {
  const SettingsContent({
    super.key,
    required this.title,
    this.onTap,
    this.hintTitle,
    this.suffixIcon,
    this.prefixIcon,
    this.prefixImage,
    this.suffixWidget,
  });

  final String title;
  final String? hintTitle;
  final void Function()? onTap;
  final IconData? suffixIcon;
  final Widget? suffixWidget;
  final IconData? prefixIcon;
  final String? prefixImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              hintTitle != null
                  ? Text(
                      hintTitle!,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Colors.grey.shade200,
                      ),
                    )
                  : SizedBox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      prefixImage != null
                          ? Image.asset(
                              prefixImage!,
                              fit: BoxFit.cover,
                              width: 25,
                              height: 25,
                            )
                          : SizedBox(),
                      prefixImage != null
                          ? SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02,
                            )
                          : SizedBox(),
                      prefixIcon != null ? Icon(prefixIcon) : SizedBox(),
                      prefixIcon != null
                          ? SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02,
                            )
                          : SizedBox(),
                      Text(
                        title,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  suffixIcon != null
                      ? Icon(suffixIcon!)
                      : suffixWidget != null
                      ? suffixWidget!
                      : SizedBox(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
