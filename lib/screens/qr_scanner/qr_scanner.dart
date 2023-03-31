import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mathlab/screens/detail_screen/game_detail.dart';
import 'package:mathlab/utils/dimensions.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRScanner extends StatefulWidget {
  static String routeName = '/qr_scanner';

  const QRScanner({super.key});

  @override
  State<QRScanner> createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  bool isScanCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
                flex: 4,
                child: Stack(children: [
                  MobileScanner(
                    onDetect: (capture) {
                      if (!isScanCompleted) {
                        setState(() {
                          isScanCompleted = true;
                        });
                        final List<Barcode> barcodes = capture.barcodes;
                        for (final barcode in barcodes) {
                          if (barcode.rawValue != null) {
                            int code = int.parse(barcode.rawValue!);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GameDetail(gameId: code),
                                settings: RouteSettings(
                                    name: GameDetail.routeName.replaceFirst(
                                        ':gameId', barcode.rawValue!)),
                              ),
                            ).then((_) {
                              setState(() {
                                isScanCompleted = false;
                              });
                            });
                          }
                        }
                      }
                    },
                  ),
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: MediaQuery.of(context).size.width * 0.6,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.red,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(top: getProportionateScreenHeight(80)),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Place the QR code in the area',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: getProportionateScreenWidth(18),
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(10),
                        ),
                        Text(
                          'Scanning will be started automatically',
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(15),
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  )
                ]))
          ],
        ),
      ),
    );
  }
}
