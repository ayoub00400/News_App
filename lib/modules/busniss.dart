import 'package:flutter/material.dart';
import 'package:flutter_application/shared/app_cubits/cubit/news_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

import '../shared/componants/componants.dart';

class Business extends StatelessWidget {
  // const Business({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(onRefresh: () async {
      BlocProvider.of<NewsCubit>(context).LoadingBusinessNews();
    }, child: BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        return state is businessNewsLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemBuilder: (context, index) => BuildNewsListItem(
                    BlocProvider.of<NewsCubit>(context).businessNews[index]),
                itemCount:
                    BlocProvider.of<NewsCubit>(context).businessNews.length,
                physics: BouncingScrollPhysics(),
              );
      },
    ));
  }
}
