import 'package:loggy/loggy.dart';
import 'dart:typed_data';
import 'package:transparent_image/transparent_image.dart' as transparent_image;
import 'package:reactive_forms/reactive_forms.dart';

String dunno(error) {
  logInfo(error);
  return 'Error';
}

final validation = {
  ValidationMessage.required: (_) => 'El campo es obligatorio',
  ValidationMessage.email: (_) => 'El campo debe ser una dirección de correo electrónico',
  ValidationMessage.minLength: (error) => 'El campo debe tener una longitud mínima de ${(error as Map)['requiredLength']}',
  ValidationMessage.number: (_) => 'El campo debe ser un valor numérico',
  ValidationMessage.min: dunno,
  ValidationMessage.max: dunno,
  'uniqueEmail': (_) => 'El correo electrónico ya está registrado',
  'url': (_) => 'El campo debe ser un URL',
  'dateRange': (_) => 'Rango de hora incorrecto. La hora de inicio debe ser antes de la hora de fin',
};


// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// Only put constants shared between files here.

// Height of the 'Gallery' header
const double galleryHeaderHeight = 64;

// The font size delta for headline4 font.
const double desktopDisplay1FontDelta = 16;

// The width of the settingsDesktop.
const double desktopSettingsWidth = 520;

// Sentinel value for the system text scale factor option.
const double systemTextScaleFactorOption = -1;

// The splash page animation duration.
const Duration splashPageAnimationDuration = Duration(milliseconds: 300);

// Half the splash page animation duration.
const Duration halfSplashPageAnimationDuration = Duration(milliseconds: 150);

// Duration for settings panel to open on mobile.
const Duration settingsPanelMobileAnimationDuration =
    Duration(milliseconds: 200);

// Duration for settings panel to open on desktop.
const Duration settingsPanelDesktopAnimationDuration =
    Duration(milliseconds: 600);

// Duration for home page elements to fade in.
const Duration entranceAnimationDuration = Duration(milliseconds: 200);

// The desktop top padding for a page's first header (e.g. Gallery, Settings)
const double firstHeaderDesktopTopPadding = 5.0;

// A transparent image used to avoid loading images when they are not needed.
final Uint8List kTransparentImage = transparent_image.kTransparentImage;
