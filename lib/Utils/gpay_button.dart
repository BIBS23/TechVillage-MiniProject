import 'package:flutter/material.dart';
import 'package:pay/pay.dart';
import 'package:techvillage/payment_confi.dart';

class GpayButton extends StatelessWidget {
  const GpayButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: GooglePayButton(
      paymentConfiguration: PaymentConfiguration.fromJsonString(defaultGooglePay),
      paymentItems: const [
        PaymentItem(
          label: 'Total',
          amount: '0.01',
          status: PaymentItemStatus.final_price,
        )
      ],
      type: GooglePayButtonType.pay,
      onPaymentResult: (result) => debugPrint('Payment Result $result'),
      loadingIndicator: const Center(
        child: CircularProgressIndicator(),
      ),
      ),
    );
  }
}