import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

const String _iosViewType = "FlutterYoutubeVideoView";
const String _androidViewType = "FlutterYoutubeVideoView";

class YoutubeVideoView extends StatelessWidget {
  final String videoId;

  const YoutubeVideoView({Key key, @required this.videoId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> creationParams = <String, dynamic>{
      "videoId": videoId
    };
    if (Platform.isIOS) {
      // on iOS only Hybrid Composition
      return UiKitView(
        viewType: _iosViewType,
        layoutDirection: TextDirection.ltr,
        creationParams: creationParams,
        creationParamsCodec: const StandardMessageCodec(),
      );
    } else if (Platform.isAndroid) {
      // Virtual Display
      return AndroidView(
        viewType: _androidViewType,
        layoutDirection: TextDirection.ltr,
        creationParams: creationParams,
        creationParamsCodec: const StandardMessageCodec(),
      );

      // TODO: Hybrid Composition
      // return PlatformViewLink(
      //   viewType: _androidViewType,
      //   surfaceFactory:
      //       (BuildContext context, PlatformViewController controller) {
      //     return AndroidViewSurface(
      //       controller: controller,
      //       gestureRecognizers: const <Factory<OneSequenceGestureRecognizer>>{},
      //       hitTestBehavior: PlatformViewHitTestBehavior.opaque,
      //     );
      //   },
      //   onCreatePlatformView: (PlatformViewCreationParams params) {
      //     return PlatformViewsService.initSurfaceAndroidView(
      //       id: params.id,
      //       viewType: _androidViewType,
      //       layoutDirection: TextDirection.ltr,
      //       creationParams: creationParams,
      //       creationParamsCodec: StandardMessageCodec(),
      //     )
      //       ..addOnPlatformViewCreatedListener(params.onPlatformViewCreated)
      //       ..create();
      //   },
      // );
    } else {
      return Container();
    }
  }
}
