import 'package:flutter_bloc/flutter_bloc.dart';

/// Tüm Cubit sınıfları için base sınıf
/// Bu sınıf, ortak kullanılan Cubit fonksiyonlarını sağlar
/// Tüm Cubit sınıfları bu sınıftan türetilerek ortak fonksiyonlara erişim sağlar
abstract class BaseCubit<T extends Object?> extends Cubit<T> {
  /// Constructor - initial state ile Cubit'i başlatır
  /// @param initialState - Cubit'in başlangıç state'i
  BaseCubit(super.initialState);

  /// State emit etme metodu
  /// Bu metod, Cubit kapalı değilse state'i emit eder
  /// Kapalı Cubit'lerde state emit edilmez (memory leak önleme)
  /// @param state - Emit edilecek state
  @override
  void emit(T state) {
    // Eğer Cubit kapalıysa state emit etme
    if (isClosed) return;
    // State'i emit et
    super.emit(state);
  }
}
