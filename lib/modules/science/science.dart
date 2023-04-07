
import 'package:application_news/shared/cubit/cubit.dart';
import 'package:application_news/shared/cubit/state.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/components.dart';




class Sciences extends StatelessWidget {
  const Sciences({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<NewsCubit,NewsStates>(
      listener: ( context, state) {  },
      builder: ( context, Object? state) {
        var list=NewsCubit.get(context).sciences;
        return ArticleBuilder(list, context);
      },
    );
  }
}
