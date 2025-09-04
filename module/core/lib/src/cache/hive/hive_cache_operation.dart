import 'package:core/src/cache/core/cache_model.dart';
import 'package:core/src/cache/core/cache_operation.dart';
import 'package:hive/hive.dart';

/// Hive database kullanarak cache operasyonları sağlayan implementasyon
/// Bu sınıf, CacheOperation abstract sınıfının Hive ile implementasyonudur
/// Generic type kullanılarak type-safe cache operasyonları sağlar
/// @param T - Cache'de saklanacak model tipi (CacheModel'dan türetilmiş olmalı)
class HiveCacheOperation<T extends CacheModel> extends CacheOperation<T> {
  /// Constructor - Hive box'ını initialize eder
  /// Generic type'ın string karşılığını box ismi olarak kullanır
  HiveCacheOperation() {
    _box = Hive.box<T>(name: T.toString());
  }

  /// Hive box instance'ı - cache verilerinin saklandığı container
  /// Late initialization kullanılarak constructor'da initialize edilir
  late final Box<T> _box;

  /// Tek bir item'ı Hive box'a ekleyen metod
  /// Item'ın ID'sini key olarak kullanır
  /// @param item - Cache'e eklenecek model objesi
  @override
  void add(T item) {
    _box.put(item.id, item);
  }

  /// Birden fazla item'ı toplu olarak Hive box'a ekleyen metod
  /// Map.fromIterable kullanarak performanslı toplu ekleme sağlar
  /// @param items - Cache'e eklenecek model objelerinin listesi
  @override
  void addAll(List<T> items) {
    _box.putAll(Map.fromIterable(items));
  }

  /// Hive box'daki tüm verileri temizleyen metod
  /// Uygulama reset işlemleri için kullanılır
  @override
  void clear() {
    _box.clear();
  }

  /// ID'ye göre spesifik bir item'ı Hive box'dan getiren metod
  /// @param id - Aranacak item'ın unique ID'si
  /// @return - Bulunan model objesi veya null (bulunamazsa)
  @override
  T? get(String id) {
    return _box.get(id);
  }

  /// Hive box'daki tüm item'ları döndüren metod
  /// Null değerleri filtreleyerek sadece geçerli objeleri döndürür
  /// @return - Box'daki tüm geçerli model objelerinin listesi
  @override
  List<T> getAll() {
    return _box.getAll(_box.keys).where((element) => element != null).cast<T>().toList();
  }
}
