import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Layout/cubit.dart';
import 'package:news_app/Layout/states.dart';
import 'package:news_app/Shared/component.dart';

class SearchScreen extends StatelessWidget{
  var text=TextEditingController();
  @override
  Widget build(BuildContext context) {
   return BlocConsumer<NewsAppCubit,NewsAppStates>(
     listener: (context,state){},
     builder: (context,state){
       var cubit=NewsAppCubit.get(context);
       var List=NewsAppCubit.get(context).Search;

       return Scaffold(
           appBar: AppBar(),
           body: Column(
             children: [
               Padding(
                 padding: const EdgeInsets.all(20.0),
                 child: TextFormField(
                   controller: text,
                   decoration: InputDecoration(
                       label:Text('search'),
                       border: OutlineInputBorder(),
                       prefixIcon:Icon( Icons.search)

                   ),
                   onChanged: (value){
                    cubit.GetSearch(value);
                   },
                 ),
               ),
               Expanded(
                 child:ConditionalBuilder(
                     condition: List.length>0,
                     builder: (context)=>ListView.separated(
                         itemBuilder: (context,index)=>BuildRowItem(List[index],context),
                         separatorBuilder: (context,index)=>Container(
                           width: double.infinity,
                           height: 1,
                           decoration: BoxDecoration(
                               color: Colors.grey[300]

                           ),

                         ),
                         itemCount:List.length
                     ),
                     fallback: (context)=>Center(child: CircularProgressIndicator())
                 ),
               )


             ],
           )
       );
     },

   );
  }


}