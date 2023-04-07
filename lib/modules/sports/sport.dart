
import 'package:application_news/shared/cubit/cubit.dart';
import 'package:application_news/shared/cubit/state.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../components/components.dart';




class Sport extends StatelessWidget {
  const Sport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<NewsCubit,NewsStates>(
      listener: ( context, state) {  },
      builder: ( context, Object? state) {
        var list=NewsCubit.get(context).sports;
        return ArticleBuilder(list, context);
      },
    );
  }
}
