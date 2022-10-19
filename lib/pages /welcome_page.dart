// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers, duplicate_ignore, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubits.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/responsive_button.dart';

// ignore: use_key_in_widget_constructors
class Welcomepage extends StatefulWidget {
  @override
  State<Welcomepage> createState() => _WelcomepageState();
}

class _WelcomepageState extends State<Welcomepage> {
  List images = [
    "welcome-one.png",
    "welcome-two.png",
    "welcome-three.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Center(child: Text('hi i a, tushar')),

      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(
                    // ignore: prefer_interpolation_to_compose_strings
                    "img/" + images[index],
                    // displays images according to the index
                  ),
                  fit: BoxFit.cover,
                )),
                child: Container(
                  margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          APPlargetext(text: "Trips"),
                          // importing a custom widget which ha properties for color,size,text and has default parametric values assigned to it
                          APPtext(
                            text: "Mounatin",
                            size: 30,
                          ),
                          // ignore: prefer_const_constructors
                          SizedBox(
                            height: 20,
                          ),
// empty box:puts distance between the containers

                          // ignore: sized_box_for_whitespace
                          Container(
                            width: 300,
                            child: APPtext(
                              text:
                                  "Mounatins give you an incredible sense of freedom along with endurance tests",
                              size: 18,
                              // ignore: prefer_const_constructors
                              color: Color.fromARGB(70, 0, 0, 0),
                            ),
                          ),
                          // ignore: prefer_const_constructors
                          SizedBox(
                            height: 40,
                          ),
                          GestureDetector(
                              onTap: (() {
                                BlocProvider.of<AppCubits>(context).getData();
                              }),
                              child: Container(
                                  width: 200,
                                  child: Row(
                                    children: [
                                      ResponsiveButton(
                                        width: 120,
                                      )
                                    ],
                                  )))
                        ],
                      ),
                      Column(
                        children: List.generate(3, (indexdots) {
                          return Container(
                              height: index == indexdots ? 25 : 8,
                              margin: const EdgeInsets.only(bottom: 2),
                              // if index =indexdots then the respective no of slider will change height
                              width: 8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: index == indexdots
                                    ? Color.fromARGB(162, 13, 24, 152)
                                    : Color.fromARGB(162, 13, 24, 152)
                                        .withOpacity(0.3),
                              ));
                        }),
                      )
                    ],
                  ),
                ));
          }),
    );
  }
}
