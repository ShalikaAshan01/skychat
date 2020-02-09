import 'package:flutter/material.dart';

enum SkyThemeMode { clearlyWhite, kindaDark, justBlack }
enum ThemeColors {
  divider,
  fontColorPrimary,
  fontColorSecondary,
  background
}
enum SkyGradientColor { primary, secondary }
enum SkyTheme{defaultTheme,theme1,theme2,theme3,theme4,theme5,theme6}
enum SkyThemeColor{primary,accent}
final clearlyWhite = {
  ThemeColors.divider: Colors.grey.withOpacity(0.1),
  ThemeColors.fontColorPrimary: Colors.black,
  ThemeColors.fontColorSecondary: Colors.grey,
  ThemeColors.background:Colors.white
};

final kindaDark = {
  ThemeColors.divider: Colors.grey.withOpacity(0.1),
  ThemeColors.fontColorPrimary: Colors.white,
  ThemeColors.fontColorSecondary: Colors.grey,
  ThemeColors.background:Color(0xFF202124)
};

final justBlack = {
  ThemeColors.divider: Colors.grey.withOpacity(0.3),
  ThemeColors.fontColorPrimary: Colors.white,
  ThemeColors.fontColorSecondary: Colors.grey,
  ThemeColors.background:Color(0xFF121212)
};

final defaultDark = ThemeData(
  primaryColor: Color(0xFF00A3FF),
  appBarTheme: AppBarTheme(
    color: Color(0xFF00b8d4),
  ),
  brightness: Brightness.dark,
);

final defaultLight = ThemeData(
    primaryColor: Color(0xFF00A3FF),
    appBarTheme: AppBarTheme(
        color: Color(0xFF00b8d4)
    ),
  backgroundColor: clearlyWhite[ThemeColors.background],
  brightness: Brightness.light,
  buttonColor: Colors.white70
);

final theme1 = {
  SkyThemeColor.primary: Color(0xFF739bF3),
  SkyThemeColor.accent: Color(0xFF449BC4),
};
final theme2 = {
  SkyThemeColor.primary: Color(0xFF00E1D3),
  SkyThemeColor.accent: Color(0xFF00B4D5),
};
final theme3 = {
  SkyThemeColor.primary: Color(0xFF65D5A3),
  SkyThemeColor.accent: Color(0xFF3B9CA7),
};
final theme4 = {
  SkyThemeColor.primary: Color(0xFFFC747E),
  SkyThemeColor.accent: Color(0xFFF666A3),
};
final theme5 = {
  SkyThemeColor.primary: Color(0xFFFEC6E3),
  SkyThemeColor.accent: Color(0xFFFF9B9D),
};
final theme6 = {
  SkyThemeColor.primary: Color(0xFF858AE5),
  SkyThemeColor.accent: Color(0xFF786FC0),
};

ThemeData getSkyTheme(SkyThemeMode themeMode,SkyTheme theme){
  ThemeData themeData = defaultLight;
  if(themeMode == SkyThemeMode.justBlack)
    themeData = defaultDark.copyWith(backgroundColor: justBlack[ThemeColors.background]);
  if(themeMode == SkyThemeMode.kindaDark)
    themeData = defaultDark.copyWith(backgroundColor: kindaDark[ThemeColors.background]);
  switch (theme){
    case SkyTheme.defaultTheme:
      break;
    case SkyTheme.theme1:
      themeData = themeData.copyWith(
        primaryColor: theme1[SkyThemeColor.primary],
        accentColor: theme1[SkyThemeColor.accent],
        appBarTheme:AppBarTheme(
          color: theme1[SkyThemeColor.primary]
        ),
      );
      break;
    case SkyTheme.theme2:
      themeData = themeData.copyWith(
        primaryColor: theme2[SkyThemeColor.primary],
        accentColor: theme2[SkyThemeColor.accent],
        appBarTheme:AppBarTheme(
            color: theme2[SkyThemeColor.primary]
        ),
      );
      break;
    case SkyTheme.theme3:
      themeData = themeData.copyWith(
        primaryColor: theme3[SkyThemeColor.primary],
        accentColor: theme3[SkyThemeColor.accent],
        appBarTheme:AppBarTheme(
            color: theme3[SkyThemeColor.primary]
        ),
      );
      break;
    case SkyTheme.theme4:
      themeData = themeData.copyWith(
        primaryColor: theme4[SkyThemeColor.primary],
        accentColor: theme4[SkyThemeColor.accent],
        appBarTheme:AppBarTheme(
            color: theme4[SkyThemeColor.primary]
        ),
      );
      break;
    case SkyTheme.theme5:
      themeData = themeData.copyWith(
        primaryColor: theme5[SkyThemeColor.primary],
        accentColor: theme5[SkyThemeColor.accent],
        appBarTheme:AppBarTheme(
            color: theme5[SkyThemeColor.primary]
        ),
      );
      break;
    case SkyTheme.theme6:
      themeData = themeData.copyWith(
        primaryColor: theme6[SkyThemeColor.primary],
        accentColor: theme6[SkyThemeColor.accent],
        appBarTheme:AppBarTheme(
            color: theme6[SkyThemeColor.primary]
        ),
      );
      break;
  }
  return themeData;
}

getSkyThemeMode(SkyThemeMode mode) {
  switch (mode) {
    case SkyThemeMode.clearlyWhite:
      return clearlyWhite;
      break;
    case SkyThemeMode.kindaDark:
      return kindaDark;
      break;
    case SkyThemeMode.justBlack:
      return justBlack;
      break;
  }
}

final gradientList = [
  {SkyGradientColor.primary: Color(0xFFff9a9e), SkyGradientColor.secondary: Color(0xFFfad0c4)}, //1 Warm Flame
  {SkyGradientColor.primary: Color(0xFFa1c4fd), SkyGradientColor.secondary: Color(0xFFc2e9fb)}, //2 Winter Neva
  {SkyGradientColor.primary: Color(0xFF667eea), SkyGradientColor.secondary: Color(0xFF764ba2)}, //3 Plum Plate
  {SkyGradientColor.primary: Color(0xFF89f7fe), SkyGradientColor.secondary: Color(0xFF66a6ff)}, //4 Happy Fisher
  {SkyGradientColor.primary: Color(0xFFff9a9e), SkyGradientColor.secondary: Color(0xFFfecfef)}, //5 Lady Lips
  {SkyGradientColor.primary: Color(0xFFc79081), SkyGradientColor.secondary: Color(0xFFdfa579)},//6 Desert Hump
  {SkyGradientColor.primary: Color(0xFF48c6ef), SkyGradientColor.secondary: Color(0xFF6f86d6)},//7 Fly High
  {SkyGradientColor.primary: Color(0xFFff758c), SkyGradientColor.secondary: Color(0xFFff7eb3)},//6 Passionate Bed
  {SkyGradientColor.primary: Color(0xFFA40606), SkyGradientColor.secondary: Color(0xFFD98324)},//9 Casey's Broken Camera
  {SkyGradientColor.primary: Color(0xFF8CACAC), SkyGradientColor.secondary: Color(0xFFAF8C9D)},//10 Phone Case
//  {SkyGradientColor.primary: Color(0xFF09203f), SkyGradientColor.secondary: Color(0xFF537895)},//10
];

getGradientColorByIndex(int index){
  return gradientList[index % gradientList.length];
}