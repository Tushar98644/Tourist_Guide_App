// ignore_for_file: prefer_const_constructors, duplicate_ignore, unnecessary_import, implementation_imports

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubits.dart';
import 'package:travel_app/cubit/app_cubits_states.dart';
import 'package:travel_app/pages%20/detail_page.dart';
import 'package:travel_app/pages%20/home_page.dart';
import 'package:travel_app/pages%20/welcome_page.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({super.key});

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<AppCubits, Cubicstates>(builder: ((context, state) {
      if (state is WelcomeState) {
        return Welcomepage();
      }
      if (state is LoadedState) {
        return HomePage();
      }
      if (state is DetailState) {
        return DetailPage();
      }
      if (state is LoadingState) {
        // ignore: prefer_const_constructors
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return Container();
      }
    })));
  }
}
