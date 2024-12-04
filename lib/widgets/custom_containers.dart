import 'package:flutter/material.dart';

class CustomContainers {
  static Container kowriCustomContainerRoundedEdges(
      {required Widget child,
      required BuildContext context,
      BoxConstraints? boxConstraints,
      double? height,
      double? width,
      double? borderRadius,
      double? verticalMargin,
      double? verticalPadding,
      double? horizontalMargin,
      double? horizontalPadding}) {
    return Container(
        height: height,
        width: width,
        constraints: boxConstraints,
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? 10,
          vertical: verticalPadding ?? 10,
        ),
        margin: EdgeInsets.symmetric(
            horizontal: horizontalMargin ?? 10, vertical: verticalMargin ?? 0),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            borderRadius:
                BorderRadius.all(Radius.circular(borderRadius ?? 15))),
        child: child);
  }

  static Container kowriCustomCirclesContainerRoundedEdges(
      {required Widget child,
      required BuildContext context,
      double? height,
      double? topPadding,
      double? bottomPadding,
      double? horizontalMargin,
      double? verticalMargin,
      double? leftPadding,
      double? rightPadding}) {
    return Container(
        height: height,
        padding: EdgeInsets.only(
            top: topPadding ?? 0,
            bottom: bottomPadding ?? 0,
            left: leftPadding ?? 10,
            right: rightPadding ?? 10),
        margin: EdgeInsets.symmetric(
            vertical: verticalMargin ?? 0, horizontal: horizontalMargin ?? 10),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            borderRadius: const BorderRadius.all(Radius.circular(15))),
        child: child);
  }
}
