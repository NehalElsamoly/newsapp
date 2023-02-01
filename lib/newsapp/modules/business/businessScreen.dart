import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import '../../component/components.dart';
import '../../cubit/cubits.dart';
import '../../cubit/satates.dart';
//import '../../layout/components/components.dart';
//import '../../layout/newsapp/cubit/cubits.dart';
//import '../../layout/newsapp/cubit/states.dart';

class BusinessScreen extends StatelessWidget {
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

