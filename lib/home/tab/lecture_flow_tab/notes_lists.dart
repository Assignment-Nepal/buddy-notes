//import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:buddyapp/constant/app_colors.dart';
import 'package:flutter/material.dart';

class NotesLists extends StatefulWidget {
  const NotesLists({Key? key}) : super(key: key);

  @override
  _NotesListsState createState() => _NotesListsState();
}

class _NotesListsState extends State<NotesLists> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(54),
        child: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 10,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.black.withOpacity(.5),
                        )),
                    const SizedBox(
                      width: 16,
                    ),
                    const Text(
                      "Notes",
                      softWrap: true,
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                          color: AppColors.gray600,
                          fontSize: 18,
                          letterSpacing: .2,
                          fontWeight: FontWeight.bold),
                    ),
                  ]),
              // Icon(Icons.,color: Colors.black.withOpacity(.5  ),),
            ],
          ),
          elevation: 0,
          backgroundColor: AppColors.backgroundColor,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          // Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) =>  const OpenPdf()));
                        },
                        child: notesItemBuilder());
                  }),
            )
          ],
        ),
      ),
    );
  }

  Widget notesItemBuilder() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              offset: const Offset(1, 1),
              blurRadius: 2,
              color: Colors.black.withOpacity(.25))
        ],
      ),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child:
                        //pdfLayout(),
                        SizedBox(
                      width: 40,
                      height: 40,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * .5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "DataStructure and Alogrothim",
                            softWrap: true,
                            maxLines: 2,
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                                color: AppColors.gray600,
                                fontSize: 14,
                                letterSpacing: .2,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "Dcrust university Haryana India",
                            maxLines: 2,
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                                color: AppColors.gray600,
                                fontSize: 12,
                                letterSpacing: .2),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          Positioned(
              bottom: 10,
              right: 16,
              child: Row(
                children: [
                  Icon(
                    Icons.remove_red_eye_sharp,
                    size: 20,
                    color: AppColors.gray600,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text("15"),
                  SizedBox(
                    width: 16,
                  ),
                  Icon(Icons.remove_red_eye_sharp,
                      size: 20, color: AppColors.gray600),
                  SizedBox(
                    width: 4,
                  ),
                  Text("15"),
                ],
              )),
        ],
      ),
    );
  }
}
//
// class OpenPdf extends StatefulWidget {
//   const OpenPdf({Key? key}) : super(key: key);
//
//   @override
//   _OpenPdfState createState() => _OpenPdfState();
// }
//
// class _OpenPdfState extends State<OpenPdf> {
//   bool _isLoading = true;
//   late PDFDocument document;
//
//   @override
//   void initState() {
//     super.initState();
//     loadDocument();
//   }
//
//   loadDocument() async {
//     try{
//       document = await PDFDocument.fromURL(
//         "https://unec.edu.az/application/uploads/2014/12/pdf-sample.pdf",
//         /* cacheManager: CacheManager(
//           Config(
//             "customCacheKey",
//             stalePeriod: const Duration(days: 2),
//             maxNrOfCacheObjects: 10,
//           ),
//         ), */
//       );
//       setState(() => _isLoading = false);
//
//     }catch(error){
//
//     }
//
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).primaryColor,
//         title: const Text('Notes'),
//       ),
//       body: Center(
//         child: _isLoading
//             ? Center(child: CircularProgressIndicator())
//             : PDFViewer(
//           document: document,
//           zoomSteps: 5,
//           //uncomment below line to preload all pages
//           // lazyLoad: false,
//           // uncomment below line to scroll vertically
//           // scrollDirection: Axis.vertical,
//
//           //uncomment below code to replace bottom navigation with your own
//           /* navigationBuilder:
//                           (context, page, totalPages, jumpToPage, animateToPage) {
//                         return ButtonBar(
//                           alignment: MainAxisAlignment.spaceEvenly,
//                           children: <Widget>[
//                             IconButton(
//                               icon: Icon(Icons.first_page),
//                               onPressed: () {
//                                 jumpToPage()(page: 0);
//                               },
//                             ),
//                             IconButton(
//                               icon: Icon(Icons.arrow_back),
//                               onPressed: () {
//                                 animateToPage(page: page - 2);
//                               },
//                             ),
//                             IconButton(
//                               icon: Icon(Icons.arrow_forward),
//                               onPressed: () {
//                                 animateToPage(page: page);
//                               },
//                             ),
//                             IconButton(
//                               icon: Icon(Icons.last_page),
//                               onPressed: () {
//                                 jumpToPage(page: totalPages - 1);
//                               },
//                             ),
//                           ],
//                         );
//                       }, */
//         ),
//       ),
//     );
//   }
// }
