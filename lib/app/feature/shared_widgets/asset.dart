import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Asset extends StatelessWidget {
  final dynamic asset;
  final double? height;
  final double? width;
  final Color? color;
  final Widget? placeholder;
  final Widget? errorWidget;

  const Asset({
    Key? key,
    required this.asset,
    this.height,
    this.width,
    this.color,
    this.placeholder,
    this.errorWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return renderAsset(asset, width: width ?? 100.w, height: height ?? 100.h);
  }

  AssetType assetType(dynamic asset) {
    if (asset is IconData) return AssetType.Icon;
    if (asset == null) return AssetType.None;

    String format = asset.split('.').last.toLowerCase();
    if (asset.toString().startsWith('http')) {
      return AssetType.Network;
    } else if (format == 'json') {
      return AssetType.Lottie;
    } else if (format == 'svg') {
      return AssetType.Svg;
    } else if (format == 'png' || format == 'jpg' || format == 'jpeg') {
      if (asset.toString().startsWith('assets/')) {
        return AssetType.ImageAsset;
      } else {
        return AssetType.ImageFile;
      }
    } else if (asset.toString().startsWith('http')) {
      return AssetType.Network;
    } else {
      throw Exception(
          'Wrong asset: the asset must be png, jpg, jpeg, svg or json');
    }
  }

  Widget errorBuilder(BuildContext context, Object obj, StackTrace? trace) {
    return errorWidget ?? const SizedBox.shrink();
  }

  Widget renderAsset(dynamic asset,
      {required double width, required double height}) {
    AssetType type = assetType(asset);
    if (type == AssetType.ImageAsset) {
      return Image.asset(
        asset,
        height: height,
        width: width,
        color: color,
        errorBuilder: errorBuilder,
      );
    } else if (type == AssetType.ImageFile) {
      return Image.file(
        File(asset),
        height: height,
        width: width,
        color: color,
        errorBuilder: errorBuilder,
      );
    } else if (type == AssetType.Icon) {
      return Icon(asset, size: height, color: color);
    } else if (type == AssetType.Network) {
      return Container(
        height: height,
        width: width,
        child: CachedNetworkImage(
          imageUrl: asset,
          height: height,
          width: width,
          // progressIndicatorBuilder: (context, url, downloadProgress) =>Container(
          //     margin: EdgeInsets.only(
          //         top: 100.h,
          //         bottom: 100.h
          //     ),
          //     child: CircularProgressIndicator(
          //         value: downloadProgress.progress,
          //         strokeWidth: 4,
          //         color: primaryColor)),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          placeholder:(context, url) => SizedBox(
              height: 10.h,
              width: 10.w,
              child: CircularProgressIndicator(
                backgroundColor: Colors.red,
              ),
          ),
        )
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}

enum AssetType { Lottie, ImageAsset, ImageFile, Svg, Icon, Network, None }
