import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomLogoIcons extends StatelessWidget {
  const CustomLogoIcons(
      {super.key,
      required this.imageUrl,
      required this.height,
      this.isBillPayment = true,
      required this.width});

  final String imageUrl;
  final double width;
  final double height;
  final bool isBillPayment;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
      child: CachedNetworkImage(
        height: height,
        width: width,
        imageUrl: imageUrl,
        imageBuilder: (context, imageProvider) => Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.contain,
            ),
          ),
        ),
        errorWidget: (context, url, error) => Container(
          width: width,
          height: height,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: ClipOval(
            child: SvgPicture.asset(
                isBillPayment
                    ? "assets/svgs/default_logo_icon.svg"
                    : "assets/svgs/default_send_money_logo_icon.svg",
                width: width,
                height: height,
                fit: BoxFit.contain),
          ),
        ),
      ),
    );
  }
}
