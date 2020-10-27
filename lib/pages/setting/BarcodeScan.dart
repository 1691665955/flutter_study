import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class BarcodeScanPage extends StatefulWidget {
  @override
  _BarcodeScanPageState createState() => _BarcodeScanPageState();
}

const flashOn = 'FLASH ON';
const flashOff = 'FLASH OFF';
const frontCamera = 'FRONT CAMERA';
const backCamera = 'BACK CAMERA';

class _BarcodeScanPageState extends State<BarcodeScanPage> {
  var _qrText = "";
  var _flashState = flashOn;
  var _cameraState = frontCamera;
  var _qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController _qrViewController;

  void _onQRViewCreated(QRViewController controller) {
    this._qrViewController = controller;
    controller.scannedDataStream.listen((event) {
      setState(() {
        _qrText = event;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _qrViewController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "二维码扫描",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: QRView(
              key: _qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                  borderColor: Colors.red,
                  borderRadius: 10,
                  borderLength: 30,
                  borderWidth: 10,
                  cutOutSize: 300),
            ),
          ),
          Expanded(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('This is the result of scan: $_qrText'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.all(8),
                        child: RaisedButton(
                          child: Text(
                            _flashState,
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            if (_qrViewController != null) {
                              _qrViewController.toggleFlash();
                              setState(() {
                                _flashState =
                                    _flashState == flashOn ? flashOff : flashOn;
                              });
                            }
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(8),
                        child: RaisedButton(
                          child: Text(
                            _cameraState,
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            if (_qrViewController != null) {
                              _qrViewController.flipCamera();
                              setState(() {
                                _cameraState = _cameraState == frontCamera
                                    ? backCamera
                                    : frontCamera;
                              });
                            }
                          },
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.all(8),
                        child: RaisedButton(
                          child: Text("Pause", style: TextStyle(fontSize: 20),),
                          onPressed: () {
                            if (_qrViewController != null) {
                              _qrViewController.pauseCamera();
                            }
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(8),
                        child: RaisedButton(
                          child: Text("Resume", style: TextStyle(fontSize: 20),),
                          onPressed: () {
                            if (_qrViewController != null) {
                              _qrViewController.resumeCamera();
                            }
                          },
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
