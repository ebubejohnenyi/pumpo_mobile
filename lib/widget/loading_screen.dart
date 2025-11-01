import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/data/bloc/app_start/app_start_bloc.dart';
import 'package:mobile/data/bloc/app_start/app_start_state.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(context){
    return BlocListener<AppStartBloc, AppStartState>(listener: (ctx, state){
      if(state is FirstTimeUser){
        context.go('/splash');
      }else if(state is ReturningUser){
        context.go('/login');
      }
    },
      child: Scaffold(backgroundColor: Color(0xFF3E8672), body: Center(
        child: Image.asset('assets/png/logo.png', fit: BoxFit.contain, width: 150, height: 150, ),
      ),
    ));
  }
}
