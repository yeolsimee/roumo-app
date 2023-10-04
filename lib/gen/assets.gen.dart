/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/google.svg
  String get google => 'assets/images/google.svg';

  /// File path: assets/images/home_logo.png
  AssetGenImage get homeLogo =>
      const AssetGenImage('assets/images/home_logo.png');

  /// File path: assets/images/icon_arrow_open.svg
  String get iconArrowOpen => 'assets/images/icon_arrow_open.svg';

  /// File path: assets/images/icon_backarrow.svg
  String get iconBackarrow => 'assets/images/icon_backarrow.svg';

  /// File path: assets/images/icon_check.svg
  String get iconCheck => 'assets/images/icon_check.svg';

  /// File path: assets/images/icon_home_off.svg
  String get iconHomeOff => 'assets/images/icon_home_off.svg';

  /// File path: assets/images/icon_home_on.svg
  String get iconHomeOn => 'assets/images/icon_home_on.svg';

  /// File path: assets/images/icon_mypage_off.svg
  String get iconMypageOff => 'assets/images/icon_mypage_off.svg';

  /// File path: assets/images/icon_mypage_on.svg
  String get iconMypageOn => 'assets/images/icon_mypage_on.svg';

  /// File path: assets/images/icon_nonecheck.svg
  String get iconNonecheck => 'assets/images/icon_nonecheck.svg';

  /// File path: assets/images/icon_routine_off.svg
  String get iconRoutineOff => 'assets/images/icon_routine_off.svg';

  /// File path: assets/images/icon_routine_on.svg
  String get iconRoutineOn => 'assets/images/icon_routine_on.svg';

  /// File path: assets/images/loading_image.png
  AssetGenImage get loadingImage =>
      const AssetGenImage('assets/images/loading_image.png');

  /// File path: assets/images/login_image.png
  AssetGenImage get loginImage =>
      const AssetGenImage('assets/images/login_image.png');

  /// File path: assets/images/naver.svg
  String get naver => 'assets/images/naver.svg';

  /// File path: assets/images/ready_image.png
  AssetGenImage get readyImage =>
      const AssetGenImage('assets/images/ready_image.png');

  /// File path: assets/images/small_right_arrow.png
  AssetGenImage get smallRightArrow =>
      const AssetGenImage('assets/images/small_right_arrow.png');

  /// File path: assets/images/splash_logo.png
  AssetGenImage get splashLogo =>
      const AssetGenImage('assets/images/splash_logo.png');

  /// File path: assets/images/toggle_off.svg
  String get toggleOff => 'assets/images/toggle_off.svg';

  /// File path: assets/images/toggle_on.svg
  String get toggleOn => 'assets/images/toggle_on.svg';

  /// List of all assets
  List<dynamic> get values => [
        google,
        homeLogo,
        iconArrowOpen,
        iconBackarrow,
        iconCheck,
        iconHomeOff,
        iconHomeOn,
        iconMypageOff,
        iconMypageOn,
        iconNonecheck,
        iconRoutineOff,
        iconRoutineOn,
        loadingImage,
        loginImage,
        naver,
        readyImage,
        smallRightArrow,
        splashLogo,
        toggleOff,
        toggleOn
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
