/// Cache model'ları için gerekli interface'i tanımlayan mixin
/// Bu mixin, cache'de saklanacak tüm model'ların implement etmesi gereken metodları içerir
/// JSON serialization/deserialization ve unique ID sağlama işlevleri sunar
mixin CacheModel {
  /// Model'ın unique identifier'ını döndüren getter
  /// Cache'de key olarak kullanılır, her model için benzersiz olmalıdır
  /// @return - Model'ın unique ID'si (genellikle string)
  String get id;

  /// Dynamic JSON'dan model objesi oluşturan factory metod
  /// Cache'den veri okurken JSON'dan model'a dönüştürme için kullanılır
  /// @param json - Dynamic JSON verisi
  /// @return - JSON'dan oluşturulan model instance'ı
  CacheModel fromDynamicJson(dynamic json);

  /// Model'ı JSON Map'e dönüştüren metod
  /// Cache'e veri yazarken model'ı JSON'a dönüştürme için kullanılır
  /// @return - Model'ın JSON Map formatındaki hali
  Map<String, dynamic> toJson();
}
