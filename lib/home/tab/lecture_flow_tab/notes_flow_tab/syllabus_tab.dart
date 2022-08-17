import 'package:buddyapp/home/tab/lecture_flow_tab/model/sem_models.dart';
import 'package:flutter/material.dart';

import 'notes_tab.dart';

class SyllabusTab extends StatefulWidget {
  final  List<SemYearModel>? listOfSemYear;
  const SyllabusTab({Key? key,this.listOfSemYear}) : super(key: key);

  @override
  _SyllabusTabState createState() => _SyllabusTabState();
}

class _SyllabusTabState extends State<SyllabusTab>  {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      child: listViewBuilder(widget.listOfSemYear,"Syllabus"),
    );
  }
}
