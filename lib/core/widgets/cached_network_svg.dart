import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CachedNetworkSvg extends StatelessWidget {
  final String url;
  final Widget? placeholder;
  final Widget? errorWidget;
  final double? width;
  final double? height;
  final BoxFit fit;

  const CachedNetworkSvg({
    Key? key,
    required this.url,
    this.placeholder,
    this.errorWidget,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<File>(
      // Use DefaultCacheManager to fetch and cache the file
      future: DefaultCacheManager().getSingleFile(url),
      builder: (context, snapshot) {
        // 1. Show placeholder while loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return placeholder ??
              Container(
                width: width,
                height: height,
                alignment: Alignment.center,
                child: const CircularProgressIndicator(),
              );
        }

        // 2. Show error widget if something went wrong
        if (snapshot.hasError) {
          return errorWidget ??
              Container(
                width: width,
                height: height,
                alignment: Alignment.center,
                child: const Icon(Icons.error, color: Colors.red),
              );
        }

        // 3. Show the SVG from the cached file
        if (snapshot.hasData) {
          return SvgPicture.file(
            snapshot.data!,
            width: width,
            height: height,
            fit: fit,
          );
        }

        // 4. Fallback (shouldn't be reached, but good to have)
        return errorWidget ??
            Container(
              width: width,
              height: height,
              alignment: Alignment.center,
              child: const Icon(Icons.error_outline, color: Colors.grey),
            );
      },
    );
  }
}
