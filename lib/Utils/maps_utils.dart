import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tookwidgets/Models/Car.dart';
import 'package:tookwidgets/Models/marker_icons_data.dart';

class MarkerIconsUtils {
  MarkerIconsUtils._singlton();

  static final MarkerIconsUtils instance = MarkerIconsUtils._singlton();

  late BitmapDescriptor myCarIcon, customer, markerA, markerB, activeCustomer;

  int get _markerIcon {
    final dpr = ui.window.devicePixelRatio;
    return (dpr * 40).toInt();
  }

  int get _carMarkerIconSize {
    final dpr = ui.window.devicePixelRatio;
    return (dpr * 40).toInt();
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
        await _MIU.getBytesFromAsset(data.activeCustomer!, _markerIcon),
      );
    }

    if (data.myCarColor != null) {
      final asset = data.myCarColor!.image;
      myCarIcon = BitmapDescriptor.fromBytes(
        await _MIU.getBytesFromAsset(asset, _carMarkerIconSize),
      );
    }
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
