import 'package:flutter_bloc/flutter_bloc.dart';

import '../../pages/home/bloc/home_page_bloc.dart';
import 'route_config.dart';

List<SingleChildWidget> providers = [
  BlocProvider(
    create: (context) => HomePageBloc(),
  )
];
