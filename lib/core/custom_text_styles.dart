import 'package:flutter/material.dart';
import 'package:flutter_movie_code_test/constants/app_color.dart';

extension CustomTextExtension on Text {
  Text get bold => copyWith(
      style: style?.copyWith(fontWeight: FontWeight.w600) ??
          const TextStyle(fontWeight: FontWeight.w600));

  Text get primaryColor => copyWith(
      style: style?.copyWith(color: AppColor.primaryColor) ??
          const TextStyle(color: AppColor.primaryColor));

  Text get redColor => copyWith(
      style:
          style?.copyWith(color: AppColor.redColor) ?? const TextStyle(color: AppColor.redColor));

  Text get greyColor => copyWith(
      style: style?.copyWith(color: AppColor.grey) ?? const TextStyle(color: AppColor.grey));

  Text get black => copyWith(
      style: style?.copyWith(color: AppColor.black) ?? const TextStyle(color: AppColor.black));

  Text get white => copyWith(
      style: style?.copyWith(color: AppColor.white) ?? const TextStyle(color: AppColor.white));

  Text get secondaryColor => copyWith(
      style: style?.copyWith(color: AppColor.secondaryColor) ??
          const TextStyle(color: AppColor.secondaryColor));

  Text fontSize(double size) =>
      copyWith(style: style?.copyWith(fontSize: size) ?? TextStyle(fontSize: size));

  Text get bodySmall =>
      copyWith(style: style?.copyWith(fontSize: 12.0) ?? const TextStyle(fontSize: 12.0));

  Text get bodyMedium =>
      copyWith(style: style?.copyWith(fontSize: 14.0) ?? const TextStyle(fontSize: 14.0));

  Text get bodyLarge =>
      copyWith(style: style?.copyWith(fontSize: 16.0) ?? const TextStyle(fontSize: 16.0));

  Text get headSmall =>
      copyWith(style: style?.copyWith(fontSize: 18.0) ?? const TextStyle(fontSize: 18.0));

  Text get headMedium =>
      copyWith(style: style?.copyWith(fontSize: 20.0) ?? const TextStyle(fontSize: 20.0));

  Text get headLarge =>
      copyWith(style: style?.copyWith(fontSize: 22.0) ?? const TextStyle(fontSize: 22.0));

  // bolds
  Text get bodySmallBold => copyWith(
      style: style?.copyWith(fontSize: 12.0, fontWeight: FontWeight.bold) ??
          const TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold));

  Text get bodyMediumBold => copyWith(
      style: style?.copyWith(fontSize: 14.0, fontWeight: FontWeight.bold) ??
          const TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold));

  Text get bodyLargeBold => copyWith(
      style: style?.copyWith(fontSize: 16.0, fontWeight: FontWeight.bold) ??
          const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold));

  Text get headSmallBold => copyWith(
      style: style?.copyWith(fontSize: 18.0, fontWeight: FontWeight.bold) ??
          const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold));

  Text get headMediumBold => copyWith(
      style: style?.copyWith(fontSize: 20.0, fontWeight: FontWeight.bold) ??
          const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold));

  Text get headLargeBold => copyWith(
      style: style?.copyWith(fontSize: 24.0, fontWeight: FontWeight.bold) ??
          const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold));

  Text copyWith({TextStyle? style}) {
    return Text(
      data ?? '',
      style: this.style?.merge(style) ?? style,
      key: key,
      strutStyle: strutStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      overflow: overflow,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
    );
  }
}

extension CustomTextColorExtension on TextStyle {
  TextStyle get primaryColor => copyWith(color: AppColor.primaryColor);
}
