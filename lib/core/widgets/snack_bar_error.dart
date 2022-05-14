import 'package:flutter/material.dart';

class SnackBarError {
  static void _show(BuildContext context,
      {required Color color,
      required String text,
      Duration duration = const Duration(seconds: 5)}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        elevation: 8.0,
        backgroundColor: color,
        duration: duration,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        padding: EdgeInsets.zero,
        content: LayoutBuilder(builder: (context, sizes) {
          return SizedBox(
            height: 60,
            width: sizes.maxWidth,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.error_outline,
                    color: Colors.white,
                    size: 30,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        text,
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(color: Colors.white, fontSize: 13),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  static void showError(
    BuildContext context, {
    String message = 'Ocorreu um erro inesperado',
    Color color = const Color.fromARGB(176, 255, 0, 0),
  }) {
    _show(context, text: message, color: color);
  }
}
