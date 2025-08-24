import 'package:flutter/material.dart';

class GradientAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GradientAppBar(
      {super.key,
      this.title,
      this.isTitle = true,
      required this.gradientColors,
      required this.isAction,
      this.iconAction,
      this.needBorder = false,
      this.isLeading = false,
      this.iconLeading,
      this.onPressed});
  final String? title;
  final bool? isTitle;
  final List<Color> gradientColors;
  final bool? isLeading;
  final bool isAction;
  final List<IconButton>? iconAction;
  final IconData? iconLeading;
  final bool? needBorder;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: needBorder! ? BorderRadius.circular(20) : null,
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: AppBar(
        title: isTitle == true
            ? Text(
                title!,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )
            : null,
        leading: isLeading == true
            ? IconButton(
                onPressed: onPressed,
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 12.0, left: 8),
                  child: Icon(
                    iconLeading,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
              )
            : null,
        actions: isAction ? iconAction : null,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
