import 'package:flutter/material.dart';

/// Stateful widget'lar için loading durumu yönetimi sağlayan mixin
/// Bu mixin, widget'ların loading (yükleme) durumlarını kolayca yönetmelerini sağlar
/// ValueNotifier kullanarak reactive loading state yönetimi yapar
/// T: StatefulWidget türünde olmalıdır
mixin LoadingMixin<T extends StatefulWidget> on State<T> {
  /// Loading durumunu takip eden ValueNotifier
  /// false: İşlem tamamlandı veya henüz başlamadı
  /// true: İşlem devam ediyor (loading durumunda)
  final ValueNotifier<bool> _isLoadingNotifier = ValueNotifier<bool>(false);

  /// Mevcut loading durumunu döndüren getter
  /// Bu değer sadece okunabilir, değiştirmek için changeLoading() metodunu kullanın
  /// Returns: bool - true ise loading durumunda, false ise normal durumda
  bool get isLoading => _isLoadingNotifier.value;

  /// Loading durumunu takip eden ValueNotifier'ı döndüren getter
  /// Bu notifier ValueListenableBuilder ile kullanılabilir
  /// UI'da loading durumuna göre widget'ları göstermek/gizlemek için kullanılır
  /// Returns: ValueNotifier<> - Loading durumunu dinleyebileceğiniz notifier
  ValueNotifier<bool> get isLoadingNotifier => _isLoadingNotifier;

  /// Loading durumunu değiştiren metod
  /// [isLoading] parametresi: Opsiyonel, eğer verilirse bu değere zorla ayarlar
  /// Eğer isLoading parametresi verilmezse, mevcut durumun tersine çevirir
  ///
  /// Kullanım örnekleri:
  /// - changeLoading(): Mevcut durumu tersine çevirir
  /// - changeLoading(isLoading: true): Loading durumunu true yapar
  /// - changeLoading(isLoading: false): Loading durumunu false yapar
  void changeLoading({bool? isLoading}) {
    // Eğer isLoading parametresi verilmişse, o değere ayarla
    if (isLoading != null) _isLoadingNotifier.value = isLoading;

    // Eğer isLoading parametresi verilmemişse, mevcut durumu tersine çevir
    _isLoadingNotifier.value = !_isLoadingNotifier.value;
  }
}
