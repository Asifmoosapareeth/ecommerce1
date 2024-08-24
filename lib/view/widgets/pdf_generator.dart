import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import '../../model/product_model.dart';

class PdfGenerator {
  static Future<void> generateReceipt(
      List<Product> items,
      Map<int, int> quantities,
      double totalPrice,
      String transactionId,
      DateTime purchaseDate) async {
    final pdf = pw.Document();
    final formatter = DateFormat('yyyy-MM-dd HH:mm');

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text('Receipt', style: pw.TextStyle(
                  fontSize: 24, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 20),
              pw.Text('Transaction ID: $transactionId'),
              pw.Text('Date: ${formatter.format(purchaseDate)}'),
              pw.SizedBox(height: 20),
              pw.Text('Items:', style: pw.TextStyle(
                  fontSize: 18, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 10),
              pw.Table(
                border: pw.TableBorder(
                  horizontalInside: pw.BorderSide(
                    color: PdfColors.grey300,
                    width: 0.5,
                  ),
                ),
                children: [
                  pw.TableRow(
                    children: [
                      pw.Text('Product Name', style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
                      pw.Text('Quantity', style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
                      pw.Text('Price', style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
                    ],
                  ),

                  ...items.map((product) {
                    final quantity = quantities[product.id] ?? 0;
                    final price = product.price ;
                    return pw.TableRow(
                      children: [
                        pw.Text(product.title),
                        pw.Text(quantity.toString()),
                        pw.Text('\$${price.toStringAsFixed(2)}'),
                      ],
                    );

                  }),
                ],
              ),
              pw.Divider(),
              pw.Text('Total: \$${totalPrice.toStringAsFixed(2)}', style: pw.TextStyle(
                  fontSize: 18, fontWeight: pw.FontWeight.bold)),
            ],
          );
        },
      ),
    );

    final output = await getTemporaryDirectory();
    final file = File('${output.path}/receipt_$transactionId.pdf');
    await file.writeAsBytes(await pdf.save());

    print('PDF generated at: ${file.path}');

    await Share.shareFiles(
      [file.path],
      text: 'Here is your receipt',
      sharePositionOrigin: Rect.fromLTWH(0, 0, 1, 1),
    );
  }
}