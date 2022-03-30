import 'package:flutter/material.dart';
import 'package:flutter_application/shared/app_cubits/cubit/news_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import '../shared/componants/componants.dart';

class Sports extends StatelessWidget {
  const Sports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        return state is SportsNewsLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemBuilder: (context, index) => BuildNewsListItem(
                    BlocProvider.of<NewsCubit>(context).scienceNews[index]),
                itemCount:
                    BlocProvider.of<NewsCubit>(context).scienceNews.length,
                physics: BouncingScrollPhysics(),
              );
      },
    );
  }
}
