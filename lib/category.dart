import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_ad2/provider/food_name.dart';
import 'package:youtube_ad2/provider/food_provider.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:youtube_ad2/screen/result_screen.dart';

class CategoryScreen extends StatefulWidget {
  CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  InterstitialAd? interstitialAd;
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    Provider.of<Category>(context, listen: false);
  }

  @override
  void didChangeDependencies() {
    //TODO implement didChangeDependencies
    super.didChangeDependencies();
    InterstitialAd.load(
      adUnitId: 'ca-app-pub-9892296110122964/2873785204',
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          setState(() {
            isLoaded = true;
            interstitialAd = ad;
          });
          print("Ad Loaded");
        },
        onAdFailedToLoad: (error) {
          print("Interstitial Failed to load");
        },
      ),
    );
  }

  review() async {
    if (await canLaunch(
        'https://play.google.com/store/apps/details?id=com.koa.show_me_the_menu')) {
      await launch(
          'https://play.google.com/store/apps/details?id=com.koa.show_me_the_menu');
    } else {
      throw 'Could Not Launch URL';
    }
  }

  List pressAttention = [
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
  ];
  List selectedCategory = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          '?????? ??? ??????',
          textAlign: TextAlign.end,
          style: TextStyle(
            fontFamily: 'SB',
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => review(),
            icon: Icon(Icons.reviews),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('???????????? ???????????????'),
          Text('????????????? \u{2665}'),
          SizedBox(height: 100),
          ElevatedButton(
            onPressed: () {
              setState(() {
                pressAttention[10] = !pressAttention[10];
              });
              debugPrint(pressAttention[10].toString());
              (pressAttention[10])
                  ? selectedCategory.remove('????????????')
                  : selectedCategory.add('????????????');
              debugPrint(selectedCategory.toString());
              (pressAttention[10])
                  ? context.read<Category>().removeCategory(randomFoodList)
                  : context.read<Category>().addCategory(randomFoodList);
              debugPrint(context.read<Category>().category.toString());
              debugPrint(context.read<Category>().category.length.toString());
            },
            style: ElevatedButton.styleFrom(
              primary: (pressAttention[10]) ? Color(0xFFF44336) : Colors.orange,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)),
            ),
            child: Text(' \u{1f374} ???????????? '),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    pressAttention[0] = !pressAttention[0];
                  });
                  debugPrint(pressAttention[0].toString());
                  (pressAttention[0])
                      ? selectedCategory.remove('??????')
                      : selectedCategory.add('??????');
                  debugPrint(selectedCategory.toString());
                  (pressAttention[0])
                      ? context.read<Category>().removeCategory(kor)
                      : context.read<Category>().addCategory(kor);
                  debugPrint(context.read<Category>().category.toString());
                },
                style: ElevatedButton.styleFrom(
                  primary: (pressAttention[0]) ? Colors.red : Colors.orange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                ),
                child: Text(' \u{1f35a} ?????? '),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    pressAttention[1] = !pressAttention[1];
                  });
                  debugPrint(pressAttention[1].toString());
                  (pressAttention[1])
                      ? selectedCategory.remove('??????')
                      : selectedCategory.add('??????');
                  debugPrint(selectedCategory.toString());
                  (pressAttention[1])
                      ? context.read<Category>().removeCategory(eu)
                      : context.read<Category>().addCategory(eu);
                  debugPrint(context.read<Category>().category.toString());
                },
                style: ElevatedButton.styleFrom(
                  primary: (pressAttention[1]) ? Colors.red : Colors.orange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                ),
                child: Text(' \u{1f35d} ?????? '),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    pressAttention[2] = !pressAttention[2];
                  });
                  debugPrint(pressAttention[2].toString());
                  (pressAttention[2])
                      ? selectedCategory.remove('??????')
                      : selectedCategory.add('??????');
                  debugPrint(selectedCategory.toString());
                  (pressAttention[2])
                      ? context.read<Category>().removeCategory(chn)
                      : context.read<Category>().addCategory(chn);
                  debugPrint(context.read<Category>().category.toString());
                },
                style: ElevatedButton.styleFrom(
                  primary: (pressAttention[2]) ? Colors.red : Colors.orange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                ),
                child: Text(' \u{1f376} ?????? '),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    pressAttention[3] = !pressAttention[3];
                  });
                  debugPrint(pressAttention[3].toString());
                  (pressAttention[3])
                      ? selectedCategory.remove('?????????')
                      : selectedCategory.add('?????????');
                  debugPrint(selectedCategory.toString());
                  (pressAttention[3])
                      ? context.read<Category>().removeCategory(asia)
                      : context.read<Category>().addCategory(asia);
                  debugPrint(context.read<Category>().category.toString());
                },
                style: ElevatedButton.styleFrom(
                  primary: (pressAttention[3]) ? Colors.red : Colors.orange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                ),
                child: Text(' \u{1f372} ????????? '),
              ),
              SizedBox(
                width: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    pressAttention[4] = !pressAttention[4];
                  });
                  debugPrint(pressAttention[4].toString());
                  (pressAttention[4])
                      ? selectedCategory.remove('??????')
                      : selectedCategory.add('??????');
                  debugPrint(selectedCategory.toString());
                  (pressAttention[4])
                      ? context.read<Category>().removeCategory(jpn)
                      : context.read<Category>().addCategory(jpn);
                  debugPrint(context.read<Category>().category.toString());
                },
                style: ElevatedButton.styleFrom(
                  primary: (pressAttention[4]) ? Colors.red : Colors.orange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                ),
                child: Text(' \u{1f363} ?????? '),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    pressAttention[6] = !pressAttention[6];
                  });
                  debugPrint(pressAttention[6].toString());
                  (pressAttention[6])
                      ? selectedCategory.remove('???')
                      : selectedCategory.add('???');
                  debugPrint(selectedCategory.toString());
                  (pressAttention[6])
                      ? context.read<Category>().removeCategory(noodle)
                      : context.read<Category>().addCategory(noodle);
                  debugPrint(context.read<Category>().category.toString());
                },
                style: ElevatedButton.styleFrom(
                  primary: (pressAttention[6]) ? Colors.red : Colors.orange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                ),
                child: Text(' \u{1f35c} ??? '),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    pressAttention[7] = !pressAttention[7];
                  });
                  debugPrint(pressAttention[7].toString());
                  (pressAttention[7])
                      ? selectedCategory.remove('??????')
                      : selectedCategory.add('??????');
                  debugPrint(selectedCategory.toString());
                  (pressAttention[7])
                      ? context.read<Category>().removeCategory(meat)
                      : context.read<Category>().addCategory(meat);
                  debugPrint(context.read<Category>().category.toString());
                },
                style: ElevatedButton.styleFrom(
                  primary: (pressAttention[7]) ? Colors.red : Colors.orange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                ),
                child: Text(' \u{1f356} ?????? '),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    pressAttention[8] = !pressAttention[8];
                  });
                  debugPrint(pressAttention[8].toString());
                  (pressAttention[8])
                      ? selectedCategory.remove('???')
                      : selectedCategory.add('???');
                  debugPrint(selectedCategory.toString());
                  (pressAttention[8])
                      ? context.read<Category>().removeCategory(rice)
                      : context.read<Category>().addCategory(rice);
                  debugPrint(context.read<Category>().category.toString());
                },
                style: ElevatedButton.styleFrom(
                  primary: (pressAttention[8]) ? Colors.red : Colors.orange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                ),
                child: Text(' \u{1f359} ??? '),
              ),
            ],
          ),
          SizedBox(height: 50),
          ElevatedButton(
            onPressed: () {
              context.read<Category>().checkDouble();
              if (selectedCategory.isNotEmpty && isLoaded) {
                interstitialAd!.show();
                List foodCategory = context.read<Category>().category;
                context.read<FoodResult>().selectFood(foodCategory);
                Get.to(() => ResultScreen());
                print(foodCategory.toString());
              } else {
                if (selectedCategory.isNotEmpty) {
                  List foodCategory = context.read<Category>().category;
                  context.read<FoodResult>().selectFood(foodCategory);
                  Get.to(() => ResultScreen());
                }
              }
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)),
            ),
            child: Text('\u{2705} ?????? ??????'),
          ),
          SizedBox(height: 10),
          Text(
            ((selectedCategory.isEmpty) ? '?????? ????????? ????????? ???????????????' : ''),
            style: TextStyle(color: Colors.red),
          )
        ],
      ),
    );
  }
}
