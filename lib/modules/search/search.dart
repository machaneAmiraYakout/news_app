
import 'package:application_news/shared/cubit/cubit.dart';
import 'package:application_news/shared/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../components/components.dart';



class Search extends StatelessWidget {
  TextEditingController Controller= TextEditingController();
  @override
  Widget build(BuildContext context) {
    var list=NewsCubit.get(context).search;
    return BlocProvider(create:(context)=>NewsCubit() ,
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state){},
        builder: (context, state){
          return
            Scaffold(
              appBar: AppBar(),
              body: Column(
                children: [
                  Padding(padding: const EdgeInsets.all(20.0),
                    child:  DefaultFormField(
                        controller: Controller,
                        textType: TextInputType.text,
                        icon: Icon(Icons.search),
                        validator: (value){
                          if(value.isEmpty()){
                            return 'Search must not be empty';
                          }
                          return null;
                        },
                        onchanged:(values){
                          NewsCubit.get(context).getSearch(values);
                        },
                        labelText: 'Search'),),
                  ArticleBuilder(list, context),

                ],
              ),
            );
        }),);
  }
}
