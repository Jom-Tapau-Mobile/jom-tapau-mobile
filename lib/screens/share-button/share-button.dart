import 'package:flutter/material.dart';
import 'package:share/share.dart';

class ShareButton extends StatelessWidget {
  final String text;
  final String url;

  ShareButton({required this.text, required this.url});

  void shareLink() {
    Share.share('$text\n$url');
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.share),
        onPressed: () {
          shareLink();
        });
  }
}
