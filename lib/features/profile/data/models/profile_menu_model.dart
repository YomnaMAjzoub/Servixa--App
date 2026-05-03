import 'package:flutter/material.dart';

class ProfileMenuItem {
  final String title;
  final String icon;
  final VoidCallback onTap;

  ProfileMenuItem({
    required this.title,
    required this.icon,
    required this.onTap,
  });
}