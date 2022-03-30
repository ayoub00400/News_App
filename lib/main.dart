import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/shared/app_cubits/cubit/appthemingstates.dart';
import 'package:flutter_application/shared/app_cubits/cubit/news_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'layout/home_layout.dart';
import 'shared/app_cubits/cubit/apptheming_cubit.dart';

void main() {
  runApp(My_app());
}

class My_app extends StatefulWidget {
  My_app({Key? key}) : super(key: key);

  @override
  State<My_app> createState() => _My_appState();
}

class _My_appState extends State<My_app> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AppCubit(),
          ),
          BlocProvider<NewsCubit>(
            create: (context) => NewsCubit()
              ..LoadingBusinessNews()
              ..LoadingSciencesNews()
              ..LoadingSportsNews(),
          )
        ],
        child: Builder(
          builder: (ctx) => BlocBuilder<AppCubit, AppStates>(
            builder: (context, state) => MaterialApp(
                debugShowCheckedModeBanner: false,
                themeMode: BlocProvider.of<AppCubit>(context).isblackmode
                    ? ThemeMode.dark
                    : ThemeMode.light,
                theme: ThemeData(
                    inputDecorationTheme: InputDecorationTheme(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(20))),
                    textTheme: TextTheme(
                        bodyMedium:
                            TextStyle(color: Colors.black, fontSize: 26)),
                    scaffoldBackgroundColor: Colors.white,
                    appBarTheme: AppBarTheme(
                        backgroundColor: Colors.white, elevation: 0)),
                darkTheme: ThemeData(
                    inputDecorationTheme: InputDecorationTheme(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(20))),
                    textTheme: TextTheme(
                        bodyMedium:
                            TextStyle(color: Colors.white, fontSize: 26)),
                    bottomNavigationBarTheme: BottomNavigationBarThemeData(
                        elevation: 80,
                        selectedItemColor: Colors.white,
                        backgroundColor: Color.fromARGB(255, 188, 56, 211)),
                    scaffoldBackgroundColor: Color.fromARGB(255, 43, 42, 42),
                    appBarTheme: AppBarTheme(
                        elevation: 0,
                        backgroundColor: Color.fromARGB(255, 43, 42, 42),
                        systemOverlayStyle: SystemUiOverlayStyle(systemNavigationBarColor: Colors.white, statusBarColor: Colors.red, statusBarIconBrightness: Brightness.dark))),
                home: HomeLayout()),
          ),
        ));
  }
}
