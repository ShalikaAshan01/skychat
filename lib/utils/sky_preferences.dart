import 'package:shared_preferences/shared_preferences.dart';
import 'package:sky_chat/utils/themes.dart';

const _SKY_THEME_MODE = "sky_theme_mode";
const _SKY_THEME = "sky_theme";

Future<void> saveThemeMode(SkyThemeMode themeMode) async{
  SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
  return await _sharedPreferences.setString(_SKY_THEME_MODE, themeMode.toString());
}

Future<SkyThemeMode> getSavedThemeMode()async{
  SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
  String value = _sharedPreferences.getString(_SKY_THEME_MODE);
  SkyThemeMode themeMode = SkyThemeMode.clearlyWhite;

  if(value == null || value == "")
    return themeMode;
  if(value == SkyThemeMode.clearlyWhite.toString())
    themeMode = SkyThemeMode.clearlyWhite;
  else if(value == SkyThemeMode.kindaDark.toString())
    themeMode = SkyThemeMode.kindaDark;
  else if(value == SkyThemeMode.justBlack.toString())
    themeMode = SkyThemeMode.justBlack;
  return themeMode;
}

Future<void> saveTheme(SkyTheme theme) async{
  SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
  return await _sharedPreferences.setString(_SKY_THEME, theme.toString());
}

Future<SkyTheme> getSavedTheme()async{
  SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
  String value = _sharedPreferences.getString(_SKY_THEME);
  SkyTheme theme = SkyTheme.defaultTheme;

  if(value == null || value == "")
    return theme;

  if(value == SkyTheme.theme1.toString())
    theme = SkyTheme.theme1;
  if(value == SkyTheme.theme2.toString())
    theme = SkyTheme.theme2;
  if(value == SkyTheme.theme3.toString())
    theme = SkyTheme.theme3;
  if(value == SkyTheme.theme4.toString())
    theme = SkyTheme.theme4;
  if(value == SkyTheme.theme5.toString())
    theme = SkyTheme.theme5;
  if(value == SkyTheme.theme6.toString())
    theme = SkyTheme.theme6;


  return theme;
}


