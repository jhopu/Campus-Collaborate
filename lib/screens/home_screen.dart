import 'package:campus_collaborate/constants/themes.dart';
import 'package:campus_collaborate/models/user_info.dart';
import 'package:campus_collaborate/widgets/commonWidgets/common_text_field.dart';
import 'package:campus_collaborate/widgets/commonWidgets/project_container.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final UserInfo userInfo;
  const HomeScreen({super.key, required this.userInfo});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _searchTextController= TextEditingController();
    return SafeArea(child: Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          backgroundColor: Themes.getColors(ColorsValues.DARK_GREY_COLOR),
          title:  Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('Campus',style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),),
                Text('Collab',style: TextStyle(color: Themes.getColors(ColorsValues.ORANGE_COLOR), fontSize: 20, fontWeight: FontWeight.w700),),
              ],
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15, top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    child: Icon(Icons.supervised_user_circle, size: 55, color: Themes.getColors(ColorsValues.ORANGE_COLOR),),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10,),
            const Text('My Feed', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),),
            const SizedBox(height: 20,),
            CommonTextField(textEditingController: _searchTextController, hintText: "Search Project", suffix: Image.asset('assets/funnel.png'),),
            const SizedBox(height: 20,),
            userInfo.projects==null||userInfo.projects!.isEmpty?const Center(
              child: Text('No Projects to Show!'),
            ):Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: userInfo.projects!.length,
                  itemBuilder: (context, index)=>ProjectContainer(project: userInfo.projects![index])),
            )
          ],
        ),
      ),
    ));
  }
}
