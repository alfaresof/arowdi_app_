import 'package:flutter/material.dart';

import 'color.dart';


class big_text extends StatelessWidget {
  final String text;
  const big_text({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '${text}',
      style: TextStyle(
        color: orange_color,
        fontSize: 30,
        fontFamily: 'kufam',
      ),
    );
  }
}
class orange_text extends StatelessWidget {
  final String text;
  const orange_text({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '${text}',
      style: TextStyle(
        color: orange_color,
        fontSize: 25,
        fontFamily: 'kufam',
      ),
    );
  }
}
class orange_text_small extends StatelessWidget {
  final String text;
  const orange_text_small({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '${text}',
      style: TextStyle(
        color: orange_color,
        fontSize: 18,
        fontFamily: 'kufam',
      ),
    );
  }
}

class black_text extends StatelessWidget {
  final String text;
  const black_text({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '${text}',
      textAlign: TextAlign.center,
      style: TextStyle(
          color: black_color, fontFamily: 'kufam', fontSize: 18),
    );
  }
}

class white_text extends StatelessWidget {
  final String text;
  const white_text({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '${text}',
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Colors.white, fontFamily: 'kufam', fontSize: 18),
    );
  }
}