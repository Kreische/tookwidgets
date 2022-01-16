import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tookwidgets/models/car.dart';
import 'package:tookwidgets/models/marker_icons_data.dart';
import 'package:tookwidgets/plugin_consts/colors.dart';

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

  late BitmapDescriptor myCarIcon,
      customer,
      markerA,
      markerB,
      activeCustomer,
      marketPoint;

  int get _markerIcon {
    final dpr = ui.window.devicePixelRatio;
    return (dpr * 35).toInt();
  }

  int get _carMarkerIconSize {
    final dpr = ui.window.devicePixelRatio;
    return (dpr * 30).toInt();
  }

  int get _activeCustomberIconSize {
    final dpr = ui.window.devicePixelRatio;
    return (dpr * 12).toInt();
  }

  Future setIcons(MarkerIconsData data) async {
    markerA = BitmapDescriptor.fromBytes(
      await _MIU.getBytesFromAsset(data.mapPointA, _markerIcon),
    );

    markerB = BitmapDescriptor.fromBytes(
      await _MIU.getBytesFromAsset(data.mapPointB, _markerIcon),
    );

    if (data.customer != null) {
      customer = BitmapDescriptor.fromBytes(
        await _MIU.getBytesFromAsset(data.customer!, _markerIcon),
      );
    }

    if (data.activeCustomer != null) {
      activeCustomer = BitmapDescriptor.fromBytes(
        await _MIU.getBytesFromAsset(
            data.activeCustomer!, _activeCustomberIconSize),
      );
    }

    if (data.myCarColor != null) {
      final asset = data.myCarColor!.image;
      myCarIcon = BitmapDescriptor.fromBytes(
        await _MIU.getBytesFromAsset(asset, _carMarkerIconSize),
      );
    }
  }

  Future<BitmapDescriptor> markerDot(
      {Color color = MyColors.primaryDark}) async {
    return BitmapDescriptor.fromBytes(
      await _createDot(color),
    );
  }

  Future<Uint8List> _createDot(Color color) async {
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint = Paint()..color = color;
    final dpr = ui.window.devicePixelRatio;

    final Size size = ui.Size(dpr * 18, dpr * 18);

    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), size.width / 2.0, paint);

    final img = await pictureRecorder
        .endRecording()
        .toImage(size.width.toInt(), size.height.toInt());
    final data = await img.toByteData(format: ui.ImageByteFormat.png);
    return data!.buffer.asUint8List();
  }

  Future<BitmapDescriptor> markerPoint(String markerPointText) async {
    return BitmapDescriptor.fromBytes(
      await _create(markerPointText),
    );
  }

  Future<Uint8List> _create(String text) async {
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
      text: text,
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
    return data!.buffer.asUint8List();
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

  BitmapDescriptor getImage(CarColor color) {
    switch (color) {
      case CarColor.white:
        return _white;
      case CarColor.brown:
        return _brown;
      case CarColor.red:
        return _red;
      case CarColor.green:
        return _green;
      case CarColor.black:
        return _black;
      case CarColor.orange:
        return _orange;
      case CarColor.purple:
        return _purple;
      case CarColor.pink:
        return _pink;
      case CarColor.silver:
        return _silver;
      case CarColor.lightBlue:
        return _lightBlue;
      case CarColor.darkBlue:
        return _darkBlue;
      case CarColor.darkGrey:
        return _darkGrey;
      case CarColor.lightGreen:
        return _lightGreen;
      case CarColor.yellow:
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

  Future _setRed() async => _red = await _bit(CarColor.red);
  Future _setWhite() async => _white = await _bit(CarColor.white);
  Future _setGreen() async => _green = await _bit(CarColor.green);
  Future _setYellow() async => _yellow = await _bit(CarColor.yellow);
  Future _setBlack() async => _black = await _bit(CarColor.black);
  Future _setOrange() async => _orange = await _bit(CarColor.orange);
  Future _setBrown() async => _brown = await _bit(CarColor.brown);
  Future _setPurple() async => _purple = await _bit(CarColor.purple);
  Future _setPink() async => _pink = await _bit(CarColor.pink);
  Future _setSilver() async => _silver = await _bit(CarColor.silver);
  Future _setLightblue() async => _lightBlue = await _bit(CarColor.lightBlue);
  Future _setDarkblue() async => _darkBlue = await _bit(CarColor.darkBlue);
  Future _setDartGrey() async => _darkGrey = await _bit(CarColor.darkGrey);
  Future _setLightGreen() async =>
      _lightGreen = await _bit(CarColor.lightGreen);

  Future<BitmapDescriptor> _bit(CarColor color) async =>
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
