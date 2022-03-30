import 'package:flutter/material.dart';
import 'package:flutter_application/modules/search.dart';
import 'package:flutter_application/shared/app_cubits/cubit/apptheming_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/app_cubits/cubit/bottumnavbar_cubit.dart';
import '../shared/app_cubits/cubit/bottumnavbar_state.dart';
import '../shared/app_cubits/cubit/bottumnavbar_state.dart';
import '../shared/network/external/diohelper.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DioHelper.Dio_Init();
    return SafeArea(
        child: BlocProvider<BottumnavbarCubit>(
            create: (context) => BottumnavbarCubit(),
            child: Builder(
                builder: ((ctx) => Scaffold(
                      appBar: AppBar(
                        title: Text(
                          'NEWS',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        actions: [
                          IconButton(
                              onPressed: () {
                                Navigator.of(ctx).push(MaterialPageRoute(
                                    builder: (ctx) => SearchPage()));
                              },
                              icon:
                                  BlocProvider.of<AppCubit>(context).isblackmode
                                      ? Icon(Icons.search)
                                      : Icon(
                                          Icons.search,
                                          color: Colors.black,
                                        )),
                          IconButton(
                              onPressed: () {
                                BlocProvider.of<AppCubit>(ctx).ChangeAppMode();
                              },
                              icon:
                                  BlocProvider.of<AppCubit>(context).isblackmode
                                      ? Icon(Icons.brightness_3)
                                      : Icon(
                                          Icons.brightness_3,
                                          color: Colors.black,
                                        ))
                        ],
                      ),
                      bottomNavigationBar:
                          BlocBuilder<BottumnavbarCubit, BottumnavbarState>(
                        builder: (ctx, state) {
                          return BottomNavigationBar(
                            currentIndex:
                                BlocProvider.of<BottumnavbarCubit>(ctx)
                                    .page_index,
                            items: [
                              BottomNavigationBarItem(
                                  label: 'Busniss', icon: Icon(Icons.business)),
                              BottomNavigationBarItem(
                                  label: 'Science', icon: Icon(Icons.sports)),
                              BottomNavigationBarItem(
                                  label: 'Sports', icon: Icon(Icons.science))
                            ],
                            onTap: (index) {
                              BlocProvider.of<BottumnavbarCubit>(ctx)
                                  .ChangePage(index);
                            },
                          );
                        },
                      ),
                      body: BlocBuilder<BottumnavbarCubit, BottumnavbarState>(
                          builder: (ctx, state) {
                        return BlocProvider.of<BottumnavbarCubit>(ctx)
                            .UpdateAppScreen();
                      }),
                    )))));
  }
}
