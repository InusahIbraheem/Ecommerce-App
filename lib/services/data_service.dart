import 'package:ecommerce_ui/models/app_item.dart';

class DataService {
  static List<AppItem> get items => List.generate(8, (i) => AppItem(
        id: 'item_$i',
        title: 'Premium Item ${i + 1}',
        subtitle: 'Curated content for Ecommerce UI',
        imageUrl: 'https://picsum.photos/seed/ecommerce_ui$i/400/300',
      ));
}
