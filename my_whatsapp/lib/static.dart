import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class StaticClass extends StatefulWidget {
  const StaticClass({super.key});

  @override
  State<StaticClass> createState() => _StaticClassState();
}

class _StaticClassState extends State<StaticClass> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
