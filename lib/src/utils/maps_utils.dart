import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tookwidgets/src/models/enums/vehicle_enums.dart';
import 'package:tookwidgets/src/plugin_consts/colors.dart';

class MapUtils {
  MapUtils._singlton();

  static final MapUtils instance = MapUtils._singlton();

  Future centerlizeonMap(
    LatLng point1,
    LatLng point2,
    GoogleMapController? mapController,
  ) async {
    if (mapController == null) return;

    LatLngBounds bounds;

    if (point1.latitude > point2.latitude &&
        point1.longitude > point2.longitude) {
      bounds = LatLngBounds(southwest: point2, northeast: point1);
    } else if (point1.longitude > point2.longitude) {
      bounds = LatLngBounds(
          southwest: LatLng(point1.latitude, point2.longitude),
          northeast: LatLng(point2.latitude, point1.longitude));
    } else if (point1.latitude > point2.latitude) {
      bounds = LatLngBounds(
          southwest: LatLng(point2.latitude, point1.longitude),
          northeast: LatLng(point1.latitude, point2.longitude));
    } else {
      bounds = LatLngBounds(southwest: point1, northeast: point2);
    }

    final CameraUpdate cameraUpdate = CameraUpdate.newLatLngBounds(bounds, 80);

    return _checkCameraLocation(cameraUpdate, mapController);
  }

  static List<LatLng> decodeEncodedPolyline(String encoded) {
    final List<LatLng> poly = [];
    int index = 0;
    final int len = encoded.length;
    int lat = 0, lng = 0;

    while (index < len) {
      int b, shift = 0, result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      final int dlat = (result & 1) != 0 ? ~(result >> 1) : (result >> 1);
      lat += dlat;

      shift = 0;
      result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      final int dlng = (result & 1) != 0 ? ~(result >> 1) : (result >> 1);
      lng += dlng;
      final LatLng p = LatLng((lat / 1E5).toDouble(), (lng / 1E5).toDouble());
      poly.add(p);
    }
    return poly;
  }
}

Future<void> _checkCameraLocation(
  CameraUpdate cameraUpdate,
  GoogleMapController mapController,
) async {
  await mapController.animateCamera(cameraUpdate);
  final LatLngBounds l1 = await mapController.getVisibleRegion();
  final LatLngBounds l2 = await mapController.getVisibleRegion();

  if (l1.southwest.latitude == -90 || l2.southwest.latitude == -90) {
    return _checkCameraLocation(cameraUpdate, mapController);
  }
}

class MarkerIconsUtils {
  MarkerIconsUtils._singlton();

  static final MarkerIconsUtils instance = MarkerIconsUtils._singlton();

  late BitmapDescriptor vehicle, dot;

  Future<BitmapDescriptor> markerPoint(String markerPointText) async {
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint = Paint()..color = MyColors.primaryDark;
    final dpr = ui.window.devicePixelRatio;
    final Size size = Size(dpr * 35, dpr * 45);

    final Path path0 = Path();
    path0.moveTo(size.width * 0.5032000, size.height * 0.9910833);
    path0.cubicTo(
        size.width * -0.3159000,
        size.height * 0.5493333,
        size.width * 0.0196000,
        size.height * 0.0087500,
        size.width * 0.4985000,
        size.height * 0.0031667);
    path0.cubicTo(
        size.width * 0.9935000,
        size.height * 0.0084167,
        size.width * 1.3092000,
        size.height * 0.5734167,
        size.width * 0.5032000,
        size.height * 0.9910833);
    path0.close();

    canvas.drawPath(path0, paint);

    final TextPainter painter = TextPainter(textDirection: TextDirection.ltr);
    painter.text = TextSpan(
      text: markerPointText,
      style: TextStyle(
        fontSize: size.height / 1.8,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
    painter.layout();
    painter.paint(
      canvas,
      Offset(
        size.width / 2 - painter.width / 2,
        size.height / 2.2 - painter.height / 2,
      ),
    );
    final img = await pictureRecorder
        .endRecording()
        .toImage(size.width.toInt(), size.height.toInt());
    final data = await img.toByteData(format: ui.ImageByteFormat.png);
    final bytes = data!.buffer.asUint8List();
    return BitmapDescriptor.fromBytes(bytes);
  }

  Future<BitmapDescriptor> getMarkerFromImageUrl(String url) async {
    final File markerImageFile = await DefaultCacheManager().getSingleFile(url);
    final dpr = ui.window.devicePixelRatio;
    final Size size = ui.Size(dpr * 90, dpr * 90);

    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);

    final Radius radius = Radius.circular(size.width / 2);

    final Paint pointPaint = Paint()
      ..color = MyColors.primaryDark.withAlpha(220);

    final Paint borderPaint = Paint()..color = MyColors.primaryDark;

    canvas.drawRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTWH(0, 0, size.width - 44, size.height - 44),
          topLeft: radius,
          topRight: radius,
          bottomLeft: radius,
          bottomRight: radius,
        ),
        borderPaint);

    canvas.drawCircle(Offset(size.width / 2.5, size.height - 20),
        size.width / 12, pointPaint);

    final Rect oval = Rect.fromLTWH(6, 6, size.width - 56, size.height - 56);

    // Add path for oval image
    canvas.clipPath(Path()..addOval(oval));

    final Uint8List imageUint8List = await markerImageFile.readAsBytes();
    final ui.Codec codec = await ui.instantiateImageCodec(imageUint8List);
    final ui.FrameInfo imageFI = await codec.getNextFrame();

    paintImage(
        canvas: canvas, rect: oval, image: imageFI.image, fit: BoxFit.fitWidth);

    final img = await pictureRecorder
        .endRecording()
        .toImage(size.width.toInt(), size.height.toInt());
    final data = await img.toByteData(format: ui.ImageByteFormat.png);

    return BitmapDescriptor.fromBytes(data!.buffer.asUint8List());
  }

  Future setBitmaps() async {
    final _car = BitmapDescriptor.fromBytes(
      await _MIU.getBytesFromAsset(
        VehicleColor.black.image,
        Platform.isIOS ? 50 : 35,
      ),
    );
    vehicle = _car;

    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint = Paint()..color = MyColors.mainColor;
    final dpr = ui.window.devicePixelRatio;
    final Size size = ui.Size(dpr * 12, dpr * 12);
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      size.width / 2.0,
      paint,
    );
    final img = await pictureRecorder
        .endRecording()
        .toImage(size.width.toInt(), size.height.toInt());
    final data = await img.toByteData(format: ui.ImageByteFormat.png);
    final bytes = data!.buffer.asUint8List();
    final bitmap = BitmapDescriptor.fromBytes(bytes);
    dot = bitmap;
  }
}

mixin _MIU {
  static Future<Uint8List> getBytesFromAsset(String path, int width) async {
    final ByteData data = await rootBundle.load(path);
    final ui.Codec codec = await ui
        .instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    final ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }
}
