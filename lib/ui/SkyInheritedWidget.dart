import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sky_chat/utils/sky_preferences.dart';
import 'package:sky_chat/utils/themes.dart';

class SkyInheritedWidget extends StatefulWidget{
  final Widget child;

  const SkyInheritedWidget({Key key,@required this.child}) : super(key: key);

  static SkyInheritedData of(BuildContext context) => context.dependOnInheritedWidgetOfExactType();

  @override
  State<StatefulWidget> createState() => _SkyInheritedState();
}

class _SkyInheritedState extends State<SkyInheritedWidget>{
  SkyThemeMode skyThemeMode;
  SkyTheme skyTheme;

  @override
  void initState() {
    super.initState();
//    skyThemeMode = SkyThemeMode.clearlyWhite;
//    skyTheme = SkyTheme.defaultTheme;
    _getPreferencesValues();
  }
  void _getPreferencesValues()async{
    SkyThemeMode mode = await getSavedThemeMode();
    SkyTheme theme = await getSavedTheme();
    setState(() {
      skyThemeMode = mode;
      skyTheme = theme;
    });
  }

  void skyThemeModeChange(SkyThemeMode themeMode){
    setState(() {
      skyThemeMode = themeMode;
    });
  }

  void skyThemeChange(SkyTheme theme){
    setState(() {
      skyTheme = theme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SkyInheritedData(
      child: widget.child,
      skyThemeMode: skyThemeMode,
      onSkyThemeModeChange: skyThemeModeChange,
      skyTheme: skyTheme,
      onSkyThemeChange: skyThemeChange,
    );
  }
}


class SkyInheritedData extends InheritedWidget{
  final SkyThemeMode skyThemeMode;
  final SkyTheme skyTheme;
  final ValueChanged<SkyThemeMode> onSkyThemeModeChange;
  final ValueChanged<SkyTheme> onSkyThemeChange;

  SkyInheritedData({this.skyTheme, this.onSkyThemeChange, @required this.skyThemeMode,this.onSkyThemeModeChange,@required Widget child,Key key,}): super(key: key, child: child);
  @override
  bool updateShouldNotify(SkyInheritedData oldWidget) {
    bool _themeMode = oldWidget.skyThemeMode != skyThemeMode || oldWidget.onSkyThemeModeChange != onSkyThemeModeChange;
    bool _themeColor = oldWidget.skyTheme != skyTheme || oldWidget.onSkyThemeChange != onSkyThemeChange;
    return _themeMode || _themeColor;
  }

}