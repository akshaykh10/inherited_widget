import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class FrogColor extends InheritedWidget {
  const FrogColor({Key? key, required this.color, required Widget child})
      : super(child: child); //child:Widget below the this widget

  final Color color; //The object that the Inherited widget is holding

  //To obtain the NEAREST INSTANCE of a particular type of inherited widget
  // from a build context, use BuildContext.dependOnInheritedWidgetOfExactType.
  static FrogColor of(BuildContext context) {
    final FrogColor? result =
        context.dependOnInheritedWidgetOfExactType<FrogColor>();
    assert(result != null, 'No FrogColor found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant FrogColor oldWidget) {
    //Condition to check if the element that the stateless inherited widget holds
    //has changed in the element tree or not
    //if true the whole inherited widget is replaced with the new color object
    return color != oldWidget.color;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const FrogColor(color: Colors.green, child: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: Scaffold(
      body: Center(child: NewWidget()),
    ));
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50.0, width: 50.0, color: FrogColor.of(context).color);
  }
}
