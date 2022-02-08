import 'package:flutter/cupertino.dart';

import 'main.dart';

class MyText extends Container {
  MyText( MyHomePageState state, String text, {Key? key} ) : super(key: key,
      width: state.contentWidth,
      alignment: Alignment.topLeft,
      child: Text( text )
  );
}

Future<int> hoge() async {
  await Future.delayed( const Duration( seconds: 3 ), (){ return true; } );
  return 123;
}

Future<double> fuga() async {
  await Future.delayed( const Duration( seconds: 1 ), (){ return true; } );
  return 4.56;
}

Future<String> piyo() async {
  await Future.delayed( const Duration( seconds: 2 ), (){ return true; } );
  return 'abc';
}

void test1( MyHomePageState state ) async {
  int startTime = DateTime.now().millisecondsSinceEpoch;
  int time;

  int _hoge = await hoge();
  state.addConsole(MyText(state, '$_hoge'));
  time = DateTime.now().millisecondsSinceEpoch - startTime;
  state.addConsole(MyText(state, '$time ms'));

  double _fuga = await fuga();
  state.addConsole(MyText(state, '$_fuga'));
  time = DateTime.now().millisecondsSinceEpoch - startTime;
  state.addConsole(MyText(state, '$time ms'));

  String _piyo = await piyo();
  state.addConsole(MyText(state, _piyo));
  time = DateTime.now().millisecondsSinceEpoch - startTime;
  state.addConsole(MyText(state, '$time ms'));
}

void test2( MyHomePageState state ) async {
  int startTime = DateTime.now().millisecondsSinceEpoch;

  List<dynamic> results = await Future.wait([ hoge(), fuga(), piyo() ]);
  int _hoge    = results[0];
  double _fuga = results[1];
  String _piyo = results[2];
  state.addConsole(MyText(state, '$_hoge'));
  state.addConsole(MyText(state, '$_fuga'));
  state.addConsole(MyText(state, _piyo));

  int time = DateTime.now().millisecondsSinceEpoch - startTime;
  state.addConsole(MyText(state, '$time ms'));
}

void test3( MyHomePageState state ) async {
  int startTime = DateTime.now().millisecondsSinceEpoch;

  List<Future<dynamic>> futures = <Future<dynamic>>[];
  futures.add(hoge());
  futures.add(fuga());
  futures.add(piyo());

  List<dynamic> results = await Future.wait(futures);
  int _hoge    = results[0];
  double _fuga = results[1];
  String _piyo = results[2];
  state.addConsole(MyText(state, '$_hoge'));
  state.addConsole(MyText(state, '$_fuga'));
  state.addConsole(MyText(state, _piyo));

  int time = DateTime.now().millisecondsSinceEpoch - startTime;
  state.addConsole(MyText(state, '$time ms'));
}

void test4( MyHomePageState state ) async {
  int startTime = DateTime.now().millisecondsSinceEpoch;
  int time;

  int? _hoge;
  double? _fuga;
  String? _piyo;

  await Future.wait([
    hoge().then((result){
      _hoge = result;
      state.addConsole(MyText(state, '$_hoge'));
      time = DateTime.now().millisecondsSinceEpoch - startTime;
      state.addConsole(MyText(state, '$time ms'));
    }),
    fuga().then((result){
      _fuga = result;
      state.addConsole(MyText(state, '$_fuga'));
      time = DateTime.now().millisecondsSinceEpoch - startTime;
      state.addConsole(MyText(state, '$time ms'));
    }),
    piyo().then((result){
      _piyo = result;
      state.addConsole(MyText(state, _piyo!));
      time = DateTime.now().millisecondsSinceEpoch - startTime;
      state.addConsole(MyText(state, '$time ms'));
    })
  ]);

  time = DateTime.now().millisecondsSinceEpoch - startTime;
  state.addConsole(MyText(state, '$time ms'));
}

void test5( MyHomePageState state ) async {
  int startTime = DateTime.now().millisecondsSinceEpoch;
  int time;

  int? _hoge;
  double? _fuga;
  String? _piyo;

  List<Future<dynamic>> futures = <Future<dynamic>>[];
  futures.add(hoge().then((result){
    _hoge = result;
    state.addConsole(MyText(state, '$_hoge'));
    time = DateTime.now().millisecondsSinceEpoch - startTime;
    state.addConsole(MyText(state, '$time ms'));
  }));
  futures.add(fuga().then((result){
    _fuga = result;
    state.addConsole(MyText(state, '$_fuga'));
    time = DateTime.now().millisecondsSinceEpoch - startTime;
    state.addConsole(MyText(state, '$time ms'));
  }));
  futures.add(piyo().then((result){
    _piyo = result;
    state.addConsole(MyText(state, _piyo!));
    time = DateTime.now().millisecondsSinceEpoch - startTime;
    state.addConsole(MyText(state, '$time ms'));
  }));

  await Future.wait(futures);

  time = DateTime.now().millisecondsSinceEpoch - startTime;
  state.addConsole(MyText(state, '$time ms'));
}
