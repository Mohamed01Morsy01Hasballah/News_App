
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Layout/states.dart';
import 'package:news_app/Modules/Science.dart';
import 'package:news_app/Modules/business.dart';
import 'package:news_app/Modules/sports.dart';
import 'package:news_app/Shared/remote/CacheHelper.dart';
import 'package:news_app/Shared/remote/DioHelper.dart';

class NewsAppCubit extends Cubit<NewsAppStates>{
  NewsAppCubit():super(initialState());

  static NewsAppCubit get(context)=>BlocProvider.of(context);
  var CurrentIndex=0;
  void ChangeBottomNav(int index){
    CurrentIndex=index;
    if(index==1)
      GetSports();
    if(index==2)
      GetScience();
    emit(ChangeState());
  }
  bool dark=true;
  void ChangeMode({
  bool? Shared
}){
    if (Shared !=null){
      dark=Shared;
      emit(ChangeModeState());
    }
    else{
      dark = !dark;
      CacheHelper.SetData(key: 'Dark', value: true).then((value) {
        emit(ChangeModeState());

      });
    }


  }
  List<Widget> Screen=
  [
    BusinessScreen(),
    SportsScreen(),
    SciencesScreen(),

  ];
  List<dynamic> Business=[];
  void GetBusiness(){

    emit(GetBusinessLoadingState());

    DioHelper.getData(
   url: 'v2/top-headlines',
   query: {
  'country':'eg',
   'category':'business',
   'apiKey':'894c74181cfa4402ac0567f6f6b47888',
   }
   ).then((value) {
    Business=value.data['articles'];
    print(Business[0]['title']);
    emit(GetBusinessSucessState());
   }).catchError((error){
     emit(GetBusinessErrorState());
     print('error${error.toString()}');

   });
  }
  List<dynamic> Sports=[];
  void GetSports(){
    emit(GetSportsLoadingState());

    if(Sports.length==0){

      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country':'eg',
            'category':'sports',
            'apiKey':'894c74181cfa4402ac0567f6f6b47888',
          }
      ).then((value) {
        Sports=value.data['articles'];
        print(Sports[0]['title']);
        emit(GetSportsSucessState());
      }).catchError((error){
        emit(GetBusinessErrorState());
        print('error${error.toString()}');

      });
    }else{
      emit(GetSportsSucessState());

    }

  }
  List<dynamic> Science=[];
  void GetScience(){
    emit(GetScienceLoadingState());
  if(Science.length==0){
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'science',
          'apiKey':'894c74181cfa4402ac0567f6f6b47888',
        }
    ).then((value) {
      Science=value.data['articles'];
      print(Science[0]['title']);
      emit(GetScienceSucessState());
    }).catchError((error){
      emit(GetScienceErrorState());
      print('error${error.toString()}');

    });
  }else{
    emit(GetScienceSucessState());

  }

  }
  List<dynamic> Search=[];
  void GetSearch(String value){
    emit(GetSearchLoadingState());
      DioHelper.getData(
          url: 'v2/everything',
          query: {
            'q':'$value',
            'apiKey':'894c74181cfa4402ac0567f6f6b47888',
          }
      ).then((value) {
        Search=value.data['articles'];
        print(Search[0]['title']);
        emit(GetSearchSucessState());
      }).catchError((error){
        emit(GetSearchSucessState());
        print('error${error.toString()}');
      });
  }
}
