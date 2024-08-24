import 'package:ecommerce_app/view/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import '../../controller/cart_controller.dart';
import '../widgets/pdf_generator.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final CartController cartController = Get.find();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();
  final TextEditingController upiIdController = TextEditingController();
  String paymentMethod = 'Card'; // Default payment method

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order Summary',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: cartController.items.length,
                itemBuilder: (context, index) {
                  final product = cartController.items[index];
                  return ListTile(
                    title: Text(product.title),
                    subtitle: Text('Quantity: ${cartController.getQuantity(product)}'),
                    trailing: Text('\$${product.price * cartController.getQuantity(product)}'),
                  );
                },
              ),
            ),
            Divider(),
            Text(
              'Total: \$${cartController.totalPrice}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            _buildPaymentMethodSelector(),
            SizedBox(height: 10),
            _buildPaymentDetailsInput(),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () => _finalizeTransaction(context),
                child: Text('Buy Now'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  textStyle: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethodSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Radio<String>(
          value: 'Card',
          groupValue: paymentMethod,
          onChanged: (value) {
            setState(() {
              paymentMethod = value!;
            });
          },
        ),
        Text('Credit/Debit Card'),
        Radio<String>(
          value: 'UPI',
          groupValue: paymentMethod,
          onChanged: (value) {
            setState(() {
              paymentMethod = value!;
            });
          },
        ),
        Text('UPI'),
      ],
    );
  }

  Widget _buildPaymentDetailsInput() {
    if (paymentMethod == 'Card') {
      return Column(
        children: [
          TextField(
            controller: cardNumberController,
            decoration: InputDecoration(
              labelText: 'Card Number',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 10),
          TextField(
            controller: cvvController,
            decoration: InputDecoration(
              labelText: 'CVV',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            maxLength: 3,
            obscureText: true, // Mask CVV input for security
          ),
        ],
      );
    } else if (paymentMethod == 'UPI') {
      return TextField(
        controller: upiIdController,
        decoration: InputDecoration(
          labelText: 'UPI ID',
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.emailAddress,
      );
    }
    return SizedBox.shrink();
  }

  void _finalizeTransaction(BuildContext context) {
    // Simulate transaction processing
    String transactionId = Uuid().v4(); // Generate a random transaction ID
    DateTime purchaseDate = DateTime.now();

    // Validate input
    if (paymentMethod == 'Card' && (cardNumberController.text.isEmpty || cvvController.text.isEmpty)) {
      Get.snackbar('Error', 'Please enter your card number and CVV');
      return;
    }
    if (paymentMethod == 'UPI' && upiIdController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter a UPI ID');
      return;
    }

    // Generate the PDF receipt
    PdfGenerator.generateReceipt(
      cartController.items,
      cartController.quantities,
      cartController.totalPrice,
      transactionId,
      purchaseDate,
    );

    // Show a success message
    Get.snackbar(
      'Payment Successful',
      'Transaction ID: $transactionId',
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 5),
    );

    // Navigate back to the home or another page
    Get.to(HomeScreen());
  }
}
