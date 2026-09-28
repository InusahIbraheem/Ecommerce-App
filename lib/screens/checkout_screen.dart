import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ecommerce_ui/core/utils/responsive.dart';
import 'package:ecommerce_ui/widgets/animated_page.dart';
import 'package:ecommerce_ui/widgets/glass_card.dart';
import 'package:ecommerce_ui/widgets/premium_card.dart';
import 'package:ecommerce_ui/widgets/section_header.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedPage(
      title: 'Checkout',
      showBackButton: true,
      children: [
        GlassCard(
          child: Row(
            children: [
              Hero(
                tag: 'hero_checkout',
                child: CircleAvatar(
                  radius: 32,
                  backgroundColor: Theme.of(context).colorScheme.primary.withValues(alpha: 0.15),
                  child: Icon(Icons.shopping_bag_outlined, size: 32, color: Theme.of(context).colorScheme.primary),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Checkout', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text('Shipping & summary', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey)),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: Responsive.gridCount(context, mobile: 2, tablet: 3, desktop: 4),
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 1.4,
          children: List.generate(4, (i) => PremiumCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.shopping_bag_outlined, color: Theme.of(context).colorScheme.primary),
                const SizedBox(height: 8),
                Text('Item ${i + 1}', style: const TextStyle(fontWeight: FontWeight.w600)),
                Text('Premium content', style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
              ],
            ),
          )),
        ),
        const SizedBox(height: 20),
        const SectionHeader(title: 'Quick Access'),
        
            PremiumCard(
              onTap: () => context.push('/splash'),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.primary.withValues(alpha: 0.15),
                  child: Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Theme.of(context).colorScheme.primary),
                ),
                title: Text('Splash', style: const TextStyle(fontWeight: FontWeight.w600)),
                subtitle: const Text('Tap to open'),
                trailing: const Icon(Icons.chevron_right_rounded),
              ),
            ),
            const SizedBox(height: 12),
            PremiumCard(
              onTap: () => context.push('/home'),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.primary.withValues(alpha: 0.15),
                  child: Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Theme.of(context).colorScheme.primary),
                ),
                title: Text('Home', style: const TextStyle(fontWeight: FontWeight.w600)),
                subtitle: const Text('Tap to open'),
                trailing: const Icon(Icons.chevron_right_rounded),
              ),
            ),
            const SizedBox(height: 12),
            PremiumCard(
              onTap: () => context.push('/categories'),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.primary.withValues(alpha: 0.15),
                  child: Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Theme.of(context).colorScheme.primary),
                ),
                title: Text('Categories', style: const TextStyle(fontWeight: FontWeight.w600)),
                subtitle: const Text('Tap to open'),
                trailing: const Icon(Icons.chevron_right_rounded),
              ),
            ),
            const SizedBox(height: 12),
            PremiumCard(
              onTap: () => context.push('/product_details'),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.primary.withValues(alpha: 0.15),
                  child: Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Theme.of(context).colorScheme.primary),
                ),
                title: Text('Product Details', style: const TextStyle(fontWeight: FontWeight.w600)),
                subtitle: const Text('Tap to open'),
                trailing: const Icon(Icons.chevron_right_rounded),
              ),
            ),
            const SizedBox(height: 12),
            PremiumCard(
              onTap: () => context.push('/wishlist'),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.primary.withValues(alpha: 0.15),
                  child: Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Theme.of(context).colorScheme.primary),
                ),
                title: Text('Wishlist', style: const TextStyle(fontWeight: FontWeight.w600)),
                subtitle: const Text('Tap to open'),
                trailing: const Icon(Icons.chevron_right_rounded),
              ),
            ),
            const SizedBox(height: 12),
            PremiumCard(
              onTap: () => context.push('/cart'),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.primary.withValues(alpha: 0.15),
                  child: Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Theme.of(context).colorScheme.primary),
                ),
                title: Text('Cart', style: const TextStyle(fontWeight: FontWeight.w600)),
                subtitle: const Text('Tap to open'),
                trailing: const Icon(Icons.chevron_right_rounded),
              ),
            ),
            const SizedBox(height: 12),
        
      ],
    );
  }
}
