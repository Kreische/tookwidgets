import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tookwidgets/src/models/enums/vehicle_enums.dart';
import 'package:tookwidgets/src/plugin_consts/colors.dart';

class MapUtils {
  MapUtils._singlton();

  static final MapUtils instance = MapUtils._singlton();

  Future<void> updateCameraLocation(
    LatLng source,
    LatLng destination,
    GoogleMapController? mapController,
  ) async {
    if (mapController == null) return;

    LatLngBounds bounds;

    if (source.latitude > destination.latitude &&
        source.longitude > destination.longitude) {
      bounds = LatLngBounds(southwest: destination, northeast: source);
    } else if (source.longitude > destination.longitude) {
      bounds = LatLngBounds(
          southwest: LatLng(source.latitude, destination.longitude),
          northeast: LatLng(destination.latitude, source.longitude));
    } else if (source.latitude > destination.latitude) {
      bounds = LatLngBounds(
          southwest: LatLng(destination.latitude, source.longitude),
          northeast: LatLng(source.latitude, destination.longitude));
    } else {
      bounds = LatLngBounds(southwest: source, northeast: destination);
    }

    final CameraUpdate cameraUpdate = CameraUpdate.newLatLngBounds(bounds, 80);

    return _checkCameraLocation(cameraUpdate, mapController);
  }

  Future<void> _checkCameraLocation(
      CameraUpdate cameraUpdate, GoogleMapController mapController) async {
    await mapController.animateCamera(cameraUpdate);
    final LatLngBounds l1 = await mapController.getVisibleRegion();
    final LatLngBounds l2 = await mapController.getVisibleRegion();

    if (l1.southwest.latitude == -90 || l2.southwest.latitude == -90) {
      return _checkCameraLocation(cameraUpdate, mapController);
    }
  }
}

class MarkerIconsUtils {
  MarkerIconsUtils._singlton();

  static final MarkerIconsUtils instance = MarkerIconsUtils._singlton();

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
}

class CarBitmapDescriptors {
  CarBitmapDescriptors._();

  static final CarBitmapDescriptors instance = CarBitmapDescriptors._();

  late BitmapDescriptor _white,
      _red,
      _green,
      _yellow,
      _black,
      _orange,
      _brown,
      _purple,
      _pink,
      _silver,
      _lightBlue,
      _darkBlue,
      _darkGrey,
      _lightGreen;

  BitmapDescriptor getImage(VehicleColor color) {
    switch (color) {
      case VehicleColor.white:
        return _white;
      case VehicleColor.brown:
        return _brown;
      case VehicleColor.red:
        return _red;
      case VehicleColor.green:
        return _green;
      case VehicleColor.black:
        return _black;
      case VehicleColor.orange:
        return _orange;
      case VehicleColor.purple:
        return _purple;
      case VehicleColor.pink:
        return _pink;
      case VehicleColor.silver:
        return _silver;
      case VehicleColor.lightBlue:
        return _lightBlue;
      case VehicleColor.darkBlue:
        return _darkBlue;
      case VehicleColor.darkGrey:
        return _darkGrey;
      case VehicleColor.lightGreen:
        return _lightGreen;
      case VehicleColor.yellow:
        return _yellow;
      default:
        return _white;
    }
  }

  Future setCarColor() async {
    await Future.wait([
      _setRed(),
      _setWhite(),
      _setGreen(),
      _setYellow(),
      _setBlack(),
      _setOrange(),
      _setBrown(),
      _setPurple(),
      _setPink(),
      _setSilver(),
      _setLightblue(),
      _setDarkblue(),
      _setDartGrey(),
      _setLightGreen(),
    ]);
  }

  Future _setRed() async => _red = await _bit(VehicleColor.red);
  Future _setWhite() async => _white = await _bit(VehicleColor.white);
  Future _setGreen() async => _green = await _bit(VehicleColor.green);
  Future _setYellow() async => _yellow = await _bit(VehicleColor.yellow);
  Future _setBlack() async => _black = await _bit(VehicleColor.black);
  Future _setOrange() async => _orange = await _bit(VehicleColor.orange);
  Future _setBrown() async => _brown = await _bit(VehicleColor.brown);
  Future _setPurple() async => _purple = await _bit(VehicleColor.purple);
  Future _setPink() async => _pink = await _bit(VehicleColor.pink);
  Future _setSilver() async => _silver = await _bit(VehicleColor.silver);
  Future _setLightblue() async =>
      _lightBlue = await _bit(VehicleColor.lightBlue);
  Future _setDarkblue() async => _darkBlue = await _bit(VehicleColor.darkBlue);
  Future _setDartGrey() async => _darkGrey = await _bit(VehicleColor.darkGrey);
  Future _setLightGreen() async =>
      _lightGreen = await _bit(VehicleColor.lightGreen);

  Future<BitmapDescriptor> _bit(VehicleColor color) async =>
      BitmapDescriptor.fromBytes(
        await _MIU.getBytesFromAsset(color.image, Platform.isIOS ? 60 : 40),
      );
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
