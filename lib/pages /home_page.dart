// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, unnecessary_import, implementation_imports, no_leading_underscores_for_local_identifiers, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubits.dart';
import 'package:travel_app/cubit/app_cubits_states.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';

//

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  // TickerProviderStateMixin-special state of tabbars
  var images = {
    "balloning.png": "Balloning",
    "hiking.png": "Hiking",
    "kayaking.png": "Kayaking",
    "snorkling.png": "Snorling",
  };
// map for images

  List image = [
    "mountain_3.jpeg",
    "mountain_2.jpeg",
    "mountain_1.jpeg",
    "mountain_4.jpeg",
    "mountain_5.jpeg",
    "mountain_6.jpeg",
  ];

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);

    return Scaffold(body: BlocBuilder<AppCubits, Cubicstates>(
      builder: (context, state) {
        if (state is LoadedState) {
          var info = state.places;
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: 70,
                    left: 20,
                  ),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            BlocProvider.of<AppCubits>(context).gotohome();
                          },
                          icon: Icon(Icons.menu)),

                      // Icon(

                      //   Icons.menu,
                      //   size: 30,
                      //   color: Colors.black54,
                      // ),
                      Expanded(child: Container()),
                      Container(
                          margin: EdgeInsets.only(right: 20),
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.withOpacity(0.5),
                          ))
                    ],
                  ),
                ),
                SizedBox(height: 40),

                // discover container
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: APPlargetext(
                    text: "Discover",
                  ),
                ),
                SizedBox(height: 40),
                //  gap

                //  tabbar
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                      labelPadding: EdgeInsets.only(left: 30, right: 30),
                      labelColor: Colors.black87,

                      unselectedLabelColor: Colors.grey,
                      // changes the property of selected label
                      controller: _tabController,
                      isScrollable: true,
                      indicatorSize: TabBarIndicatorSize.label,
                      tabs: [
                        Tab(
                          text: "Places",
                        ),
                        Tab(
                          text: "Inspiration",
                        ),
                        Tab(
                          text: "Emotions",
                        ),
                      ],
                    ),
                  ),
                ),

                Container(
                  height: 300,
                  width: double.maxFinite,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      ListView.builder(
                        padding: EdgeInsets.only(
                          top: 30,
                          left: 17,
                        ),
                        itemCount: info.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                              onTap: (() {
                                BlocProvider.of<AppCubits>(context)
                                    .detailpage(info[index]);
                              }),
                              child: Container(
                                margin: EdgeInsets.only(right: 15),
                                width: 200,
                                height: 300,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    image: DecorationImage(
                                        image:
                                            AssetImage("img/" + image[index]),
                                        fit: BoxFit.cover)),
                              ));
                        },
                      ),
                      Text("bye"),
                      Text("hello"),
                    ],
                  ),
                ),

                SizedBox(
                  height: 30,
                ),

                Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        APPlargetext(
                          text: "Explore more",
                          size: 22,
                        ),
                        APPtext(
                          text: ' See all',
                          color: Colors.grey,
                          size: 20,
                        ),
                      ],
                    )),

                SizedBox(
                  height: 30,
                ),

                Container(
                  height: 100,
                  margin: EdgeInsets.only(left: 25),
                  width: double.maxFinite,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (_, index) {
                      return Container(
                          child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 40),
                            width: 80,
                            height: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black,
                                image: DecorationImage(
                                    image: AssetImage(
                                        "img/" + images.keys.elementAt(index)),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 35),
                            child: APPtext(
                              text: images.values.elementAt(index),
                              size: 20,
                            ),
                          )
                        ],
                      ));
                    },
                  ),
                )
              ]);
        } else {
          return Container();
        }
      },
    ));
  }
}
