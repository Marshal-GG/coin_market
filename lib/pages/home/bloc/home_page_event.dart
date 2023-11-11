part of 'home_page_bloc.dart';

sealed class HomePageEvent extends Equatable {
  const HomePageEvent();

  @override
  List<Object> get props => [];
}

class HomePageInitialLoadEvent extends HomePageEvent {}

class LoadCryptoDetailsEvent extends HomePageEvent {
  final int cryptoId;

  LoadCryptoDetailsEvent(this.cryptoId);
   @override
  List<Object> get props => [cryptoId];
}
