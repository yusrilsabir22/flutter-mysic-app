import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mys/consts/colors.dart';
import 'package:mys/consts/text_style.dart';
import 'package:mys/controllers/player.controllers.dart';

import '../models/FetchSong.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(PlayerController());

    return Scaffold(
      backgroundColor: bgDarkColor,
      appBar: AppBar(
        backgroundColor: bgDarkColor,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search, color: whiteColor))
        ],
        leading: const Icon(Icons.sort_rounded, color: whiteColor),
        title: Text(
          "Beats",
          style: defaultTextStyle(family: bold, size: 18),
        ),
      ),
      body: FutureBuilder<FetchedSong>(
        future: controller.fetchHome(),
        builder: (BuildContext context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data == null) {
            return const Center(
              child: Text("No song available"),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: snapshot.data!.data[0].contents.length,
                itemBuilder: (BuildContext context1, int index) {
                  var data = snapshot.data!.data[0].contents[index];
                  return Container(
                    margin: EdgeInsets.only(bottom: 4),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      tileColor: bgColor,
                      title: Text(data.title,
                          style: defaultTextStyle(family: bold, size: 15)),
                      subtitle: Text(data.artist!,
                          style: defaultTextStyle(family: regular, size: 12)),
                      leading: Image(
                        image: NetworkImage(data.thumbnails[0].url),
                        width: data.thumbnails[0].width + 0.0,
                        height: data.thumbnails[0].height + 0.0,
                      ),
                      trailing: const Icon(
                        Icons.play_arrow,
                        color: whiteColor,
                        size: 26,
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
