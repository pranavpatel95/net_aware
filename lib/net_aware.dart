import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

const Duration kThemeAnimationDuration = Duration(milliseconds: 200);

class NetAware extends StatefulWidget {
  final Widget child;
  final Duration checkInterval;
  final String? imageAsset;
  final Color? bgColor;
  final AppBar? appBar;
  final Widget? offlineWidget;
  final GlobalKey<NavigatorState>? navigatorKey;
  final GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey;
  final Widget? home;
  final Map<String, WidgetBuilder> routes;
  final String? initialRoute;
  final RouteFactory? onGenerateRoute;
  final InitialRouteListFactory? onGenerateInitialRoutes;
  final RouteFactory? onUnknownRoute;
  final NotificationListenerCallback<NavigationNotification>?
      onNavigationNotification;
  final List<NavigatorObserver> navigatorObservers;
  final TransitionBuilder? builder;
  final String title;
  final GenerateAppTitle? onGenerateTitle;
  final ThemeData? theme;
  final ThemeData? darkTheme;
  final ThemeData? highContrastTheme;
  final ThemeData? highContrastDarkTheme;
  final ThemeMode? themeMode;
  final Duration themeAnimationDuration;
  final Curve themeAnimationCurve;
  final Color? color;
  final Locale? locale;
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  final LocaleListResolutionCallback? localeListResolutionCallback;
  final LocaleResolutionCallback? localeResolutionCallback;
  final Iterable<Locale> supportedLocales;
  final bool showPerformanceOverlay;
  final bool checkerboardRasterCacheImages;
  final bool checkerboardOffscreenLayers;
  final bool showSemanticsDebugger;
  final bool debugShowCheckedModeBanner;
  final Map<ShortcutActivator, Intent>? shortcuts;
  final Map<Type, Action<Intent>>? actions;
  final String? restorationScopeId;
  final ScrollBehavior? scrollBehavior;
  final bool debugShowMaterialGrid;
  final AnimationStyle? themeAnimationStyle;

  const NetAware({
    super.key,
    required this.child,
    this.checkInterval = const Duration(seconds: 3),
    this.imageAsset,
    this.bgColor,
    this.appBar,
    this.offlineWidget,
    this.navigatorKey,
    this.scaffoldMessengerKey,
    this.home,
    this.routes = const <String, WidgetBuilder>{},
    this.initialRoute,
    this.onGenerateRoute,
    this.onGenerateInitialRoutes,
    this.onUnknownRoute,
    this.onNavigationNotification,
    this.navigatorObservers = const <NavigatorObserver>[],
    this.builder,
    this.title = '',
    this.onGenerateTitle,
    this.color,
    this.theme,
    this.darkTheme,
    this.highContrastTheme,
    this.highContrastDarkTheme,
    this.themeMode = ThemeMode.system,
    this.themeAnimationDuration = kThemeAnimationDuration,
    this.themeAnimationCurve = Curves.linear,
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.debugShowMaterialGrid = false,
    this.showPerformanceOverlay = false,
    this.checkerboardRasterCacheImages = false,
    this.checkerboardOffscreenLayers = false,
    this.showSemanticsDebugger = false,
    this.debugShowCheckedModeBanner = true,
    this.shortcuts,
    this.actions,
    this.restorationScopeId,
    this.scrollBehavior,
    this.themeAnimationStyle,
  });

  @override
  NetAwareState createState() => NetAwareState();
}

class NetAwareState extends State<NetAware> {
  bool _isOnline = true;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _checkInternetConnection();
    _timer =
        Timer.periodic(widget.checkInterval, (_) => _checkInternetConnection());
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Future<void> _checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('www.google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        _updateConnectionStatus(true);
      } else {
        _updateConnectionStatus(false);
      }
    } catch (_) {
      _updateConnectionStatus(false);
    }
  }

  void _updateConnectionStatus(bool status) {
    if (_isOnline != status) {
      setState(() {
        _isOnline = status;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: widget.debugShowCheckedModeBanner,
      navigatorKey: widget.navigatorKey,
      scaffoldMessengerKey: widget.scaffoldMessengerKey,
      routes: widget.routes,
      initialRoute: widget.initialRoute,
      onGenerateInitialRoutes: widget.onGenerateInitialRoutes,
      onUnknownRoute: widget.onUnknownRoute,
      onNavigationNotification: widget.onNavigationNotification,
      navigatorObservers: widget.navigatorObservers,
      builder: widget.builder,
      title: widget.title,
      onGenerateRoute: widget.onGenerateRoute,
      color: widget.color,
      theme: widget.theme,
      darkTheme: widget.darkTheme,
      highContrastTheme: widget.highContrastTheme,
      highContrastDarkTheme: widget.highContrastDarkTheme,
      themeMode: widget.themeMode,
      themeAnimationDuration: widget.themeAnimationDuration,
      themeAnimationCurve: widget.themeAnimationCurve,
      locale: widget.locale,
      localizationsDelegates: widget.localizationsDelegates,
      localeListResolutionCallback: widget.localeListResolutionCallback,
      supportedLocales: widget.supportedLocales,
      debugShowMaterialGrid: widget.debugShowMaterialGrid,
      showPerformanceOverlay: widget.showPerformanceOverlay,
      checkerboardRasterCacheImages: widget.checkerboardRasterCacheImages,
      checkerboardOffscreenLayers: widget.checkerboardOffscreenLayers,
      showSemanticsDebugger: widget.showSemanticsDebugger,
      shortcuts: widget.shortcuts,
      actions: widget.actions,
      restorationScopeId: widget.restorationScopeId,
      scrollBehavior: widget.scrollBehavior,
      themeAnimationStyle: widget.themeAnimationStyle,
      home: widget.home ??
          SafeArea(
            child: _isOnline
                ? widget.child
                : Scaffold(
                    appBar: widget.appBar,
                    body: widget.offlineWidget ??
                        Container(
                          color: widget.bgColor ?? Colors.white,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                widget.imageAsset == null
                                    ? Image.asset(
                                        'assets/no_internet.jpg',
                                        package: 'net_aware',
                                      )
                                    : Container(
                                        color: widget.bgColor,
                                        child: Image.asset(
                                          widget.imageAsset.toString(),
                                        ),
                                      ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "No internet connection",
                                ),
                              ],
                            ),
                          ),
                        ),
                  ),
          ),
    );
  }
}
