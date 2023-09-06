import 'package:flutter/material.dart';
import 'package:practicas_flutter/core/theme/color.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CardGenericList extends StatelessWidget {
  const CardGenericList({
    super.key,
    required this.urlImage,
    required this.title,
    required this.subtitleHeader,
    this.subtitleInformation,
    this.onTap,
  });

  final String urlImage;
  final String title;
  final String subtitleHeader;
  final Widget? subtitleInformation;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTileCustom(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      backgroundColor: backgroundColorCardCharacter,
      leading: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
        child: Image.network(
          urlImage,
          height: 10.h,
          loadingBuilder: (_, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: Container(
                height: 8.h,
                color: mainGrey,
                padding: const EdgeInsets.all(20),
                child: const CircularProgressIndicator(color: mainWhite),
              ),
            );
          },
          errorBuilder: (_, __, stackTrace) {
            return Container(
              height: 8.h,
              color: mainGrey,
              padding: const EdgeInsets.all(20),
              child: const Icon(
                Icons.image_not_supported_rounded,
                color: mainWhite,
              ),
            );
          },
        ),
      ),
      title: Text(title, style: const TextStyle(color: Colors.black)),
      subtitle: Padding(
        padding: EdgeInsets.only(top: 1.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(subtitleHeader),
            if (subtitleInformation != null) SizedBox(height: 1.h),
            if (subtitleInformation != null) subtitleInformation!,
          ],
        ),
      ),
      trailing: Padding(
        padding: EdgeInsets.only(right: 2.w),
        child: const Icon(Icons.arrow_forward_ios_outlined),
      ),
    );
  }
}

class ListTileCustom extends StatelessWidget {
  const ListTileCustom({
    super.key,
    this.borderRadius,
    this.backgroundColor,
    this.leading,
    this.subtitle,
    this.title,
    this.trailing,
    this.onTap,
  });

  final BorderRadiusGeometry? borderRadius;
  final Color? backgroundColor;
  final Widget? leading;
  final Widget? title;
  final Widget? trailing;
  final Widget? subtitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: borderRadius,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (leading != null) leading!,
            SizedBox(
              width: 50.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title != null) title!,
                  if (subtitle != null) subtitle!,
                ],
              ),
            ),
            if (trailing != null) trailing!,
          ],
        ),
      ),
    );
  }
}
