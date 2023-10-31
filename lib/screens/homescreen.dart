import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:image_generator_app/api/rest.dart';
import 'package:image_generator_app/consts/colors.dart';
import 'package:image_generator_app/consts/strings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final textController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(3, -0.3),
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: secondryBg,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-3, -0.3),
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: secondryBg,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, -1.2),
                  child: Container(
                    height: 300,
                    width: 600,
                    decoration: BoxDecoration(
                      color: primaryBg,
                    ),
                  ),
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.transparent),
                  ),
                ),

                Center(
                  child: Container(
                    padding:EdgeInsets.all(15.0),
                    color: Colors.black38,
                    height: MediaQuery.sizeOf(context).height/2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text("$title",style: TextStyle(color: Colors.cyanAccent,fontWeight: FontWeight.bold,fontSize:32),),
                            Text("$subtitle",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:27),),
                            SizedBox(height: 15,),
                            Text("$desc",style: TextStyle(color: greyColor,fontWeight: FontWeight.w400,fontSize:16),),

                            SizedBox(height: 15,),
                          ],
                        ),
                        TextField(
                          controller: textController,
                          decoration: InputDecoration(
                            hintText: 'Enter your prompt',
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: const EdgeInsets.all(16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            labelStyle: const TextStyle(color: Colors.red),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          width: 200,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:Colors.cyanAccent,
                            ),
                            onPressed: () {
                              convertTextToImage(textController.text, context);
                              isLoading = true;
                              setState(() {});
                            },
                            child: isLoading
                                ? const SizedBox(
                                height: 15,
                                width: 15,
                                child:
                                CircularProgressIndicator(color: Colors.black))
                                : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.download,color: Colors.black,),
                                    SizedBox(width: 10,),
                                    Text('Generate Image',
                                    style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold)),
                                  ],
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

      ),
    );
  }
}


