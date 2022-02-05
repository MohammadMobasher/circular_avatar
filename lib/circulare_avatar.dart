library circular_avatar;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CircularAvatar extends StatefulWidget {
  /// The text supplied. Only first character will be displayed.
  final String urlAvatar;

  /// Height of the [TextDrawable] widget.
  final double height;

  /// Width of the [TextDrawable] widget.
  final double width;

  /// Background color to for the widget.
  /// If not specified, a random color will be generated.
  final Color? backgroundColor;

  /// sets radius of the avatar circle, [borderWidth] is also included in this radius.
  /// default value is 0.0
  final double radius;

  /// sets the borderWidth of the circile,
  /// default value is 0.0
  final double borderWidth;

  /// The color with which to fill the border of the circle.
  /// default value [Colors.white]
  final Color borderColor;

  /// Widget displayed while the target [imageUrl] failed loading, works only if [cacheImage] is true.
  final LoadingErrorWidgetBuilder? errorWidget;

  const CircularAvatar({
    Key? key,
    required this.urlAvatar,
    this.backgroundColor,
    this.radius = 50.0,
    this.height = 45,
    this.width = 45,
    this.borderWidth = 0.0,
    this.borderColor = Colors.white,
    this.errorWidget,
  }) : super(key: key);

  @override
  _CircularAvatarState createState() => _CircularAvatarState();
}

class _CircularAvatarState extends State<CircularAvatar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        color: Colors.lightBlue,
        borderRadius: BorderRadius.circular(widget.radius),
        border: Border.all(
          width: widget.borderWidth,
          color: widget.borderColor,
        ),
      ),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            height: widget.height,
            width: widget.width,
            imageUrl: widget.urlAvatar,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: widget.errorWidget ??
                (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
