// @dart=2.9
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key,  this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  void initState() {
    getBankList();
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("something weird happened",
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                maxLines: 1,
               ),

            const SizedBox(
              height: 12,
            ),


            const Text("we overslept today. reload to continued",
              overflow: TextOverflow.ellipsis,
              softWrap: false,
              maxLines: 1,
              ),





            InkWell(
              onTap: (){

              },
              child: Container(
                height: 38,
                width: 100,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color:Colors.deepPurpleAccent,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(100)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 15,
                      width: 16,
                      child: SvgPicture.string(
                      '''<svg width="16" height="17" viewBox="0 0 16 17" fill="none" xmlns="http://www.w3.org/2000/svg">
                      <path d="M13.6503 3.35001C12.8121 2.50428 11.7946 1.85762 10.6731 1.4578C9.55149 1.05798 8.35442 0.915201 7.17027 1.04001C3.50027 1.41001 0.480265 4.39001 0.0702655 8.06001C-0.479735 12.91 3.27027 17 8.00027 17C9.51037 17 10.9895 16.5715 12.2658 15.7643C13.542 14.9572 14.5631 13.8044 15.2103 12.44C15.5303 11.77 15.0503 11 14.3103 11C13.9403 11 13.5903 11.2 13.4303 11.53C12.8497 12.779 11.8566 13.79 10.6182 14.3928C9.37974 14.9957 7.97147 15.1536 6.63027 14.84C4.41027 14.35 2.62027 12.54 2.15027 10.32C1.9527 9.44227 1.95498 8.53135 2.15696 7.65461C2.35893 6.77787 2.75543 5.95776 3.31712 5.25493C3.8788 4.55211 4.59131 3.98454 5.40194 3.59423C6.21256 3.20392 7.10057 3.00084 8.00027 3.00001C9.66027 3.00001 11.1403 3.69001 12.2203 4.78001L10.7103 6.29001C10.0803 6.92001 10.5203 8.00001 11.4103 8.00001H15.0003C15.5503 8.00001 16.0003 7.55001 16.0003 7.00001V3.41001C16.0003 2.52001 14.9203 2.07001 14.2903 2.70001L13.6503 3.35001V3.35001Z" fill="white"/>
                      </svg>''',
                        fit: BoxFit.contain,
                        height: 250,
                      ),
                    ),

                    SizedBox(width: 10,),
                    const Text("retry",
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.6
                        )),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


Future<ApiResponse<dynamic>> getRequest({
  String endPoint,
  Map<String, String> headers,
  bool withBaseUrl = true,
}) async {

  ApiResponse _apiResponse;
  try {
     http.Response response = await http.get(
      Uri.parse("https://abcadfadfklasdjf.free.beeceptor.com/my"),
    );
    try {
      final verifiedResponse = await _verifyResponse(response);
      _apiResponse = ApiResponse.success(verifiedResponse);
    }catch (e) {
      print(e.message);
      _apiResponse = ApiResponse.error(e);
    }
  } on SocketException {
    _apiResponse = ApiResponse.error(AppException("No internet connection"));
  }
  return _apiResponse;
}

Future<ApiResponse> getBankList() async {
  String url = "https://abcadfadfklasdjf.free.beeceptor.com/my";
  var d =  await getRequest(
    endPoint: url,
  );
  return d;
}


Future<dynamic> _verifyResponse(http.Response response) async {
  switch (response.statusCode) {
    case 200:
      return response;
    case 400:
      throw ApiResponse.error(AppException("400"));
    default :
      throw ApiResponse.error(AppException("error"));
  }
}




/// * Created by shubhampatel on 05 Jun, 2020.

class ApiResponse<T> {
  bool _isApiCallSuccessful;
  int _statusCode;
  String _body;
  String _errorMessage;
  String _displayErrorMessage;

  bool get isApiCallSuccessful => _isApiCallSuccessful;
//  set isApiCallSuccessful(bool isApiCallSuccessful) =>
//      _isApiCallSuccessful = isApiCallSuccessful;
  int get statusCode => _statusCode;
//  set statusCode(int statusCode) => _statusCode = statusCode;
  String get body => _body;
//  set body(String body) => _body = body;
  String get errorMessage => _errorMessage;
//  set errorMessage(String errorMessage) => _errorMessage = errorMessage;
  String get displayErrorMessage => _displayErrorMessage;
//  set displayErrorMessage(String displayErrorMessage) =>
//      _displayErrorMessage = displayErrorMessage;

  ApiResponse._();

  ApiResponse.success(http.Response response) {
    _isApiCallSuccessful = (response.statusCode == 200);
    _statusCode = response.statusCode;
    _body = response.body;
    _errorMessage = null;
    _displayErrorMessage = null;
  }

  ApiResponse.error(AppException exception) {
    _isApiCallSuccessful = false;
    _statusCode = 0;
    _body = null;
    _errorMessage = exception.message;
    _displayErrorMessage = 'Encountered technical issue. Please try again.';
  }
}

class AppException implements Exception {
  final String prefix;
  final String cause;

  AppException([this.prefix, this.cause]);

  String get message => '$prefix: ${cause ?? '* no message *'}';
}
