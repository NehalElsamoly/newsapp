import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../cubit/cubits.dart';
import '../cubit/satates.dart';

//import '../../components/components.dart';

class Search extends StatelessWidget {
  // const Search({Key? key}) : super(key: key);
  var searchController=TextEditingController();


  Search({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        var list=NewsCubit.get(context).search;
        return Scaffold(
            appBar: AppBar(
              //  backgroundColor: Colors.cyan,
            ),
            body: Form(
              child: Column(
                  children:[
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child:
                      TextFormField(
                        keyboardType:TextInputType.text ,
                        controller:searchController,
                        onChanged: ( String value){
                          NewsCubit.get(context).getSearch(value);
                        },

                        validator:(value){

                          if(value!.isEmpty){
                            return 'search should be not empty';
                          }
                          return null;
                        },
                        decoration:InputDecoration(
                          border: InputBorder.none,
                          fillColor: Colors.grey,
                          filled: true,
                          hintText: 'Search HERE',
                        )
                        ,
                        //label:'search',
                        // prefix:Icons.search,
                      )
                      ,)]),
            )
        );
      },
    );
  }
}
