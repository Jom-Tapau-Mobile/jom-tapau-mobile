class Cart {
  late final int? id;
  final String? product_id;
  final String? name;

  Cart({required this.id, required this.product_id, required this.name});

  Cart.fromMap(Map<dynamic, dynamic> res, this.product_id, this.name)
      : id = res['id'];
  Map<String, Object> toMap() {
    return {
      
    };
  }
}
// Cart.fromMap(Map<dynamic, dynamic> res)
