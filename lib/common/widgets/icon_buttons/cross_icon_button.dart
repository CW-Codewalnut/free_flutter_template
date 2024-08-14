import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/common/translations/locale_keys.g.dart';

class CrossIconButton extends StatelessWidget {

  final Color? color;
  final double size ;

  const CrossIconButton({super.key, this.size = 20, this.color});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: LocaleKeys.close.tr(),
      onPressed: Navigator.of(context).pop,
      splashRadius: size * 1.5,
      constraints: const BoxConstraints(),
      icon: Icon(
        Icons.close,
        color: color,
        size: size,
      ),
    );
  }
}
