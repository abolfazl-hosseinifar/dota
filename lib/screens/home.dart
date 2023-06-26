import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as devtools;
//import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
//import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
//import 'package:transparent_image/transparent_image.dart';
import 'package:google_fonts/google_fonts.dart';

import '../classes/heros.dart';

final List<String> imgList = [
  'https://www.kjcesports.com/wp-content/uploads/2023/04/Dota2_DrowRanger.jpg',
  'https://dota2ok.ru/wp-content/uploads/2018/02/Lion.jpg',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  final List<Widget> imageSliders = imgList
      .map((item) => Container(
            margin: const EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item, fit: BoxFit.cover, width: 1000.0),
                  ],
                )),
          ))
      .toList();

  List<Heros> heros_list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF02282b),
      appBar: AppBar(
        // The title text which will be shown on the action bar
        title: Text(
          "DOTA 2",
          style: GoogleFonts.cabinSketch(
            textStyle: const TextStyle(
                color: Color(0XFFb0e8eb),
                fontSize: 22,
                fontWeight: FontWeight.w800,
                fontStyle: FontStyle.italic),
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF02282b),
        //backgroundColor: Colors.white,
        shadowColor: Colors.white,
      ),
      body: Column(
        children: [
          // slider code, if you want to have a slider just unccomment below code
          // and you will have your image slider on the top!

          // Container(
          //   height: 250,
          //   child: ImageSlideshow(
          //       width: double.infinity,
          //       height: 250,
          //       initialPage: 0,
          //       indicatorColor: Colors.yellowAccent,
          //       indicatorBackgroundColor: Colors.white,
          //       isLoop: true,
          //       autoPlayInterval: 4000,
          //       children: [
          //         ClipRRect(
          //           borderRadius: const BorderRadius.only(
          //               bottomLeft: Radius.circular(20),
          //               bottomRight: Radius.circular(20)),
          //           child: Image.network(
          //               'https://www.kjcesports.com/wp-content/uploads/2023/04/Dota2_DrowRanger.jpg',
          //               fit: BoxFit.cover, loadingBuilder: (BuildContext ctx,
          //                   Widget child, ImageChunkEvent? loadingProgress) {
          //             if (loadingProgress == null) {
          //               return child;
          //             } else {
          //               return Center(
          //                 child: CircularProgressIndicator(
          //                   value: loadingProgress.expectedTotalBytes != null
          //                       ? loadingProgress.cumulativeBytesLoaded /
          //                           loadingProgress.expectedTotalBytes!
          //                       : null,
          //                 ),
          //               );
          //             }
          //           }),
          //         ),
          //         ClipRRect(
          //           borderRadius: const BorderRadius.only(
          //               bottomLeft: Radius.circular(20),
          //               bottomRight: Radius.circular(20)),
          //           child: Image.network(
          //               'https://dota2ok.ru/wp-content/uploads/2018/02/Lion.jpg',
          //               fit: BoxFit.cover),
          //         ),
          //         ClipRRect(
          //           borderRadius: const BorderRadius.only(
          //               bottomLeft: Radius.circular(20),
          //               bottomRight: Radius.circular(20)),
          //           child: Image.network(
          //             'https://s8.uupload.ir/files/shaman_66ow.jpg',
          //             fit: BoxFit.cover,
          //           ),
          //         ),
          //         ClipRRect(
          //           borderRadius: BorderRadius.only(
          //               bottomLeft: Radius.circular(20),
          //               bottomRight: Radius.circular(20)),
          //           child: Image.network(
          //             'https://s8.uupload.ir/files/witchdoctor_rbdc.jpg',
          //             fit: BoxFit.cover,
          //           ),
          //         ),
          //       ]),
          // ),
          // SizedBox(
          //   height: 10,
          // ),
          FutureBuilder<List<Heros>>(
              future: fetchHeros(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<Heros>> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    List<Heros> list_heros = snapshot.data as List<Heros>;
                    return Padding(
                      padding: const EdgeInsets.only(left: 4, right: 4),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200,
                                childAspectRatio: 1.35,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 0),
                        itemCount: list_heros.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return get_item_grid(
                              list_heros[index].imgList.toString(),
                              list_heros[index].name.toString(),
                              context);
                        },
                        padding: const EdgeInsets.only(top: 5),
                        shrinkWrap: true,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    // handle error here
                  }
                }
                return const Center(
                  child: CircularProgressIndicator(color: Color(0xFF0e5e66)),
                );
              })
        ],
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

Future<List<Heros>> fetchHeros() async {
  var baseUrl = "https://iamdeveloper.ir/dota/getHerosList.php";
  final response = await http.get(Uri.parse(baseUrl));
  List<Heros> heros = [];
  if (response.statusCode == 200) {
    var jsonDataa = jsonDecode(response.body);
    var jsonData = jsonDataa["heros"];
    for (var i = 0; i < jsonData.length; i++) {
      Heros hero = Heros.fromJson(jsonData[i]);
      heros.add(hero);
    }
    return heros;
  }
  throw response;
}

Widget get_item_grid(String img_link, String hero_name, context) {
  return InkWell(
    onTap: () {
      devtools.log("bia paeen");
      Navigator.pushNamed(context, '/hero_detail_screen');
    },
    child: Container(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: const Offset(0, 4), // changes position of shadow
                ),
              ],
              // border: Border.all(color: Colors.white54),
              gradient: const LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Color(0xFF0e5e66), Colors.transparent],
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            height: 105,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 2.0, bottom: 4),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(15),
              ),
              height: 180,
              width: 140,
              child: Image.network(img_link, fit: BoxFit.contain,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return const Center(
                    child: CircularProgressIndicator(
                  color: Color(0xFF0e5e66),
                ));
                // the code below shows the status of the bytes downloaded
                // as the progress indicator , for excample if half of the
                // image has been downloaded , the indicator shows half of
                // its full shape, and doesn't rotate continuesly

                // CircularProgressIndicator(
                //   color: Color(0xFF0e5e66),
                //   value: loadingProgress.expectedTotalBytes != null
                //       ? loadingProgress.cumulativeBytesLoaded /
                //           loadingProgress.expectedTotalBytes!
                //       : null,
                // ),
              }),
            ),
          ),
          // ignore: prefer_const_constructors
          Padding(
            padding: const EdgeInsets.only(left: 6, bottom: 4),
            child: Row(
              children: [
                Text(
                  hero_name,
                  style: GoogleFonts.cabinSketch(
                    textStyle: const TextStyle(
                        color: Color(0XFFb0e8eb),
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.italic),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
