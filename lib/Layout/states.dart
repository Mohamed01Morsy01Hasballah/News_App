abstract class NewsAppStates {}
class initialState extends  NewsAppStates{}
class ChangeState extends  NewsAppStates{}
class ChangeModeState extends  NewsAppStates{}


class GetBusinessLoadingState extends NewsAppStates{}
class GetBusinessSucessState extends NewsAppStates{}
class GetBusinessErrorState extends NewsAppStates{}
class GetSportsLoadingState extends NewsAppStates{}
class GetSportsSucessState extends NewsAppStates{}
class GetSportsErrorState extends NewsAppStates{}
class GetScienceLoadingState extends NewsAppStates{}
class GetScienceSucessState extends NewsAppStates{}
class GetScienceErrorState extends NewsAppStates{}

class GetSearchLoadingState extends NewsAppStates{}
class GetSearchSucessState extends NewsAppStates{}
class GetSearchErrorState extends NewsAppStates{}

