library circular_avatar;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CircularAvatar extends StatefulWidget {
  /// The text supplied. Only first character will be displayed.
  final String urlAvatar;

  /// The text supplied. Only first character will be displayed.
  final String text;

  /// Height of the [TextDrawable] widget.
  final double height;

  /// Width of the [TextDrawable] widget.
  final double width;

  /// How to inscribe the image into the space allocated during layout.
  /// Set the [BoxFit] value as you want.
  final BoxFit imageFit;

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

  /// Widget displayed while the target [imageUrl] is loading, works only if [cacheImage] is true.
  final ProgressIndicatorBuilder? progressIndicatorBuilder;

  /// `TextStyle` for the `text` to be displayed.
  final TextStyle? textStyle;

  /// Cache the image against [imageUrl] in app memory if set true. it is true by default.
  final bool cacheImage;

  const CircularAvatar({
    Key? key,
    this.urlAvatar = "",
    this.text = "",
    this.cacheImage = true,
    this.backgroundColor,
    this.radius = 50.0,
    this.height = 45,
    this.width = 45,
    this.borderWidth = 0.0,
    this.borderColor = Colors.white,
    this.errorWidget,
    this.textStyle,
    this.progressIndicatorBuilder,
    this.imageFit = BoxFit.cover,
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
    Color? backgroundColor = Colors.red;

    // double contrast = ContrastHelper.contrast([
    //   backgroundColor!.red,
    //   backgroundColor!.green,
    //   backgroundColor!.blue,
    // ], [
    //   255,
    //   255,
    //   255
    // ] /** white text */);

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
          child: widget.urlAvatar.isNotEmpty
              ? (widget.cacheImage
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: CachedNetworkImage(
                        fit: widget.imageFit,
                        height: widget.height,
                        width: widget.width,
                        imageUrl: widget.urlAvatar,
                        progressIndicatorBuilder:
                            widget.progressIndicatorBuilder,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: widget.errorWidget ??
                            (context, url, error) => const Icon(Icons.error),
                      ),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(widget.radius),
                      child: Image.network(
                        widget.urlAvatar,
                        fit: widget.imageFit,
                      ),
                    ))
              : Text(
                  widget.text.isEmpty ? "" : widget.text[0].toUpperCase(),
                  style: widget.textStyle?.copyWith(
                          // color: contrast > 1.8 ? Colors.white : Colors.black,
                          ) ??
                      const TextStyle(
                        fontSize: 18,
                        // color: contrast > 1.8 ? Colors.white : Colors.black,
                      ),
                )),
    );
  }
}
