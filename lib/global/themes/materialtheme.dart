import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color.fromARGB(255, 153, 217, 140),
      surfaceTint: Color(4282279991),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4290769073),
      onPrimaryContainer: Color(4278198785),
      secondary: Color(4282935086),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4291423911),
      onSecondaryContainer: Color(4278984704),
      tertiary: Color(4283851810),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4292471705),
      onTertiaryContainer: Color(4279705088),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color(4294441969),
      onSurface: Color(4279835927),
      onSurfaceVariant: Color(4282534207),
      outline: Color(4285757806),
      outlineVariant: Color(4290955452),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281217579),
      inversePrimary: Color(4288926615),
      primaryFixed: Color(4290769073),
      onPrimaryFixed: Color(4278198785),
      primaryFixedDim: Color(4288926615),
      onPrimaryFixedVariant: Color(4280700962),
      secondaryFixed: Color(4291423911),
      onSecondaryFixed: Color(4278984704),
      secondaryFixedDim: Color(4289646989),
      onSecondaryFixedVariant: Color(4281421337),
      tertiaryFixed: Color(4292471705),
      onTertiaryFixed: Color(4279705088),
      tertiaryFixedDim: Color(4290629248),
      onTertiaryFixedVariant: Color(4282338315),
      surfaceDim: Color(4292402130),
      surfaceBright: Color(4294441969),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294112747),
      surfaceContainer: Color(4293717989),
      surfaceContainerHigh: Color(4293323232),
      surfaceContainerHighest: Color(4292928730),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4280437790),
      surfaceTint: Color(4282279991),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4283727691),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4281158165),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4284382786),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4282075143),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4285299510),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      surface: Color(4294441969),
      onSurface: Color(4279835927),
      onSurfaceVariant: Color(4282271035),
      outline: Color(4284178775),
      outlineVariant: Color(4285955442),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281217579),
      inversePrimary: Color(4288926615),
      primaryFixed: Color(4283727691),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4282082869),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4284382786),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4282803244),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4285299510),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4283654688),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292402130),
      surfaceBright: Color(4294441969),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294112747),
      surfaceContainer: Color(4293717989),
      surfaceContainerHigh: Color(4293323232),
      surfaceContainerHighest: Color(4292928730),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278200578),
      surfaceTint: Color(4282279991),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4280437790),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4279248896),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4281158165),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4280100096),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4282075143),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      surface: Color(4294441969),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4280296989),
      outline: Color(4282271035),
      outlineVariant: Color(4282271035),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281217579),
      inversePrimary: Color(4291361210),
      primaryFixed: Color(4280437790),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4278858761),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4281158165),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4279776001),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4282075143),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4280692992),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292402130),
      surfaceBright: Color(4294441969),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294112747),
      surfaceContainer: Color(4293717989),
      surfaceContainerHigh: Color(4293323232),
      surfaceContainerHighest: Color(4292928730),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4288926615),
      surfaceTint: Color(4288926615),
      onPrimary: Color(4279121933),
      primaryContainer: Color(4280700962),
      onPrimaryContainer: Color(4290769073),
      secondary: Color(4289646989),
      onSecondary: Color(4280039172),
      secondaryContainer: Color(4281421337),
      onSecondaryContainer: Color(4291423911),
      tertiary: Color(4290629248),
      onTertiary: Color(4280956160),
      tertiaryContainer: Color(4282338315),
      onTertiaryContainer: Color(4292471705),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279309327),
      onSurface: Color(4292928730),
      onSurfaceVariant: Color(4290955452),
      outline: Color(4287402888),
      outlineVariant: Color(4282534207),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292928730),
      inversePrimary: Color(4282279991),
      primaryFixed: Color(4290769073),
      onPrimaryFixed: Color(4278198785),
      primaryFixedDim: Color(4288926615),
      onPrimaryFixedVariant: Color(4280700962),
      secondaryFixed: Color(4291423911),
      onSecondaryFixed: Color(4278984704),
      secondaryFixedDim: Color(4289646989),
      onSecondaryFixedVariant: Color(4281421337),
      tertiaryFixed: Color(4292471705),
      onTertiaryFixed: Color(4279705088),
      tertiaryFixedDim: Color(4290629248),
      onTertiaryFixedVariant: Color(4282338315),
      surfaceDim: Color(4279309327),
      surfaceBright: Color(4281743924),
      surfaceContainerLowest: Color(4278914826),
      surfaceContainerLow: Color(4279835927),
      surfaceContainer: Color(4280099099),
      surfaceContainerHigh: Color(4280757029),
      surfaceContainerHighest: Color(4281480752),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4289189787),
      surfaceTint: Color(4288926615),
      onPrimary: Color(4278197249),
      primaryContainer: Color(4285504613),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4289910417),
      onSecondary: Color(4278786560),
      secondaryContainer: Color(4286159708),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4290892676),
      onTertiary: Color(4279376128),
      tertiaryContainer: Color(4287141968),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(4279309327),
      onSurface: Color(4294573298),
      onSurfaceVariant: Color(4291284416),
      outline: Color(4288652697),
      outlineVariant: Color(4286547322),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292928730),
      inversePrimary: Color(4280832291),
      primaryFixed: Color(4290769073),
      onPrimaryFixed: Color(4278195713),
      primaryFixedDim: Color(4288926615),
      onPrimaryFixedVariant: Color(4279582226),
      secondaryFixed: Color(4291423911),
      onSecondaryFixed: Color(4278588672),
      secondaryFixedDim: Color(4289646989),
      onSecondaryFixedVariant: Color(4280368393),
      tertiaryFixed: Color(4292471705),
      onTertiaryFixed: Color(4279112448),
      tertiaryFixedDim: Color(4290629248),
      onTertiaryFixedVariant: Color(4281285376),
      surfaceDim: Color(4279309327),
      surfaceBright: Color(4281743924),
      surfaceContainerLowest: Color(4278914826),
      surfaceContainerLow: Color(4279835927),
      surfaceContainer: Color(4280099099),
      surfaceContainerHigh: Color(4280757029),
      surfaceContainerHighest: Color(4281480752),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294049768),
      surfaceTint: Color(4288926615),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4289189787),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294180834),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4289910417),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294442963),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4290892676),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4279309327),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294442480),
      outline: Color(4291284416),
      outlineVariant: Color(4291284416),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292928730),
      inversePrimary: Color(4278596103),
      primaryFixed: Color(4291032245),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4289189787),
      onPrimaryFixedVariant: Color(4278197249),
      secondaryFixed: Color(4291687083),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4289910417),
      onSecondaryFixedVariant: Color(4278786560),
      tertiaryFixed: Color(4292734877),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4290892676),
      onTertiaryFixedVariant: Color(4279376128),
      surfaceDim: Color(4279309327),
      surfaceBright: Color(4281743924),
      surfaceContainerLowest: Color(4278914826),
      surfaceContainerLow: Color(4279835927),
      surfaceContainer: Color(4280099099),
      surfaceContainerHigh: Color(4280757029),
      surfaceContainerHighest: Color(4281480752),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.background,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
