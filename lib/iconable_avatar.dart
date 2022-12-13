library iconable_avatar;

import 'dart:math';
import 'package:flutter/material.dart';
import 'SegmentCircle.dart';

/// Widget to show an avatar with a bottom section with a tappable icon
class IconableAvatar extends StatefulWidget {
  /// Double value to indicate the avatar radius
  late final double _radius;

  /// Double value to indicate the avatar radius when using a not CircleAvatar widget
  final double? customRadius;

  /// Widget to use as avatar, make sure to use an avatar, if not, use the custom radius prop to indicate the avatar radius
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

  IconableAvatar(
      {Key? key,
      required this.avatar,
      this.iconVisible = true,
      this.onIconTap,
      this.icon = Icons.camera_alt,
      this.iconColor = Colors.black,
      this.backgroundIconColor = const Color.fromRGBO(0, 0, 0, 0.3),
      this.customRadius})
      : super(key: key) {
    if (customRadius == null) {
      assert(avatar is CircleAvatar);
      CircleAvatar _avatar = avatar as CircleAvatar;
      _radius = _avatar.radius!;
    } else {
      _radius = customRadius!;
    }
  }

  @override
  State<IconableAvatar> createState() => _IconableAvatarState();
}

class _IconableAvatarState extends State<IconableAvatar> {
  late double diameter, radius, width, height;

  @override
  void initState() {
    super.initState();
    radius = widget._radius;
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
          child: Visibility(
            visible: widget.iconVisible!,
            child: ClipPath(
              clipper: SegmentCircle(radius: radius),
              child: Container(
                color: widget.backgroundIconColor,
                width: width,
                height: height,
                child: Center(
                  child: InkWell(
                    onTap: widget.onIconTap,
                    child: Icon(
                      widget.icon,
                      size: height * 0.85,
                      color: widget.iconColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
