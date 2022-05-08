import 'package:flutter/material.dart';

import '/core/constants.dart';
import '../dimentions.dart';

class BigText extends StatelessWidget {
  final String text;
  final Color color;
  final double? fontSize;
  final TextAlign? textAlign;
  final TextOverflow overflow;

  const BigText(
    this.text, {
    Key? key,
    this.color = Colors.black,
    this.overflow = TextOverflow.ellipsis,
    this.fontSize,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: TextStyle(
        fontSize: fontSize ?? 22,
        color: color,
        fontWeight: FontWeight.bold,
      ),
      textAlign: textAlign,
    );
  }
}

class HeightSpace extends StatelessWidget {
  final double? height;

  const HeightSpace([this.height]);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height ?? Dimensions.size(context: context, value: 10));
  }
}

class MText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final TextAlign? textAlign;
  final int? maxLines;

  const MText(
    this.text, {
    Key? key,
    this.color,
    this.fontSize,
    this.textAlign,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize ?? 16,
        color: color ?? Constants.darkGrey,
      ),
      maxLines: maxLines,
    );
  }
}

class LText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final TextAlign? textAlign;
  final int? maxLines;

  const LText(
    this.text, {
    Key? key,
    this.color,
    this.fontSize,
    this.textAlign,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize ?? 18,
        color: color ?? Constants.darkGrey,
      ),
    );
  }
}

class SText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final TextAlign? textAlign;

  const SText(
    this.text, {
    Key? key,
    this.color,
    this.fontSize,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize ?? 14,
        color: color ?? Colors.grey,
      ),
    );
  }
}

class WidthSpace extends StatelessWidget {
  final double? width;
  const WidthSpace([this.width]);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? Dimensions.size(context: context, value: 10),
    );
  }
}

class CircularContainer extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final Widget child;
  final double? height;
  final double? width;
  final double? raduis;

  const CircularContainer({
    Key? key,
    this.padding,
    this.margin,
    required this.child,
    this.color,
    this.height,
    this.width,
    this.raduis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding ??
          EdgeInsets.all(
            raduis ?? Dimensions.size(context: context, value: 20),
          ),
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: BorderRadius.circular(
          Dimensions.size(
            context: context,
            value: 16,
          ),
        ),
      ),
      child: child,
    );
  }
}

class IconContainer extends StatelessWidget {
  final VoidCallback? onClick;
  final IconData icon;
  final Color? color;
  final Color? iconColor;
  final double? width;
  final double? height;

  const IconContainer({
    Key? key,
    required this.icon,
    required this.onClick,
    this.width,
    this.height,
    this.color,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: GestureDetector(
        child: CircularContainer(
          padding: EdgeInsets.all(Dimensions.size(context: context, value: 6)),
          child: Center(
            child: Icon(
              icon,
              color: iconColor ?? Colors.white,
            ),
          ),
          color: color ?? Theme.of(context).primaryColor,
        ),
        onTap: onClick,
      ),
    );
  }
}

class IconText extends StatelessWidget {
  final IconData icon;
  final Widget title;
  final double? iconSize;
  final Color? iconColor;

  const IconText(
    this.icon,
    this.title, {
    this.iconSize,
    this.iconColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: iconSize,
        ),
        const SizedBox(
          width: 4,
        ),
        title
      ],
    );
  }
}

class ErrorWithButtonWidget extends StatelessWidget {
  final VoidCallback onTryAgainPressd;
  final String? buttonText;
  final String? errorMessage;
  final Color? textAndIconColor;
  final double? iconSize;
  final IconData? iconData;

  const ErrorWithButtonWidget({
    required this.onTryAgainPressd,
    this.buttonText,
    this.errorMessage,
    this.iconSize,
    this.textAndIconColor,
    this.iconData,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData ?? Icons.error_outline_rounded,
            color: textAndIconColor ?? Colors.red[700],
          ),
          const HeightSpace(),
          MText(
            errorMessage ?? 'Error Happend',
            color: textAndIconColor ?? Colors.red[700],
          ),
          const HeightSpace(),
          ElevatedButton(
            child: MText(
              buttonText ?? 'Try Again',
              color: Colors.white,
            ),
            onPressed: () {
              onTryAgainPressd();
            },
          ),
        ],
      ),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class ContentOrLoading extends StatelessWidget {
  final bool isLoading;
  final Widget onLoading;
  final Widget onLoaded;

  const ContentOrLoading({
    Key? key,
    required this.isLoading,
    required this.onLoading,
    required this.onLoaded,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isLoading ? onLoading : onLoaded;
  }
}
