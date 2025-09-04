import 'package:core/src/cache/core/cache_model.dart';

/// Cache işlemleri için abstract base sınıf
/// Bu sınıf, cache'de CRUD (Create, Read, Update, Delete) işlemlerini yönetir
/// Generic type kullanılarak type-safe cache operasyonları sağlar
/// @param T - Cache'de saklanacak model tipi (CacheModel'dan türetilmiş olmalı)
abstract class CacheOperation<T extends CacheModel> {
  /// Constructor - const olarak tanımlanmış
  const CacheOperation();

  /// Tek bir item'ı cache'e ekleyen metod
  /// @param item - Cache'e eklenecek model objesi
  void add(T item);

  /// Birden fazla item'ı toplu olarak cache'e ekleyen metod
  /// @param items - Cache'e eklenecek model objelerinin listesi
  void addAll(List<T> items);

  /// Cache'deki tüm verileri temizleyen metod
  /// Uygulama reset işlemleri için kullanılır
  void clear();

  /// Cache'deki tüm item'ları döndüren metod
  /// @return - Cache'deki tüm model objelerinin listesi
  List<T> getAll();

  /// ID'ye göre spesifik bir item'ı cache'den getiren metod
  /// @param id - Aranacak item'ın unique ID'si
  /// @return - Bulunan model objesi veya null (bulunamazsa)
  T? get(String id);
}
