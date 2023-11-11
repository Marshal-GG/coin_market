part of 'home_page_bloc.dart';

sealed class HomePageState extends Equatable {
  const HomePageState();

  @override
  List<Object> get props => [];
}

final class HomePageInitial extends HomePageState {}

class HomePageLoadState extends HomePageState {
  final Crypto crypto;
  // final Metadata metadata;
  final bool isLoading;
  final bool isError;

  HomePageLoadState({
    required this.crypto,
    // required this.metadata,
    required this.isLoading,
    required this.isError,
  });

  HomePageLoadState copyWith({
    Crypto? crypto,
    // Metadata? metadata,
    bool? isLoading,
    bool? isError,
  }) {
    return HomePageLoadState(
      crypto: crypto ?? this.crypto,
      // metadata: metadata ?? this.metadata,
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
    );
  }

  @override
  List<Object> get props => [
        crypto,
        // metadata,
        isLoading,
        isError,
      ];
}

// class HomePageDetailsLoadState extends HomePageState {
//   final Metadata metadata;
//   HomePageDetailsLoadState(this.metadata);
//    @override
//   List<Object> get props => [metadata];
// }
