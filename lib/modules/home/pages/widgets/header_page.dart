import 'package:flutter/material.dart';

class HeaderPage extends StatelessWidget {
  const HeaderPage({Key? key, this.width = 100.0}) : super(key: key);
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                height: 2,
                color: Colors.grey.shade300,
              ),
            ),
            Container(
              color: const Color.fromARGB(255, 138, 135, 135),
              height: 40,
              width: 200,
              child: FittedBox(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'IMAGENS DO AGRONEGÓCIO',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(color: Colors.white),
                ),
              )),
            ),
            Expanded(
              child: Container(
                height: 2,
                color: Colors.grey.shade300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
