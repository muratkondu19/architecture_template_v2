import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// Global product state sınıfı
/// Bu sınıf, uygulama genelinde kullanılan state bilgilerini tutar
/// Equatable'dan türetilir ve state karşılaştırmaları için kullanılır
final class ProductState extends Equatable {
  /// Constructor - tema modu opsiyonel, varsayılan açık tema
  /// @param themeMode - Tema modu (varsayılan ThemeMode.light)
  const ProductState({this.themeMode = ThemeMode.light});

  /// Tema modu - uygulamanın açık/koyu tema durumu
  final ThemeMode themeMode;

  /// Equatable için props listesi
  /// Tema modu değişikliklerini takip eder
  @override
  List<Object?> get props => [themeMode];

  /// State'i kopyalama metodu
  /// Immutable state pattern için kullanılır
  /// @param themeMode - Yeni tema modu (null ise mevcut değer korunur)
  /// @return - Yeni ProductState instance'ı
  ProductState copyWith({ThemeMode? themeMode}) {
    return ProductState(themeMode: themeMode ?? this.themeMode);
  }
}
