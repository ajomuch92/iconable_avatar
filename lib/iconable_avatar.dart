library iconable_avatar;

import 'dart:math';
import 'package:flutter/material.dart';
import 'SegmentCircle.dart';

/// Widget to show an avatar with a bottom section with a tappable icon
class IconableAvatar extends StatefulWidget {
  /// Double value to indicate the avatar radius. Make sure to use the same avatar radius
  final double radius;

  /// Widget to use as avatar, make sure to use an avatar, if not, the widget won't work
  final Widget avatar;

  /// Bool value to indicate when to show or hide the bottom section
  final bool? iconVisible;

  /// Callback use when tap on icon
  final VoidCallback? onIconTap;

  /// Icondata to show on the bottom section. By default is Icons.camera_alt
  final IconData? icon;

  /// Color used as icon color
  final Color? iconColor;

  /// Color used as background for bottom section
  final Color? backgroundIconColor;

  IconableAvatar({
    Key? key,
    required this.radius,
    required this.avatar,
    this.iconVisible = true,
    this.onIconTap,
    this.icon = Icons.camera_alt,
    this.iconColor = Colors.black,
    this.backgroundIconColor = const Color.fromRGBO(0, 0, 0, 0.3),
  }) : super(key: key) {
    assert(avatar is CircleAvatar);
    CircleAvatar _avatar = avatar as CircleAvatar;
    assert(_avatar.radius == radius);
  }

  @override
  State<IconableAvatar> createState() => _IconableAvatarState();
}

class _IconableAvatarState extends State<IconableAvatar> {
  late double diameter, radius, width, height;

  @override
  void initState() {
    super.initState();
    radius = widget.radius;
    diameter = radius * 2;
    height = diameter / 5;
    _getWidth();
  }

  /// Method to get the width for bottom container based on radius
  void _getWidth() {
    double y = (diameter - diameter / 5) / 2;
    double x = sqrt(pow(radius, 2) - pow(y, 2));
    double distance = radius - x;
    double widthCalculated = diameter - distance;
    setState(() {
      width = widthCalculated;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        widget.avatar,
        Positioned(
          bottom: 0,
          child: ClipPath(
            clipper: SegmentCircle(radius: radius),
            child: AnimatedContainer(
              color: widget.backgroundIconColor,
              duration: const Duration(milliseconds: 200),
              width: width,
              height: widget.iconVisible! ? height : 0,
              child: IconButton(
                icon: Icon(
                  widget.icon,
                  size: height * 0.85,
                  color: widget.iconColor,
                ),
                onPressed: widget.onIconTap,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
