// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, sized_box_for_whitespace, unnecessary_import, implementation_imports, unused_import, prefer_const_literals_to_create_immutables, unused_local_variable, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubits.dart';
import 'package:travel_app/cubit/app_cubits_states.dart';
import 'package:travel_app/widgets/app_buttons.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/colors.dart';
import 'package:travel_app/widgets/responsive_button.dart';
// import 'package:url_launcher/url_launcher.dart';

import '../widgets/app_large_text.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenstars = 3;
  int selectedindex = -1;

  // launchURL(String url) async {
  //   if (await canLaunch(url)) {
  //     await launchURL(url);
  //   } else {
  //     throw 'could not launch';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, Cubicstates>(builder: (context, state) {
      DetailState detail = state as DetailState;
      return Scaffold(
          body: Container(
        child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                child: Container(
                  height: 400,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("img/display.jpeg"))),
                ),
              ),
              Positioned(
                left: 20,
                top: 70,
                child: Row(children: [
                  IconButton(
                    onPressed: () {
                      BlocProvider.of<AppCubits>(context).gohome();
                    },
                    icon: Icon(Icons.menu),
                    color: Colors.white,
                  )
                ]),
              ),
              Positioned(
                top: 325,
                child: Container(
                  padding: EdgeInsets.only(
                    top: 30,
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Container(
                    margin: EdgeInsets.only(
                      left: 25,
                      right: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            APPlargetext(
                              text: detail.places.name,
                              size: 30,
                            ),
                            APPtext(
                              text: "\$" + detail.places.price.toString(),
                              color: Colors.blue,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.blue[900],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            APPtext(
                              text: detail.places.location,
                              size: 20,
                              color: Colors.blue,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(5, (index) {
                                return Icon(
                                  Icons.star,
                                  color: index < detail.places.stars
                                      ? AppColors.starColor
                                      : AppColors.textColor1,
                                );
                              }),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            APPtext(
                              text: "(5.0)",
                              color: Colors.blue,
                              size: 20,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        APPlargetext(
                          text: "People",
                          size: 25,
                          color: Colors.black87,
                        ),
                        APPtext(
                          text: "Number of People in your group",
                          size: 17,
                          color: Colors.black.withOpacity(0.6),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Wrap(
                            // alignment: WrapAlignment.center,
                            // try to align the index at the center

                            children: List.generate(
                          5,
                          (index) {
                            return InkWell(
                                onTap: (() {
                                  setState(() {
                                    selectedindex = index;
                                  });
                                }),
                                child: AppButtons(
                                  size: 50,
                                  color: selectedindex == index
                                      ? Colors.white
                                      : Colors.black,
                                  backgroundcolor: selectedindex == index
                                      ? Colors.black
                                      : Color.fromARGB(255, 254, 242, 242),
                                  bordercolor: selectedindex == index
                                      ? Colors.black
                                      : Colors.grey,
                                  text: (index + 1).toString(),
                                ));
                          },
                        )),
                        SizedBox(
                          height: 20,
                        ),
                        APPlargetext(
                          text: "Discover",
                          size: 30,
                          color: Colors.black.withOpacity(0.7),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        APPtext(
                          text: detail.places.description,
                          size: 15,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                  bottom: 60,
                  left: 20,
                  right: 20,
                  child: Row(
                    children: [
                      AppButtons(
                        size: 60,
                        color: Colors.black,
                        backgroundcolor: Colors.white,
                        bordercolor: Colors.black,
                        isIcon: true,
                        icon: Icons.favorite_border,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      ResponsiveButton(
                        isResponsive: true,
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ));
    });
  }
}
