import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

@RoutePage()
class TalkerLoggerScreen extends StatelessWidget {
  const TalkerLoggerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TalkerScreen(talker: GetIt.I<Talker>());
  }
}
