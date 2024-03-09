library dayalog;

import 'package:flutter/material.dart';

enum DialogAction { positive, negative }

class Dayalog {
  static Future<DialogAction> decision(
    BuildContext context,
    String title,
    Widget content,
    String positiveText,
    String negativeText,
  ) async {
    final action = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Text(title),
          content: content,
          actions: <Widget>[
            GestureDetector(
              onTap: () => Navigator.of(context).pop(DialogAction.negative),
              child: Container(
                width: 78,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Colors.grey, borderRadius: BorderRadius.circular(4)),
                child: Center(
                  child: Text(
                    negativeText,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).pop(DialogAction.positive),
              child: Container(
                width: 78,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: Text(
                    positiveText,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
    return (action != null) ? action : DialogAction.negative;
  }
}
