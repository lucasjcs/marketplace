import 'package:flutter/material.dart';
import 'package:marketplace_nuconta/app/ui/components/components.dart';
import 'package:marketplace_nuconta/app/ui/styles/app_colors.dart';

class Money extends StatelessWidget {
  final String value;
  final double size;
  final Color color;
  final bool bold;

  const Money({
    required this.value,
    this.bold = false,
    this.size = 16,
    this.color = AppColors.textDark,
  });

  @override
  Widget build(BuildContext context) {
    final money = value.split(',');
    final decimal = int.tryParse(money.last);
    return Wrap(
      children: [
        NuText(
          text: '\$ ${money.first}',
          size: size,
          bold: bold,
          color: color,
        ),
        decimal != null && decimal > 0
            ? Padding(
                padding: const EdgeInsets.only(top: 1),
                child: NuText(
                  text: '${money.last}',
                  size: size - 4,
                  bold: bold,
                  color: color,
                ),
              )
            : Text(''),
      ],
    );
  }
}
