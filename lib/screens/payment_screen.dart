import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

import '../core/constants/route_paths.dart';
import '../core/services/cart_service.dart';
import '../core/utils/format_utils.dart';
import '../core/widgets/app_scaffold.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key, this.cartService});

  final CartService? cartService;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final _formKey = GlobalKey<FormState>();
  String _paymentMethod = 'card';
  bool _isProcessing = false;
  late final CartService _cartService = widget.cartService ?? CartService();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _cartService,
      builder: (context, _) {
        return AppScaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_rounded),
              onPressed: _isProcessing ? null : () => context.pop(),
            ),
            title: const Text('Payment'),
          ),
          body: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Payment Method',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const SizedBox(height: 12),
                SegmentedButton<String>(
                  segments: const [
                    ButtonSegment(value: 'card', label: Text('Card'), icon: Icon(Icons.credit_card)),
                    ButtonSegment(value: 'paypal', label: Text('PayPal'), icon: Icon(Icons.account_balance_wallet_outlined)),
                    ButtonSegment(value: 'apple', label: Text('Apple Pay'), icon: Icon(Icons.apple)),
                  ],
                  selected: {_paymentMethod},
                  onSelectionChanged: (selection) {
                    setState(() => _paymentMethod = selection.first);
                  },
                ),
                const SizedBox(height: 24),
                if (_paymentMethod == 'card') ...[
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Card Number'),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    validator: (value) {
                      if (_paymentMethod != 'card') return null;
                      if (value == null || value.length < 16) {
                        return 'Enter a valid 16-digit card number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(labelText: 'Expiry (MM/YY)'),
                          validator: (value) {
                            if (_paymentMethod != 'card') return null;
                            if (value == null || value.isEmpty) return 'Required';
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(labelText: 'CVV'),
                          keyboardType: TextInputType.number,
                          obscureText: true,
                          validator: (value) {
                            if (_paymentMethod != 'card') return null;
                            if (value == null || value.length < 3) return 'Invalid CVV';
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Cardholder Name'),
                    validator: (value) {
                      if (_paymentMethod != 'card') return null;
                      if (value == null || value.isEmpty) return 'Enter cardholder name';
                      return null;
                    },
                  ),
                ] else
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Icon(
                            _paymentMethod == 'paypal'
                                ? Icons.account_balance_wallet_outlined
                                : Icons.apple,
                            size: 32,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              _paymentMethod == 'paypal'
                                  ? 'You will be redirected to PayPal to complete payment.'
                                  : 'Confirm payment with Apple Pay on your device.',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                const SizedBox(height: 24),
                Card(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Amount to Pay',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                        Text(
                          FormatUtils.currency(_cartService.total),
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.w800,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    onPressed: _isProcessing ? null : _processPayment,
                    icon: _isProcessing
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                          )
                        : const Icon(Icons.lock_outline),
                    label: Text(_isProcessing ? 'Processing...' : 'Pay Now'),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _processPayment() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isProcessing = true);
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    _cartService.clear();
    setState(() => _isProcessing = false);

    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          icon: Icon(
            Icons.check_circle_rounded,
            color: Theme.of(context).colorScheme.primary,
            size: 48,
          ).animate().scale(duration: 400.ms, curve: Curves.elasticOut),
          title: const Text('Payment Successful'),
          content: const Text(
            'Your order has been placed successfully. You can track it in your orders.',
          ),
          actions: [
            FilledButton(
              onPressed: () {
                Navigator.of(context).pop();
                context.go(RoutePaths.orders);
              },
              child: const Text('View Orders'),
            ),
          ],
        );
      },
    );
  }
}
