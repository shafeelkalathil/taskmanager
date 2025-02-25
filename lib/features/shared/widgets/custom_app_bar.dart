import 'package:flutter/material.dart';
import 'package:task_management_app/core/constants/colors_constants.dart';
import 'package:task_management_app/core/utils/extensions/size_extension.dart';
import 'package:task_management_app/core/utils/styles/text_style.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    required this.title,
    super.key,
    this.bottomWidget,
    this.backgroundColor,
    this.trailing,
  });
  final String title;
  final PreferredSizeWidget? bottomWidget;
  final Color? backgroundColor;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final hasDrawer = Scaffold.of(context).hasDrawer;
    final canPop = Navigator.of(context).canPop();
    return AppBar(
      title: Text(title, style: mainMedium18.copyWith(color: neutral.shade900)),
      actions: [trailing ?? const SizedBox.shrink()],
      surfaceTintColor: Colors.transparent,
      shadowColor:
      bottomWidget != null ? neutral.shade100.withOpacity(0.5) : null,
      elevation: bottomWidget != null ? 1 : null,
      backgroundColor: backgroundColor ?? Colors.white,
      leading: leadingIcon(context, hasDrawer: hasDrawer, canPop: canPop),
      bottom: bottomWidget,
      centerTitle: true,
      leadingWidth: context.screenWidth * 0.2,
    );
  }

  Widget? leadingIcon(
      BuildContext context, {
        required bool hasDrawer,
        required bool canPop,
      }) {
    if (canPop) {
      return IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: const Icon(Icons.arrow_back_ios,size: 15,)
      );
    }
    if (hasDrawer) {
      return Padding(
        padding: EdgeInsets.only(
          left: context.screenWidth * 0.03,
        ),
        child: IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: CircleAvatar(
            radius: 20,
            backgroundColor: neutral.shade100,
          ),
        ),
      );
    }
    return null;
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(bottomWidget != null ? 100 : kToolbarHeight);
}
