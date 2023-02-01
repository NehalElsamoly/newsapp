import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../component/components.dart';
import '../../cubit/cubits.dart';
import '../../cubit/satates.dart';


class SportScreen extends StatelessWidget {
  const SportScreen({Key? key}) : super(key: key);


  @override

  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        var list=NewsCubit.get(context).business;
        return ConditionalBuilder(
          condition:list.isNotEmpty,
          builder: (context)=>ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder:(context,index)=>buildArticleItem(list[index],context)
            , separatorBuilder: ( context,  index)=>myDivider()
            ,itemCount: list.length, ),
          fallback: (context)=>const Center(child:CircularProgressIndicator()),
        );
      },

    );
  }
}

