import 'dart:html';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class PlayerWidget extends StatefulWidget {
  @override
  _PlayerWidgetState createState() => _PlayerWidgetState();
}

class _PlayerWidgetState extends State<PlayerWidget> {
  final IFrameElement _iframeElement = IFrameElement();

  @override
  Widget build(BuildContext context) {
    _iframeElement.height = '240';
    _iframeElement.width = '575';
    _iframeElement.src = '//www.zeno.fm/player/yourock-online';
    _iframeElement.style.border = 'none';

// ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'iframeElement',
      (int viewId) => _iframeElement,
    );

    Widget _iframeWidget;
    _iframeWidget = HtmlElementView(
      key: UniqueKey(),
      viewType: 'iframeElement',
    );
    return SizedBox(
      height: 240,
      width: 575,
      child: _iframeWidget,
    );
  }
}
