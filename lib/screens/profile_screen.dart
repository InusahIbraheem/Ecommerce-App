import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

import '../core/constants/route_paths.dart';
import '../core/services/cart_service.dart';
import '../core/services/mock_data_service.dart';
import '../core/utils/responsive_utils.dart';
import '../core/widgets/app_scaffold.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, this.cartService});

  final CartService? cartService;

  @override
  Widget build(BuildContext context) {
    final user = MockDataService.currentUser;
    final activeCart = cartService ?? CartService();

    return ListenableBuilder(
      listenable: activeCart,
      builder: (context, _) {
        return AppScaffold(
          padding: EdgeInsets.zero,
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(ResponsiveUtils.horizontalPadding(context)),
                child: Column(
                  children: [
                    const SizedBox(height: 8),
                    CircleAvatar(
                      radius: 52,
                      backgroundImage: CachedNetworkImageProvider(user.avatarUrl),
                    )
                        .animate()
                        .scale(duration: 500.ms, curve: Curves.elasticOut),
                    const SizedBox(height: 16),
                    Text(
                      user.name,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w800,
                          ),
                    ),
                    Text(
                      user.email,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Member since ${user.memberSince.year}',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        _StatCard(
                          label: 'Orders',
                          value: '${MockDataService.orders.length}',
                          icon: Icons.receipt_long_outlined,
                        ),
                        const SizedBox(width: 12),
                        _StatCard(
                          label: 'Cart Items',
                          value: '${activeCart.itemCount}',
                          icon: Icons.shopping_cart_outlined,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              _MenuTile(
                icon: Icons.receipt_long_outlined,
                title: 'My Orders',
                subtitle: 'Track and manage your orders',
                onTap: () => context.push(RoutePaths.orders),
              ),
              _MenuTile(
                icon: Icons.shopping_cart_outlined,
                title: 'Shopping Cart',
                subtitle: '${activeCart.itemCount} items in cart',
                onTap: () => context.push(RoutePaths.cart),
              ),
              _MenuTile(
                icon: Icons.notifications_outlined,
                title: 'Notifications',
                subtitle: 'View alerts and promotions',
                onTap: () => context.push(RoutePaths.notifications),
              ),
              _MenuTile(
                icon: Icons.settings_outlined,
                title: 'Settings',
                subtitle: 'App preferences and account',
                onTap: () => context.push(RoutePaths.settings),
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.label,
    required this.value,
    required this.icon,
  });

  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Icon(icon, color: Theme.of(context).colorScheme.primary),
              const SizedBox(height: 8),
              Text(
                value,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
              ),
              Text(
                label,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuTile extends StatelessWidget {
  const _MenuTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveUtils.horizontalPadding(context),
        vertical: 4,
      ),
      child: Card(
        child: ListTile(
          leading: Icon(icon),
          title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
          subtitle: Text(subtitle),
          trailing: const Icon(Icons.chevron_right_rounded),
          onTap: onTap,
        ),
      ),
    );
  }
}
