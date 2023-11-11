import 'package:auto_size_text/auto_size_text.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/routes/route_config.dart';
import 'bloc/home_page_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    BlocProvider.of<HomePageBloc>(context).add(HomePageInitialLoadEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePageState>(
      builder: (context, state) {
        if (state is HomePageLoadState) {
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.only(left: 26.w, right: 36.w),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gap(46.sp),
                        buildHeader(),
                        Gap(25.sp),
                        buildSearchBar(),
                        Gap(22.sp),
                        buildCard(state),
                        Gap(20.sp),
                        buildListViewHeader(),
                      ],
                    ),
                  ),
                  buildListView(state),
                ],
              ),
            ),
            bottomNavigationBar: buildBottomNavBar(),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Column buildListViewHeader() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Text(
              'Top Cryptocurrencies',
              style: TextStyle(
                color: Color(0xFF0A0A0A),
                fontSize: 18.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
            Spacer(),
            TextButton(
              onPressed: () {},
              child: Text(
                'View All',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0x7F0B0B0B),
                  fontSize: 13.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
            )
          ],
        ),
        Gap(20.sp),
      ],
    );
  }

  SliverList buildListView(state) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: (state as HomePageLoadState).crypto.data.length,
        (context, index) {
          final crypto = state.crypto.data[index];
          double percentChange1H = crypto.quote.usd.percentChange1H;

          String changeText = percentChange1H.toStringAsFixed(2);
          bool isPositive = percentChange1H > 0;
          return Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://s2.coinmarketcap.com/static/img/coins/64x64/${crypto.id}.png'),
              ),
              SizedBox(width: 16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    crypto.name.length > 8
                        ? '${crypto.name.substring(0, 8)}...'
                        : crypto.name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.9),
                      fontSize: 18.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                  Text(
                    capitalizeFirstLetter(crypto.slug),
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 13.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  )
                ],
              ),
              Gap(5),
              SvgPicture.asset(
                isPositive
                    ? 'assets/icons/price_up.svg'
                    : 'assets/icons/price_down.svg',
                width: 50.w,
                // height: 24.w,
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '\$${crypto.quote.usd.price.toStringAsFixed(0)} USD',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.9),
                      fontSize: 16.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                  Text(
                    '${isPositive ? '+' : ''}$changeText%',
                    style: TextStyle(
                      color: isPositive ? Color(0xFF00CE08) : Color(0xFFFF3D00),
                      fontSize: 13.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      height: 1.0,
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  Padding buildBottomNavBar() {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: DotNavigationBar(
        margin: EdgeInsets.only(left: 10, right: 10),
        currentIndex: 0,
        dotIndicatorColor: Colors.white,
        unselectedItemColor: Colors.grey[300],
        // enableFloatingNavBar: false,
        onTap: (p0) {},
        items: [
          /// Home
          DotNavigationBarItem(
            icon: Icon(Icons.home),
            selectedColor: Color(0xff73544C),
          ),

          /// Likes
          DotNavigationBarItem(
            icon: Icon(Icons.favorite),
            selectedColor: Color(0xff73544C),
          ),

          /// Search
          DotNavigationBarItem(
            icon: Icon(Icons.search),
            selectedColor: Color(0xff73544C),
          ),

          /// Profile
          DotNavigationBarItem(
            icon: Icon(Icons.person),
            selectedColor: Color(0xff73544C),
          ),
        ],
      ),
    );
  }

  Column buildCard(HomePageLoadState state) {
    String changeText =
        state.crypto.data[0].quote.usd.percentChange1H.toStringAsFixed(2);
    bool isPositive = state.crypto.data[0].quote.usd.percentChange1H > 0;
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Cryptocurrency',
              style: TextStyle(
                color: Color(0xFF0A0A0A),
                fontSize: 20.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
            Gap(20.sp),
            Text(
              'NFT',
              style: TextStyle(
                color: Color(0x4C0A0A0A),
                fontSize: 20.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            )
          ],
        ),
        Gap(15.sp),
        Container(
          width: 317.w,
          height: 131.h,
          decoration: ShapeDecoration(
            color: Color(0x1900CE08),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 80.h,
                right: 0,
                left: 0,
                bottom: 0,
                child: SvgPicture.asset(
                  'assets/icons/price_up_card.svg',
                  fit: BoxFit.fitWidth,
                ),
              ),
              Positioned(
                top: 26.h,
                left: 20.w,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://s2.coinmarketcap.com/static/img/coins/64x64/1.png'),
                ),
              ),
              Positioned(
                top: 28.h,
                left: 81.w,
                child: Text(
                  state.crypto.data[0].symbol,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                  top: 54.h,
                  left: 81.w,
                  child: Text(
                    state.crypto.data[0].name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  )),
              Positioned(
                top: 30.h,
                right: 19.w,
                child: Text(
                  '\$${formatPrice(state.crypto.data[0].quote.usd.price)} USD',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                top: 54.h,
                right: 19.w,
                child: Text(
                  '${isPositive ? '+' : ''}$changeText%',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: isPositive ? Color(0xFF00CE08) : Color(0xFFFF3D00),
                    fontSize: 13.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Row buildSearchBar() {
    return Row(
      children: [
        SizedBox(
          height: 40.h,
          width: 225.w,
          child: TextField(
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              label: AutoSizeText(
                'Search Cryptocurrency',
                maxLines: 1,
                style: TextStyle(
                  color: Color(0x4C0A0A0A),
                  fontSize: 13.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
              isDense: true,
              contentPadding: EdgeInsets.all(8),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              fillColor: Color(0x0C0A0A0A),
              filled: true,
              prefixIcon: Icon(Icons.search, color: Color(0x4C0A0A0A)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        Spacer(),
        SizedBox(
          height: 40.h,
          width: 85.w,
          child: OutlinedButton.icon(
            onPressed: () {},
            style: ButtonStyle(
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0))),
              foregroundColor: MaterialStatePropertyAll(
                Color(0x4C0A0A0A),
              ),
            ),
            icon: Icon(
              Icons.filter_list,
              size: 16.sp,
            ),
            label: AutoSizeText(
              'Filter',
              maxLines: 1,
              style: TextStyle(
                color: Color(0x4C0A0A0A),
                fontSize: 13.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row buildHeader() {
    return Row(
      children: [
        Text(
          'EXCHANGES',
          style: TextStyle(
            color: Color(0xFF0A0A0A),
            fontSize: 20.sp,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            height: 0.h,
          ),
        ),
        Spacer(),
        Stack(
          children: [
            IconButton(
              iconSize: 24.sp,
              onPressed: () {},
              icon: Icon(Icons.notifications_outlined),
            ),
            Positioned(
              top: 2.h,
              right: 3.w,
              child: Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.yellow,
                ),
                child: Text(
                  '  ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10.sp,
                  ),
                ),
              ),
            )
          ],
        ),
        Gap(16),
        IconButton(
          iconSize: 24.sp,
          onPressed: () {},
          icon: Icon(Icons.settings_outlined),
        )
      ],
    );
  }
}

String capitalizeFirstLetter(String text) {
  if (text.isEmpty) return text;
  return text[0].toUpperCase() + text.substring(1);
}

String formatPrice(double price) {
  String formattedPrice = price.toStringAsFixed(0);
  final RegExp regExp = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  formattedPrice = formattedPrice.replaceAllMapped(
    regExp,
    (Match match) => '${match.group(1)},',
  );
  return formattedPrice;
}
