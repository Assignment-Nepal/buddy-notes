
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:buddyapp/constant/app_colors.dart';
import 'package:flutter/material.dart';

class pdfLayout extends StatefulWidget {
  const pdfLayout({Key? key}) : super(key: key);

  @override
  _pdfLayoutState createState() => _pdfLayoutState();
}

class _pdfLayoutState extends State<pdfLayout> {
  bool _isLoading = true;
  late PDFDocument document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    try{
      document = await PDFDocument.fromURL(
        "https://unec.edu.az/application/uploads/2014/12/pdf-sample.pdf",
        /* cacheManager: CacheManager(
          Config(
            "customCacheKey",
            stalePeriod: const Duration(days: 2),
            maxNrOfCacheObjects: 10,
          ),
        ), */
      );
      setState(() => _isLoading = false);

    }catch(error){

    }


  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 100,
      color: AppColors.whiteBackgroundColor,
      margin: EdgeInsets.only(top: 10),
      alignment: Alignment.center,
      child: Center(
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : IgnorePointer(
          ignoring: true,
          child: PDFViewer(
            showIndicator: false,
            document: document,
            lazyLoad: true,
          ),
        ),
      ),
    );
  }
}
