import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

import '../core/models/notification.dart';
import '../core/services/mock_data_service.dart';
import '../core/utils/format_utils.dart';
import '../core/widgets/app_scaffold.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  IconData _iconForType(NotificationType type) {
    return switch (type) {
      NotificationType.order => Icons.local_shipping_outlined,
      NotificationType.promo => Icons.local_offer_outlined,
      NotificationType.system => Icons.info_outline_rounded,
    };
  }

  Color _colorForType(BuildContext context, NotificationType type) {
    return switch (type) {
      NotificationType.order => Colors.blue,
      NotificationType.promo => Colors.orange,
      NotificationType.system => Theme.of(context).colorScheme.primary,
    };
  }

  @override
  Widget build(BuildContext context) {
    final notifications = MockDataService.notifications;

    return AppScaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => context.pop(),
        ),
        title: const Text('Notifications'),
      ),
      body: Column(
        children: [
          ...notifications.asMap().entries.map((entry) {
            final index = entry.key;
            final notification = entry.value;
            return _NotificationTile(
              notification: notification,
              icon: _iconForType(notification.type),
              color: _colorForType(context, notification.type),
            )
                .animate()
                .fadeIn(delay: Duration(milliseconds: 50 * index))
                .slideX(begin: 0.03, end: 0);
          }),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _NotificationTile extends StatelessWidget {
  const _NotificationTile({
    required this.notification,
    required this.icon,
    required this.color,
  });

  final AppNotification notification;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      color: notification.isRead
          ? null
          : Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.3),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: color.withValues(alpha: 0.15),
          child: Icon(icon, color: color, size: 22),
        ),
        title: Text(
          notification.title,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: notification.isRead ? FontWeight.w500 : FontWeight.w700,
              ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(notification.message),
            const SizedBox(height: 4),
            Text(
              FormatUtils.timeAgo(notification.createdAt),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
          ],
        ),
        trailing: notification.isRead
            ? null
            : Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  shape: BoxShape.circle,
                ),
              ),
      ),
    );
  }
}
