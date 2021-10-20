import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class ArVisor extends StatefulWidget {
  const ArVisor({Key? key}) : super(key: key);

  @override
  _ArVisorState createState() => _ArVisorState();
}

class _ArVisorState extends State<ArVisor> {
  late ArCoreController arCoreController;
  bool first =true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image object'),
      ),
      body: ArCoreView(
        onArCoreViewCreated: _onArCoreViewCreated,
        enableTapRecognizer: true,

      ),
    );
  }


  void _onArCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;
    arCoreController.onPlaneTap = _handleOnPlaneTap;
  }

  Future _addImage(ArCoreHitTestResult hit) async {
    final bytes =
    (await rootBundle.load('assets/icons/fb.png')).buffer.asUint8List();
    print("bytes :$bytes");
    final earth = ArCoreNode(
      image: ArCoreImage(bytes: bytes, width: 50, height: 50),
      position: hit.pose.translation + vector.Vector3(0.0, 0.0, 0.0),
      rotation: hit.pose.rotation + vector.Vector4(0.0, 0.0, 0.0, 0.0),
    );

    await arCoreController.addArCoreNodeWithAnchor(earth);

    print(earth.toMap());
    print("llega");
    first=false;
  }

  void _handleOnPlaneTap(List<ArCoreHitTestResult> hits) {
    final hit = hits.first;
    _addImage(hit);
  }
}
