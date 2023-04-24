import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Quill',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyTextEditorPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyTextEditorPage extends StatefulWidget {
  const MyTextEditorPage({super.key});

  @override
  State<MyTextEditorPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyTextEditorPage> {
  final QuillController _controller = QuillController.basic();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Text Editor"),
      ),
      drawer: const Drawer(),
      body: Column(
        children: [
          QuillToolbar.basic(
            controller: _controller,
            showDividers: false,
          ),
          Expanded(
            child: QuillEditor(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              controller: _controller,
              focusNode: FocusNode(),
              readOnly: false,
              autoFocus: false,
              scrollController: ScrollController(),
              scrollable: true,
              expands: false,
            ),
          ),
        ],
      ),
    );
  }
}
