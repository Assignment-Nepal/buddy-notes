import 'package:buddyapp/constant/app_colors.dart';
import 'package:buddyapp/home/tab/lecture_flow_tab/subject_details.dart';
import 'package:buddyapp/widget/widget.dart';
import 'package:flutter/material.dart';

class FacultyAndSemester extends  StatefulWidget {
  const FacultyAndSemester({Key? key}) : super(key: key);

  @override
  _FacultyAndSemesterState createState() => _FacultyAndSemesterState();
}

class _FacultyAndSemesterState extends State<FacultyAndSemester> {

  List<String> dropDownProfileMetric = ["CSE", "CIVIL", "MECHANICAL", "ECE"];
  late int selectedProfileMetricIndex;

  @override
  void initState() {
    super.initState();
    selectedProfileMetricIndex = 0;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackgroundColor,
      appBar:   PreferredSize(
        preferredSize: Size.fromHeight(54),
        child: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 10,
          title:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                const Text("Choose your faculty",
                  softWrap: true,
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                  style: TextStyle(color: AppColors.gray600,
                      fontSize: 18,
                      letterSpacing: .2,
                      fontWeight: FontWeight.bold
                  ),
                ),

                getInsightChartDropDown(
                    value: dropDownProfileMetric[selectedProfileMetricIndex],
                    dropDownInsightsRpr:dropDownProfileMetric,
                    onChanged: (_selectedMetric){
                      setState(() {
                        selectedProfileMetricIndex =
                            dropDownProfileMetric.indexOf(_selectedMetric);
                      });

                    }),

              ]),
          elevation: 0,
          backgroundColor: AppColors.backgroundColor,
        ),
      ),
      body:const Faculty(),
    );
  }
}


class Faculty extends StatefulWidget {
  const Faculty({Key? key}) : super(key: key);



  @override
  _FacultyState createState() => _FacultyState();
}

class _FacultyState extends State<Faculty> {
  final List<Semesters> data = <Semesters>[
    Semesters(
      '1st Semester',
      <Subjects>[
        Subjects(
            'DSA',
        ),
        Subjects(
            'DSA',
        ),
      ],
    ),
    Semesters(
      '2nd Semester',
      <Subjects>[
        Subjects(
            'DSA',
        ),

      ],
    ),
    Semesters(
      '3rd Semester',
      <Subjects>[
        Subjects(
            'DSA',
        ),
      ],
    ),
    Semesters(
      '4th Semester',
      <Subjects>[
        Subjects(
            'DSA',
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            MyExpandableWidget(data[index]),
        itemCount: data.length,
      ),
    );
  }
}

class MyExpandableWidget extends StatelessWidget {
  final Semesters sem;

  const MyExpandableWidget(this.sem);

  @override
  Widget build(BuildContext context) {
    if (sem.listofSubjects.isEmpty) {
      return ListTile(title: Text(sem.facultyName));
    }
    return ExpansionTile(
      key: PageStorageKey<Semesters>(sem),
      title: Text(sem.facultyName, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color:AppColors.gray600)),
      children: sem.listofSubjects
          .map<Widget>((club) => showSubject(club,context))
          .toList(),

    );
  }
}

showSubject(Subjects club,context) {
  return Padding(
    padding: const EdgeInsets.only(left: 8),
    child: InkWell(
      onTap: ()  {
        Navigator.push(context,MaterialPageRoute(builder: (context) => const SubjectDetails()));

      },
      child: ListTile(
        title:  Text(
          club.subjectName,
          style: new TextStyle(fontSize: 18,color: AppColors.gray600),
        ),
      ),
    ),
  );
}


class Semesters {
  String facultyName;
  List<Subjects> listofSubjects;
  Semesters(this.facultyName, this.listofSubjects);
}

class Subjects {
  String subjectName;
  Subjects(this.subjectName,);
}
