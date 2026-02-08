import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

// ignore: depend_on_referenced_packages
import 'package:mobile_scanner/mobile_scanner.dart';

import 'package:kitchen_sync/ui/core/themes/colors.dart';
import 'package:solar_icon_pack/solar_bold_icons.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  final MobileScannerController controller = MobileScannerController(
    detectionSpeed: DetectionSpeed.noDuplicates,
    formats: [BarcodeFormat.ean13, BarcodeFormat.ean8, BarcodeFormat.qrCode],
  );

  bool isFlashOn = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _onDetect(BarcodeCapture capture) {
    final List<Barcode> barcodes = capture.barcodes;
    for (final barcode in barcodes) {
      if (barcode.rawValue != null) {
        debugPrint('Barcode found! ${barcode.rawValue}');

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Produit scanné : ${barcode.rawValue}"),
            duration: const Duration(seconds: 1),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          MobileScanner(
            controller: controller,
            onDetect: _onDetect,
            overlayBuilder: (context, constraints) {
              return Container(
                decoration: ShapeDecoration(
                  shape: QrScannerOverlayShape(
                    borderColor: AppColors.primary,
                    borderRadius: 12,
                    borderLength: 30,
                    borderWidth: 5,
                    cutOutSize: 300,
                  ),
                ),
              );
            },
          ),
          Positioned(
            top: SafeArea(child: Container()).minimum.vertical + 16,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black54,
                  radius: 24,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => context.pop(),
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.black54,
                  radius: 24,
                  child: IconButton(
                    icon: Icon(
                      isFlashOn
                          ? SolarBoldIcons.flashlight
                          : SolarBoldIcons.flashlightOn,
                      color: isFlashOn ? Colors.yellow : Colors.white,
                    ),
                    onPressed: () {
                      controller.toggleTorch();
                      setState(() {
                        isFlashOn = !isFlashOn;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.20,
            minChildSize: 0.20,
            maxChildSize: 0.9,
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: AppColors.catskillWhiteTwo,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 40,
                          height: 4,
                          margin: const EdgeInsets.only(bottom: 24),
                          decoration: BoxDecoration(
                            color: AppColors.slateGray.withValues(alpha: 0.3),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),
                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class QrScannerOverlayShape extends ShapeBorder {
  final Color borderColor;
  final double borderWidth;
  final Color overlayColor;
  final double borderRadius;
  final double borderLength;
  final double cutOutSize;

  const QrScannerOverlayShape({
    this.borderColor = Colors.green,
    this.borderWidth = 10.0,
    this.overlayColor = const Color.fromRGBO(0, 0, 0, 80),
    this.borderRadius = 0,
    this.borderLength = 40,
    this.cutOutSize = 250,
  });

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return Path()..addRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: rect.center,
          width: cutOutSize,
          height: cutOutSize,
        ),
        Radius.circular(borderRadius),
      ),
    );
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    Path path = Path()..addRect(rect);
    Path cutOutPath = getInnerPath(rect, textDirection: textDirection);
    return Path.combine(PathOperation.difference, path, cutOutPath);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    final double cutOutWidth = cutOutSize;
    final double cutOutHeight = cutOutSize;

    final backgroundPaint = Paint()..color = overlayColor;

    final cutOutRect = Rect.fromCenter(
      center: rect.center,
      width: cutOutWidth,
      height: cutOutHeight,
    );

    final backgroundPath = Path.combine(
      PathOperation.difference,
      Path()..addRect(rect),
      Path()..addRRect(
        RRect.fromRectAndRadius(cutOutRect, Radius.circular(borderRadius)),
      ),
    );
    canvas.drawPath(backgroundPath, backgroundPaint);

    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth
      ..strokeCap = StrokeCap.round;

    final boxRect = RRect.fromRectAndRadius(
      cutOutRect,
      Radius.circular(borderRadius),
    );

    canvas.drawPath(
      Path()
        ..moveTo(boxRect.left, boxRect.top + borderLength)
        ..lineTo(boxRect.left, boxRect.top + borderRadius)
        ..arcToPoint(
          Offset(boxRect.left + borderRadius, boxRect.top),
          radius: Radius.circular(borderRadius),
        )
        ..lineTo(boxRect.left + borderLength, boxRect.top),
      borderPaint,
    );

    canvas.drawPath(
      Path()
        ..moveTo(boxRect.right - borderLength, boxRect.top)
        ..lineTo(boxRect.right - borderRadius, boxRect.top)
        ..arcToPoint(
          Offset(boxRect.right, boxRect.top + borderRadius),
          radius: Radius.circular(borderRadius),
        )
        ..lineTo(boxRect.right, boxRect.top + borderLength),
      borderPaint,
    );

    canvas.drawPath(
      Path()
        ..moveTo(boxRect.right, boxRect.bottom - borderLength)
        ..lineTo(boxRect.right, boxRect.bottom - borderRadius)
        ..arcToPoint(
          Offset(boxRect.right - borderRadius, boxRect.bottom),
          radius: Radius.circular(borderRadius),
        )
        ..lineTo(boxRect.right - borderLength, boxRect.bottom),
      borderPaint,
    );

    canvas.drawPath(
      Path()
        ..moveTo(boxRect.left + borderLength, boxRect.bottom)
        ..lineTo(boxRect.left + borderRadius, boxRect.bottom)
        ..arcToPoint(
          Offset(boxRect.left, boxRect.bottom - borderRadius),
          radius: Radius.circular(borderRadius),
        )
        ..lineTo(boxRect.left, boxRect.bottom - borderLength),
      borderPaint,
    );
  }

  @override
  ShapeBorder scale(double t) => this;
}
