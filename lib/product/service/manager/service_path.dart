/// API endpoint'lerini tanımlayan enum sınıfı
/// Bu enum, uygulama genelinde kullanılan tüm API path'lerini merkezi olarak yönetir
enum ServicePath {
  // Kullanıcı işlemleri için endpoint'ler
  usersv2('/apiv2/users'), // V2 kullanıcı API'si
  users('/users'), // V1 kullanıcı API'si

  // Post işlemleri için endpoint'ler
  postsv2('/apiv2/posts'), // V2 post API'si
  posts('/posts'), // V1 post API'si

  // Diğer API endpoint'leri
  comments('/apiv2/comments'), // Yorum API'si
  albums('/apiv2/albums'), // Albüm API'si
  photos('/apiv2/photos'), // Fotoğraf API'si
  todos('/apiv2/todos'); // Todo API'si

  /// API path'ini tutan final değişken
  final String path;

  /// Constructor - path değerini atar
  const ServicePath(this.path);

  /// Tam path'i döndüren getter metodu
  String get fullPath => path;

  /// Tek bir query parametresi ekleyerek path oluşturan metod
  /// @param key - Query parametresi anahtarı
  /// @param value - Query parametresi değeri
  /// @return - Query parametresi eklenmiş path string'i
  String withQueryParameter(String key, String value) => '$path?$key=$value';

  /// Birden fazla query parametresi ekleyerek path oluşturan metod
  /// @param queryParameters - Key-value çiftlerini içeren Map
  /// @return - Tüm query parametreleri eklenmiş path string'i
  String withQueryParameters(Map<String, String> queryParameters) =>
      '$path?${queryParameters.entries.map((e) => '${e.key}=${e.value}').join('&')}';
}
