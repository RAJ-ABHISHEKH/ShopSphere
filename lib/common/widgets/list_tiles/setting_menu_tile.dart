import 'package:android_d/utlis/constants/colors.dart';
import 'package:flutter/material.dart';

class TSettingMenuTile extends StatelessWidget {
  const TSettingMenuTile(
      {super.key,
      required this.title,
      required this.subtitle,
      this.trailing,
      required this.icon, required this.ontap});

  final String title;
  final String subtitle;
  final Widget? trailing;
  final IconData icon;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 28,
        color: TColors.primary,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      trailing: trailing,
      onTap: ontap,
    );
  }
}
