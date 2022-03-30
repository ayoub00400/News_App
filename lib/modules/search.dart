import 'package:flutter/material.dart';
import 'package:flutter_application/shared/app_cubits/cubit/news_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/app_cubits/cubit/apptheming_cubit.dart';
import '../shared/componants/componants.dart';

class SearchPage extends StatelessWidget {
  //const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 8,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.keyboard_arrow_left_sharp,
                  size: 35,
                  color: BlocProvider.of<AppCubit>(context).isblackmode
                      ? Colors.white
                      : Colors.black,
                )),
            title: Container(
              padding: EdgeInsets.symmetric(vertical: 4),
              width: 400,
              height: 50,
              child: TextFormField(
                // onFieldSubmitted: (value) => print('field submitted'),
                onChanged: (searchstring) {
                  BlocProvider.of<NewsCubit>(context)
                      .Searchfetching(searchstring);
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search,
                      color: BlocProvider.of<AppCubit>(context).isblackmode
                          ? Colors.white
                          : Colors.black),
                  isDense: true,
                  focusedBorder: Theme.of(context).inputDecorationTheme.border,

                  enabledBorder: Theme.of(context).inputDecorationTheme.border,

                  hintStyle: TextStyle(
                      color: BlocProvider.of<AppCubit>(context).isblackmode
                          ? Colors.white
                          : Colors.black),
                  //enabledBorder: InputBorder ,
                  hintText: 'Search...',
                ),
              ),
            ),
          ),
          body: Column(
            children: [
              Expanded(child: Container(child:
                  BlocBuilder<NewsCubit, NewsState>(builder: ((context, state) {
                if (state is SearchDataLoading) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: BlocProvider.of<NewsCubit>(context)
                          .searchresult
                          .length,
                      itemBuilder: (context, index) {
                        return BuildNewsListItem(
                            BlocProvider.of<NewsCubit>(context)
                                .searchresult[index]);
                      });
                }
              }))))
            ],
          )),
    );
  }
}
