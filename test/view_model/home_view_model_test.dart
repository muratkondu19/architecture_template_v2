// Test dosyası import'ları
import 'package:architecture_template/feature/home/view_model/home_view_model.dart';
import 'package:architecture_template/feature/home/view_model/state/home_state.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

// Mock sınıfları import'ları
import 'mock/login_service_mock.dart';
import 'mock/user_cache_mock.dart';

/// Home ViewModel için unit test dosyası
/// Bu dosya, HomeViewModel sınıfının tüm public metodlarını test eder
/// BlocTest paketi kullanılarak state değişiklikleri test edilir
/// Mock objeler kullanılarak external dependency'ler izole edilir
void main() {
  /// Test edilecek HomeViewModel instance'ı
  /// Her test öncesi yeniden initialize edilir
  late HomeViewModel homeViewModel;

  /// Test setup metodu - her test öncesi çalışır
  /// Mock objeler ile HomeViewModel'i initialize eder
  /// Bu sayede external dependency'ler test ortamında kontrol edilir
  setUp(() {
    homeViewModel = HomeViewModel(
      authenticationOperation: LoginServiceMock(), // Mock authentication service
      userCacheOperation: UserCacheMock(), // Mock cache operation
    );
  });

  /// Home ViewModel test grubu
  /// Tüm HomeViewModel testleri bu grup altında organize edilir
  group('Home View Model Test', () {
    /// Initial state testi
    /// ViewModel'in başlangıç durumunun doğru olduğunu kontrol eder
    /// Loading state'in false olması beklenir
    test('inital state is loading', () {
      expect(homeViewModel.state.isLoading, false);
    });

    /// Loading state değişikliği testi
    /// BlocTest kullanılarak state değişikliği test edilir
    /// changeLoading() metodu çağrıldığında loading state'in true olması beklenir
    blocTest<HomeViewModel, HomeState>(
      'change loading state',
      build: () => homeViewModel, // Test edilecek bloc instance'ı
      act: (bloc) => bloc.changeLoading(), // Test edilecek aksiyon
      expect: () => [
        // Beklenen state değişiklikleri
        isA<HomeState>().having((state) => state.isLoading, 'isLoading', true),
      ],
    );

    /// Kullanıcı listesi getirme testi
    /// getUsers() metodu çağrıldığında users listesinin dolu olması beklenir
    /// Mock service'den gelen verilerin state'e doğru yansıdığı test edilir
    blocTest<HomeViewModel, HomeState>(
      'fetch users',
      build: () => homeViewModel, // Test edilecek bloc instance'ı
      act: (bloc) async => bloc.getUsers(), // Async metod testi
      expect: () => [
        // Beklenen state değişiklikleri
        isA<HomeState>().having((state) => state.users, 'users', isNotEmpty),
      ],
    );

    /// Cache veri kontrolü testi
    /// getUsers() çağrıldıktan sonra cache'deki verilerin doğru olduğunu kontrol eder
    /// Bu test, cache işlemlerinin doğru çalıştığını doğrular
    test('Check database for items', () async {
      await homeViewModel.getUsers(); // Kullanıcıları getir
      expect(homeViewModel.users, isNotEmpty); // Cache'deki verilerin dolu olduğunu kontrol et
    });
  });
}
