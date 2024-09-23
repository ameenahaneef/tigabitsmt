import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:tigabitsmt/data/models/product_model.dart';

class DatabaseHelper {
  static late Database _db;

  static Future<void> initializeDatabase() async {
    _db = await openDatabase(
      join(await getDatabasesPath(), "products.db"),
      version: 1,
      onCreate: (db, version) async {
        print('Creating products table');
        await db.execute('''
          CREATE TABLE products(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            product_id INTEGER,
            product_name TEXT,
            product_slug TEXT,
            display_product_name TEXT,
            display_category_name TEXT,
            offer_flag INTEGER,
            product_price REAL,
            product_out_of_stock INTEGER,
            has_service INTEGER,
            is_variant INTEGER,
            resource_small_name TEXT,
            resource_small_path TEXT,
            resource_medium_name TEXT,
            resource_medium_path TEXT,
            cdn_url TEXT,
            store_id INTEGER,
            category_name TEXT,
            category_slug TEXT,
            offer_price REAL,
            offer_price_percentage INTEGER,
            offer_type TEXT,
            offer_type_id INTEGER,
            add_to_cart INTEGER,
            prod_cart_qty INTEGER,
            prod_type_id INTEGER,
            unit_name TEXT,
            items_per_pack INTEGER,
            wishlisted INTEGER,
            is_session_available INTEGER,
            main_category_id INTEGER,
            product_qty INTEGER,
            raw_count INTEGER,
            prod_purchase_limit INTEGER,
            max_offer_qty INTEGER
          )
        ''');
      },
    );
  }

  static Future<void> addProduct(Product product) async {
    await _db.insert(
      'products',
      product.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Product>> getProducts() async {
    final List<Map<String, dynamic>> maps = await _db.query('products');

    return List.generate(maps.length, (i) {
      return Product.fromJson(maps[i]);
    }
    );
  }

  static Future<void> clearDatabase() async {
    final dbPath = join(await getDatabasesPath(), "products.db");
    await deleteDatabase(dbPath);
    print("Database deleted");
  }
}
