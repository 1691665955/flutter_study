import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth/auth_strings.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  LocalAuthentication _localAuthentication = LocalAuthentication();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _localAuthentication.stopAuthentication();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "生物识别",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text("检查是否支持生物识别"),
              onPressed: () async {
                try {
                  bool canCheckBiometrics =
                      await _localAuthentication.canCheckBiometrics;
                  print(canCheckBiometrics);
                } catch (e) {
                  print(e);
                }
              },
            ),
            SizedBox(
              height: 30,
            ),
            RaisedButton(
              child: Text("获取生物识别技术列表"),
              onPressed: () async {
                try {
                  List<BiometricType> availableBiometrics =
                      await _localAuthentication.getAvailableBiometrics();
                  print(availableBiometrics);
                } catch (e) {
                  print(e);
                }
              },
            ),
            SizedBox(
              height: 30,
            ),
            RaisedButton(
              child: Text("生物识别"),
              onPressed: () async {
                const androidStrings = const AndroidAuthMessages(
                  cancelButton: '取消',
                  goToSettingsButton: '去设置',
                  fingerprintNotRecognized: '指纹识别失败',
                  goToSettingsDescription: '请设置指纹.',
                  fingerprintHint: '指纹',
                  fingerprintSuccess: '指纹识别成功',
                  signInTitle: '指纹验证',
                  fingerprintRequiredTitle: '请先录入指纹!',
                );
                const iOSStrings = const IOSAuthMessages(
                  cancelButton: "取消",
                  goToSettingsButton: "去设置",
                  goToSettingsDescription: "请设置你的Touch ID/Face ID",
                  lockOut: "请重新启用您的Touch ID/Face ID"
                );
                try {
                  bool didAuthenticate =
                      await _localAuthentication.authenticateWithBiometrics(
                          localizedReason:
                              '扫描指纹进行身份识别',
                          useErrorDialogs: false,
                        androidAuthStrings: androidStrings,
                        iOSAuthStrings: iOSStrings,
                        stickyAuth: true
                      );
                  print(didAuthenticate);
                } catch (e) {
                  print(e);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
