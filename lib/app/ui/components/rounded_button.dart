import 'package:flutter/material.dart';
import 'package:marketplace_nuconta/app/ui/components/loading.dart';
import '../../ui/styles/app_colors.dart';

class RoundedButton extends StatelessWidget {
  final Function? onPress;
  final String text;
  final Color? textColor;
  final Color? color;
  final bool loading;
  final bool fullWidth;

  const RoundedButton({
    required this.text,
    this.onPress,
    this.textColor = AppColors.white,
    this.color = AppColors.purple,
    this.loading = false,
    this.fullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: fullWidth ? double.infinity : null,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color,
          primary: textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
        ),
        onPressed: () => {if (onPress != null) onPress!()},
        child: Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: this.loading
              ? Loading(color: textColor!, size: 15)
              : Text(this.text),
        ),
      ),
    );
  }
}
