import 'package:flutter/material.dart';

class HDivider extends StatelessWidget {
  const HDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      thickness: 1.1,
      indent: 10,
      endIndent: 10,
    );
  }
}

class VDivider extends StatelessWidget {
  const VDivider({super.key, required this.height});

  final num height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.toDouble(),
      child: const VerticalDivider(
        thickness: 1.8,
      ),
    );
  }
}
