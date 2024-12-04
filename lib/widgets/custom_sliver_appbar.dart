import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class CustomSliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final String? bannerUrl;
  final String? displayName;
  final String? facebookLink;
  final String? whatsappLink;
  final String? telegramLink;

  CustomSliverAppBar({
    required this.expandedHeight,
    this.bannerUrl,
    this.displayName,
    this.facebookLink,
    this.whatsappLink,
    this.telegramLink,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      children: [
        bannerUrl!.isNotEmpty
            ? Image.network(
                bannerUrl!,
                fit: BoxFit.cover,
              )
            : Image.asset(
                'assets/images/circle_banner_placeholder.png',
                fit: BoxFit.cover,
              ),
        Container(
          color: Colors.black.withOpacity(0.6),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              displayName!,
              style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w600,
              ),
            ),
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 16,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            actions: [
              // IconButton(
              //   icon: const Icon(Icons.search),
              //   onPressed: () => CustomBottomSheets.defaultBottomSheet(
              //       context: context,
              //       backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              //       content: SliverToBoxAdapter(child: SearchKowri())),
              // ),
            ],
          ),
        ),
        Positioned(
          bottom: 50,
          left: 0,
          right: 0,
          child: _buildSocialMediaIcons(),
        ),
      ],
    );
  }

  Widget _buildSocialMediaIcons() {
    final List<Widget> icons = [];

    if (facebookLink!.isNotEmpty) {
      icons.add(_buildSocialMediaIcon('assets/svgs/facebook.svg'));
    }
    if (whatsappLink!.isNotEmpty) {
      icons.add(_buildSocialMediaIcon('assets/svgs/whatsapp.svg'));
    }
    if (telegramLink!.isNotEmpty) {
      icons.add(_buildSocialMediaIcon('assets/svgs/telegram.svg'));
    }

    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: icons,
      ),
    );
  }

  Widget _buildSocialMediaIcon(String assetPath) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 16),
      child: SvgPicture.asset(
        assetPath,
        width: 50,
        height: 50,
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
