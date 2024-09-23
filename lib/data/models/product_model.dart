class Product {
  final int productId;
  final String productName;
  final String productSlug;
  final String displayProductName;
  final String displayCategoryName;
  final int offerFlag;
  final double productPrice;
  final bool productOutOfStock;
  final bool hasService;
  final bool isVariant;
  final String? resourceSmallName;
  final String? resourceSmallPath;
  final String? resourceMediumName;
  final String? resourceMediumPath;
  final String cdnUrl;
  final int storeId;
  final String categoryName;
  final String categorySlug;
  final double offerPrice;
  final int offerPricePercentage;
  final String offerType;
  final int offerTypeId;
  final bool addToCart;
  final int prodCartQty;
  final int prodTypeId;
  final String? unitName;
  final int? itemsPerPack;
  final bool wishlisted;
  final bool isSessionAvailable;
  final int mainCategoryId;
  final int? productQty;
  final int rawCount;
  final int prodPurchaseLimit;
  final int maxOfferQty;

  Product({
    required this.productId,
    required this.productName,
    required this.productSlug,
    required this.displayProductName,
    required this.displayCategoryName,
    required this.offerFlag,
    required this.productPrice,
    required this.productOutOfStock,
    required this.hasService,
    required this.isVariant,
    this.resourceSmallName,
    this.resourceSmallPath,
    this.resourceMediumName,
    this.resourceMediumPath,
    required this.cdnUrl,
    required this.storeId,
    required this.categoryName,
    required this.categorySlug,
    required this.offerPrice,
    required this.offerPricePercentage,
    required this.offerType,
    required this.offerTypeId,
    required this.addToCart,
    required this.prodCartQty,
    required this.prodTypeId,
    this.unitName,
    this.itemsPerPack,
    required this.wishlisted,
    required this.isSessionAvailable,
    required this.mainCategoryId,
    this.productQty,
    required this.rawCount,
    required this.prodPurchaseLimit,
    required this.maxOfferQty,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productId: json['product_id'],
      productName: json['product_name'] ?? '',
      productSlug: json['product_slug'] ?? '',
      displayProductName: json['display_product_name'] ?? '',
      displayCategoryName: json['display_category_name'] ?? '',
      offerFlag: json['offer_flag'] ?? 0,
      productPrice: double.tryParse(json['product_price'].toString()) ?? 0.0,
      productOutOfStock: json['product_out_of_stock'] == 1,
      hasService: json['has_service'] == 1,
      isVariant: json['is_variant'] == 1,
      resourceSmallName: json['resource_small_name'],
      resourceSmallPath: json['resource_small_path'],
      resourceMediumName: json['resource_medium_name'],
      resourceMediumPath: json['resource_medium_path'],
      cdnUrl: json['cdn_url'] ?? '',
      storeId: json['store_id'],
      categoryName: json['category_name'] ?? '',
      categorySlug: json['category_slug'] ?? '',
      offerPrice: double.tryParse(json['offer_price'].toString()) ?? 0.0,
      offerPricePercentage: json['offer_price_percentage'] ?? 0,
      offerType: json['offer_type'] ?? '',
      offerTypeId: json['offer_type_id'] ?? 0,
      addToCart: json['add_to_cart']==1,
      prodCartQty: json['prod_cart_qty'] ?? 0,
      prodTypeId: json['prod_type_id'] ?? 0,
      unitName: json['unit_name'],
      itemsPerPack: json['items_per_pack'],
      wishlisted: json['wishlisted'] ==1,
      isSessionAvailable: json['is_session_available'] == 1,
      mainCategoryId: json['main_category_id'] ?? 0,
      productQty: json['product_qty'],
      rawCount: json['raw_count'] ?? 0,
      prodPurchaseLimit: json['prod_purchase_limit'] ?? 0,
      maxOfferQty: json['max_offer_qty'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product_id': productId,
      'product_name': productName,
      'product_slug': productSlug,
      'display_product_name': displayProductName,
      'display_category_name': displayCategoryName,
      'offer_flag': offerFlag,
      'product_price': productPrice.toString(),
      'product_out_of_stock': productOutOfStock ? 1 : 0,
      'has_service': hasService ? 1 : 0,
      'is_variant': isVariant ? 1 : 0,
      'resource_small_name': resourceSmallName,
      'resource_small_path': resourceSmallPath,
      'resource_medium_name': resourceMediumName,
      'resource_medium_path': resourceMediumPath,
      'cdn_url': cdnUrl,
      'store_id': storeId,
      'category_name': categoryName,
      'category_slug': categorySlug,
      'offer_price': offerPrice.toString(),
      'offer_price_percentage': offerPricePercentage,
      'offer_type': offerType,
      'offer_type_id': offerTypeId,
      'add_to_cart': addToCart?1:0,
      'prod_cart_qty': prodCartQty,
      'prod_type_id': prodTypeId,
      'unit_name': unitName,
      'items_per_pack': itemsPerPack,
      'wishlisted': wishlisted?1:0,
      'is_session_available': isSessionAvailable ? 1 : 0,
      'main_category_id': mainCategoryId,
      'product_qty': productQty,
      'raw_count': rawCount,
      'prod_purchase_limit': prodPurchaseLimit,
      'max_offer_qty': maxOfferQty,
    };
  }
}
