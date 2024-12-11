import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

class NetAware extends StatefulWidget {
  final Widget child;
  final Duration checkInterval;
  final String? imageAsset;
  final Color? bgColor;
  final AppBar? appBar;
  final Widget? offlineWidget;

  const NetAware({
    super.key,
    required this.child,
    this.checkInterval = const Duration(seconds: 3),
    this.imageAsset,
    this.bgColor,
    this.appBar,
    this.offlineWidget,
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
      debugShowCheckedModeBanner: false,
      home: SafeArea(
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
