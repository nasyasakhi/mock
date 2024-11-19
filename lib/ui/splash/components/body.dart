import 'package:flutter/material.dart';
import 'package:mock_apps/const.dart';
import 'package:mock_apps/ui/splash/components/splash_content.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState(); // createstate untuk menyimpan semua perubahan
}

class _BodyState extends State<Body> {

  int currentPage = 0;
  final PageController _pageController = PageController();

// kita mau generate our product
  // List<String> product = List.generate(
 //  10, (index) => "Product ${index + 1}"
//   );

  // DASAR PENGAMBILAN API
  List<Map<String, String>> splashData = [
    {
      "text"  : "Welcome to Mock, \n Find Your Perfect Eyewear Style!",
      "image" : "assets/images/splash/mock_1.png"
    },
    {
      "text"  : "See the world more \n clearly with us!",
      "image" : "assets/images/splash/mock_2.png"
    },
    {
      "text"  : "Trendy Glasses for \n Every Moment!",
      "image" : "assets/images/splash/mock_3.png"
    }
  ];

//------------------------------- KANVAS

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: SizedBox(
                width: double.infinity,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: splashData.length,
                  itemBuilder: (context, index) => SplashContent(
                    text  : splashData[index]["text"]!,
                    image : splashData[index]["image"]!
                )
              ),
            )
          ),

          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate( 
                  splashData.length,
                  (index) => _dotsIndicator(index: index)
                ) 
              )
            ),

            Padding(
              padding: const EdgeInsets.only(
                left: 15, 
                right: 15,
                bottom: 30 
              ),

              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                  ),
                  onPressed: () {
                    if (currentPage == splashData.length - 1) {
                      Navigator.pushNamed(context, '/login');
                    } else {
                      _pageController.animateToPage(
                        currentPage + 1, 
                        duration: animationDuration, 
                        curve: Curves.ease);
                    }
                  }, 
                  child: Text(
                    currentPage == splashData.length -1 ? "Get Started" : "Next",
                    style: const TextStyle(
                      color: primaryLightColor
                    ),
                  )
                ),
              ),
            )
          ],
        )
      ),
    );
  }
  
 


//----------- METHOD EXTRACTION (Reusable)
 AnimatedContainer _dotsIndicator({required int index}) {
  return AnimatedContainer(
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: currentPage == index ? primaryColor : secondaryColor, 
      ),
      width: currentPage == index ? 20 : 7, 
      height: 5, 
      duration: animationDuration
    );
 }
}

//----------- NOTES 
// _methodName  = Method extract
// MethodName   = Widget extract
// _BodyState   = Class extract

// Widget Extract =  Memisahkan antara Logic dan Widget
// Method extract =  Reusable