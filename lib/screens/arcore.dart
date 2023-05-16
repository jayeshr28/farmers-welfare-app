// import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
// import 'package:flutter/material.dart';
// import 'package:vector_math/vector_math_64.dart' as vector;
//
// class ArView extends StatefulWidget {
//   @override
//   _ArViewState createState() => _ArViewState();
// }
//
// class _ArViewState extends State<ArView> {
//   late ArCoreController arCoreController;
//
//   @override
//   void dispose() {
//     arCoreController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ArCoreView(
//         onArCoreViewCreated: _onArCoreViewCreated,
//         enableTapRecognizer: true,
//       ),
//     );
//   }
//
//   void _onArCoreViewCreated(ArCoreController controller) {
//     arCoreController = controller;
//
//     // Load the 3D model of your custom object
//     final node = ArCoreReferenceNode(
//       name: "CustomObject",
//       objectUrl:
//           "https://github.com/KhronosGroup/glTF-Sample-Models/raw/master/2.0/Duck/glTF/Duck.gltf",
//       position: vector.Vector3(0, 0, -1),
//       rotation: vector.Vector4(0, 0, 0, 0),
//       scale: vector.Vector3(1, 1, 1),
//     );
//
//     // Add the 3D model to the AR world
//     arCoreController.addArCoreNode(node);
//   }
// }
