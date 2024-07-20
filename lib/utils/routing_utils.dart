import 'package:flutter/cupertino.dart';

void onNavbarItemTapped(int pageIndex, int index, BuildContext context) {
  if (index == pageIndex) {
    return;
  }
  switch (index) {
    case 0:
      Navigator.pushNamed(context, '/homepage');
      break;
    case 1:
      Navigator.pushNamed(context, '/nearby');
      break;
    case 2:
      break;
    case 3:
    // Handle Info page navigation
      break;
    default:
      break;
  }
}