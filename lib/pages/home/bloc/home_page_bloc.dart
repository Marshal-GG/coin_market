import 'package:equatable/equatable.dart';

import '../../../core/models/crypto_model.dart';
import '../../../core/repositories/cryto/crypto_repo.dart';
import '../../../core/routes/route_config.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final CryptoRepository cryptoRepository = CryptoRepository();

  bool isLoading = false;
  bool isError = false;

  // final Map<int, Metadata> cryptoDetailsMap = {};
  Crypto crypto = Crypto(
    data: [],
    status: Status(
      timestamp: DateTime.now(),
      errorCode: 0,
      errorMessage: 'No Error',
      elapsed: 0,
      creditCount: 0,
      notice: 'No Notice',
      totalCount: 0,
    ),
  );

  // Metadata metadata = Metadata(
  //     data: Data(
  //         the1: The1(
  //             id: 0,
  //             name: '',
  //             symbol: '',
  //             category: '',
  //             description: '',
  //             slug: '',
  //             logo: '',
  //             subreddit: '',
  //             notice: '',
  //             tags: [],
  //             tagNames: [],
  //             tagGroups: [],
  //             urls: Urls(
  //                 website: [],
  //                 twitter: [],
  //                 messageBoard: [],
  //                 chat: [],
  //                 facebook: [],
  //                 explorer: [],
  //                 reddit: [],
  //                 technicalDoc: [],
  //                 sourceCode: [],
  //                 announcement: []),
  //             platform: null,
  //             dateAdded: DateTime(0),
  //             twitterUsername: '',
  //             isHidden: 0,
  //             dateLaunched: DateTime(0),
  //             contractAddress: [],
  //             selfReportedCirculatingSupply: null,
  //             selfReportedTags: null,
  //             selfReportedMarketCap: null,
  //             infiniteSupply: false)));

  HomePageBloc() : super(HomePageInitial()) {
    on<HomePageInitialLoadEvent>((event, emit) async {
      if (!isLoading) {
        isLoading = true;
        // emit(HomePageLoadState(
        //   crypto: crypto,
        //   isLoading: isLoading,
        //   isError: isError,
        //   // metadata: metadata,
        // ));

        try {
          crypto = await cryptoRepository.getCryptos();

          emit(HomePageLoadState(
            crypto: crypto,
            isLoading: isLoading,
            isError: isError,
            // metadata: metadata,
          ));
        } catch (e) {
          isError = true;
          print(e);
        }
        isLoading = false;

        isError = false;
      }
    });

    //   on<LoadCryptoDetailsEvent>((event, emit) async {
    //     if (!isLoading) {
    //       isLoading = true;
    //       try {
    //         metadata = await cryptoRepository.getCryptoDetails(event.cryptoId);

    //         // cryptoDetailsMap[event.cryptoId] = metadata;
    //         emit((state as HomePageLoadState).copyWith(
    //           metadata: metadata,
    //         ));

    //         // emit(HomePageDetailsLoadState(metadata));
    //       } catch (e) {
    //         print(e);
    //       }
    //       isLoading = false;
    //     }
    //   });
    // }
  }
}
