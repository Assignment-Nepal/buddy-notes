import 'package:buddyapp/constant/app_colors.dart';
import 'package:buddyapp/home/tab/lecture_flow_tab/faculty_and_sem_view.dart';
import 'package:buddyapp/home/tab/lecture_flow_tab/snapshot.dart';
import 'package:buddyapp/utils/utils.dart';
import 'package:flutter/material.dart';

import 'model/university_model.dart';

class StartLectureFlow extends StatefulWidget {
  const StartLectureFlow({Key? key}) : super(key: key);

  @override
  _StartLectureFlowState createState() => _StartLectureFlowState();
}

class _StartLectureFlowState extends State<StartLectureFlow> {
  TextEditingController textController = TextEditingController();
  late Future universityList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    universityList = getUniversity();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(54),
        child: AppBar(
          title: const Text("Search your University"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              child: universityFutureBuilder(),
            ),
          )
        ],
      ),
    );
  }

  Widget universityFutureBuilder() {
    return FutureBuilder(
      future: universityList,
      builder: (
        BuildContext context,
        AsyncSnapshot snapshot,
      ) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            logger.e(snapshot.error);
            return const Text('Error');
          } else if (snapshot.hasData) {
            List<UniversityModel> universities = snapshot.data;
            return ListView.builder(
                itemCount: universities.length,
                itemBuilder: (context, index) {
                  UniversityModel university = universities[index];

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FacultyAndSemester(
                                      university_id: university.id,
                                    )));
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                  offset: const Offset(1, 1),
                                  blurRadius: 2,
                                  color: Colors.black.withOpacity(.25))
                            ]),
                        child: ListTile(
                          leading: const Icon(Icons.book),
                          title: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                university.universityName,
                                softWrap: true,
                                maxLines: 2,
                                overflow: TextOverflow.fade,
                                style: const TextStyle(
                                    color: AppColors.gray600,
                                    fontSize: 18,
                                    letterSpacing: .2,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                university.location,
                                maxLines: 1,
                                overflow: TextOverflow.fade,
                                style: const TextStyle(
                                    color: AppColors.gray600,
                                    fontSize: 12,
                                    letterSpacing: .2),
                              )
                            ],
                          ),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  );
                });
          } else {
            return const Text('Empty data');
          }
        } else {
          return Text('State: ${snapshot.connectionState}');
        }
      },
    );
  }
}
//
// class CustomAppBar extends StatefulWidget {
//   const CustomAppBar({Key? key}) : super(key: key);
//
//   @override
//   _CustomAppBarState createState() => _CustomAppBarState();
// }
//
// class _CustomAppBarState extends State<CustomAppBar> {
//
//   TextEditingController textController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 4),
//       child:  SearchBarAnimation(
//         textEditingController: TextEditingController(),
//         isOriginalAnimation: true,
//         enableKeyboardFocus: true,
//       ),
//     );
//   }
// }
