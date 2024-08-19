import 'package:fancy_popups_new/fancy_popups_new.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fancy Popups New',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Fancy Popups New'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

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

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(onPressed: (){
              showDialog(
                  context: context,
                  builder: (context) {
                    return MyFancyPopup(heading: "Success!", body: "Uploading completed! Your file uploaded successfully.",
                        onClose:(){ Navigator.pop(context); },
                        type: Type.success,
                        buttonText: "Continue");
                  });
            }, child: const Text("Success Dialog")),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: (){
              showDialog(
                  context: context,
                  builder: (context) {
                    return MyFancyPopup(heading: "Error!", body: "Uploading failed! Your file uploaded failed.",
                        onClose:(){ Navigator.pop(context); },
                        type: Type.error,
                        buttonText: "Go Back");
                  });
            }, child: const Text("Error Dialog")),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: (){
              showDialog(
                  context: context,
                  builder: (context) {
                    return MyFancyPopup(heading: "No Internet!", body: "No Internet Access Found.",
                        onClose:(){ Navigator.pop(context); },
                        type: Type.noInternet,
                        buttonText: "Recheck");
                  });
            }, child: const Text("No Internet Dialog")),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: (){
              showDialog(
                  context: context,
                  builder: (context) {
                    return MyFancyPopup(heading: "Server Error!", body: "Server Got Error",
                        onClose:(){ Navigator.pop(context); },
                        type: Type.serverError,
                        buttonText: "Exit");
                  });
            }, child: const Text("Server Error Dialog")),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: (){
              showDialog(
                  context: context,
                  builder: (context) {
                    return MyFancyPopup(heading: "API Timeout!", body: "Your API Got Timeout",
                        onClose:(){ Navigator.pop(context); },
                        type: Type.timeout,
                        buttonText: "Continue");
                  });
            }, child: const Text("Timeout Dialog")),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: (){
              showDialog(
                  context: context,
                  builder: (context) {
                    return MyFancyPopup(heading: "No Search Results!", body: "No Search Results Found.",
                        onClose:(){ Navigator.pop(context); },
                        type: Type.search,
                        buttonText: "Continue");
                  });
            }, child: const Text("No Search Dialog")),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: (){
              showDialog(
                  context: context,
                  builder: (context) {
                    return MyFancyPopup(heading: "Warning!", body: "Something went wrong.",
                        onClose:(){ Navigator.pop(context); },
                        type: Type.warning,
                        buttonText: "Continue");
                  });
            }, child: const Text("Warning Dialog")),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: (){
              showDialog(
                  context: context,
                  builder: (context) {
                    return MyFancyPopup(heading: "Delete!", body: "Are you sure you want to delete.",
                        onClose:(){ Navigator.pop(context); },
                        type: Type.delete,
                        buttonText: "Yes");
                  });
            }, child: const Text("Delete Dialog")),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: (){
              showDialog(
                  context: context,
                  builder: (context) {
                    return MyFancyPopup(heading: "No Location Found!", body: "Location Access Not Detected.",
                        onClose:(){ Navigator.pop(context); },
                        type: Type.location,
                        buttonText: "Turn On");
                  });
            }, child: const Text("Location Dialog")),
            const SizedBox(height: 10),

          ],
        ),
      ),
    );
  }
}
