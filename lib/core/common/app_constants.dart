import 'package:flutter/material.dart';
import 'package:well_shift_app/presentation/pages/dashboard/journey_page.dart';
import 'package:well_shift_app/presentation/pages/dashboard/profile_page.dart';
import 'package:well_shift_app/presentation/pages/dashboard/progress_page.dart';
import 'package:well_shift_app/presentation/pages/dashboard/recommend_page.dart';
import 'package:well_shift_app/presentation/pages/dashboard/support_page.dart';

const List<Widget> pages = [
  ProgressPage(),
  JourneyPage(),
  RecommendPage(),
  SupportPage(),
  ProfilePage(),
];