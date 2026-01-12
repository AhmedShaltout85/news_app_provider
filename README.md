# 📰 News App - Flutter & Provider

[![Flutter](https://img.shields.io/badge/Flutter-3.5.3-02569B?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.0+-0175C2?logo=dart)](https://dart.dev)
[![Provider](https://img.shields.io/badge/State%20Management-Provider-orange)](https://pub.dev/packages/provider)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

A production-ready news application built with Flutter that delivers real-time news from multiple sources. Demonstrates best practices in Flutter development, clean architecture, and efficient state management using Provider.

## 📑 Table of Contents

- [Features](#-features)
- [Architecture](#-architecture)
- [Project Structure](#-project-structure)
- [Getting Started](#-getting-started)
- [Configuration](#-configuration)
- [API Integration](#-api-integration)
- [State Management](#-state-management)
- [Localization](#-localization)
- [Testing](#-testing)
- [Building](#-building-for-production)
- [Performance](#-performance-optimization)
- [Contributing](#-contributing)

## ✨ Features

### Core Features
- 🔥 **Real-time News Feed** - Fetch latest news from multiple sources
- 📱 **Multi-Platform** - Android, iOS, Web, Windows, macOS, Linux
- 🔍 **Advanced Search** - Search by keywords, categories, sources
- 📚 **Categories** - Business, Tech, Sports, Entertainment, etc.
- 🔖 **Bookmarks** - Save articles for offline reading
- 🌙 **Dark Mode** - Beautiful dark theme
- 🌍 **Multi-language** - International support
- 💾 **Offline Mode** - Cached articles
- 🔔 **Notifications** - Breaking news alerts
- 📊 **Analytics** - Reading history tracking

### Technical Features
- ⚡ **Fast Performance** - Optimized image loading/caching
- 🔐 **Secure Storage** - Encrypted sensitive data
- 🎨 **Material Design 3** - Modern UI
- 🔄 **Pull to Refresh** - Intuitive updates
- ♾️ **Infinite Scroll** - Seamless pagination
- 📱 **Responsive** - All screen sizes
- 🚀 **Native Splash** - Professional launch

## 🏗️ Architecture

Clean Architecture with separation of concerns:

```
Presentation Layer (UI, Providers)
         ↓
Business Logic Layer (Use Cases)
         ↓
Data Layer (Repositories, API)
```

### Patterns Used
- Provider Pattern (State Management)
- Repository Pattern (Data Abstraction)
- Service Locator (DI)
- Observer Pattern (Reactive UI)
- Factory Pattern (Object Creation)

## 📂 Project Structure

```
lib/
├── main.dart
├── core/
│   ├── constants/
│   │   ├── api_constants.dart
│   │   ├── app_constants.dart
│   │   └── route_constants.dart
│   ├── network/
│   │   ├── dio_client.dart
│   │   └── network_info.dart
│   ├── utils/
│   │   ├── date_formatter.dart
│   │   └── validators.dart
│   └── theme/
│       ├── app_theme.dart
│       └── colors.dart
├── data/
│   ├── models/
│   │   ├── article_model.dart
│   │   └── source_model.dart
│   ├── repositories/
│   │   └── news_repository.dart
│   └── data_sources/
│       ├── remote/
│       │   └── news_api_service.dart
│       └── local/
│           └── cache_service.dart
├── domain/
│   ├── entities/
│   │   └── article.dart
│   └── use_cases/
│       └── fetch_news_use_case.dart
├── presentation/
│   ├── providers/
│   │   ├── news_provider.dart
│   │   ├── theme_provider.dart
│   │   └── bookmark_provider.dart
│   ├── screens/
│   │   ├── home/
│   │   ├── detail/
│   │   ├── search/
│   │   └── settings/
│   └── widgets/
│       ├── common/
│       └── cards/
└── l10n/
    ├── app_en.arb
    └── app_ar.arb
```

## 🚀 Getting Started

### Prerequisites

```bash
# Check Flutter installation
flutter doctor

# Minimum requirements:
# - Flutter SDK: 3.5.3+
# - Dart: 3.0+
# - Android Studio / Xcode
```

### Installation

```bash
# 1. Clone repository
git clone https://github.com/AhmedShaltout85/news_app_provider.git
cd news_app_provider

# 2. Install dependencies
flutter pub get

# 3. Generate localization
flutter gen-l10n

# 4. Generate splash screen
dart run flutter_native_splash:create

# 5. Run app
flutter run
```

### Quick Setup (One Command)

```bash
git clone https://github.com/AhmedShaltout85/news_app_provider.git && \
cd news_app_provider && \
flutter pub get && \
flutter gen-l10n && \
flutter run
```

## ⚙️ Configuration

### 1. API Setup

```dart
// lib/core/constants/api_constants.dart
class ApiConstants {
  static const String baseUrl = 'https://newsapi.org/v2/';
  static const String apiKey = 'YOUR_API_KEY_HERE';
  
  // Endpoints
  static const String topHeadlines = 'top-headlines';
  static const String everything = 'everything';
  static const String sources = 'sources';
  
  // Settings
  static const String country = 'us';
  static const String language = 'en';
  static const int pageSize = 20;
  
  // Timeouts
  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
}
```

### 2. Environment Variables (.env)

```bash
# Create .env file
NEWS_API_KEY=your_api_key_here
BASE_URL=https://newsapi.org/v2/
```

Add to pubspec.yaml:
```yaml
dependencies:
  flutter_dotenv: ^5.1.0

assets:
  - .env
```

Usage:
```dart
import 'package:flutter_dotenv/flutter_dotenv.dart';

await dotenv.load(fileName: ".env");
final apiKey = dotenv.env['NEWS_API_KEY'];
```

### 3. Splash Screen

Edit `flutter_native_splash.yaml`:

```yaml
flutter_native_splash:
  color: "#ffffff"
  color_dark: "#121212"
  image: assets/images/splash_logo.png
  image_dark: assets/images/splash_logo_dark.png
  
  android_12:
    image: assets/images/splash_android12.png
    
  android: true
  ios: true
  web: true
  fullscreen: true
```

Generate:
```bash
dart run flutter_native_splash:create
```

## 🔌 API Integration

### Supported APIs

1. **NewsAPI.org** (Primary)
   - Free: 100 requests/day
   - Register: https://newsapi.org/register
   - Docs: https://newsapi.org/docs

2. **Alternatives**
   - GNews: https://gnews.io/
   - Currents: https://currentsapi.services/
   - The Guardian: https://open-platform.theguardian.com/

### Implementation

```dart
// lib/data/data_sources/remote/news_api_service.dart
class NewsApiService {
  final Dio _dio;
  
  NewsApiService(this._dio);
  
  Future<Response> getTopHeadlines({
    required String country,
    String? category,
    int page = 1,
  }) async {
    return await _dio.get('top-headlines', queryParameters: {
      'country': country,
      'category': category,
      'page': page,
      'pageSize': ApiConstants.pageSize,
    });
  }
  
  Future<Response> searchNews({
    required String query,
    int page = 1,
  }) async {
    return await _dio.get('everything', queryParameters: {
      'q': query,
      'page': page,
      'pageSize': ApiConstants.pageSize,
    });
  }
}
```

### Dio Client Setup

```dart
// lib/core/network/dio_client.dart
class DioClient {
  static Dio createDio() {
    final dio = Dio(BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: ApiConstants.connectTimeout,
      receiveTimeout: ApiConstants.receiveTimeout,
    ));
    
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.queryParameters['apiKey'] = ApiConstants.apiKey;
        return handler.next(options);
      },
      onError: (error, handler) {
        print('Error: ${error.message}');
        return handler.next(error);
      },
    ));
    
    return dio;
  }
}
```

## 📊 State Management

### Provider Setup

```dart
// main.dart
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewsProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => BookmarkProvider()),
      ],
      child: MyApp(),
    ),
  );
}
```

### News Provider Example

```dart
class NewsProvider with ChangeNotifier {
  List<Article> _articles = [];
  bool _isLoading = false;
  String? _error;
  
  List<Article> get articles => _articles;
  bool get isLoading => _isLoading;
  String? get error => _error;
  
  Future<void> fetchNews() async {
    _isLoading = true;
    notifyListeners();
    
    try {
      _articles = await _repository.getTopHeadlines();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
```

### UI Consumer

```dart
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<NewsProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return LoadingIndicator();
        }
        
        if (provider.error != null) {
          return ErrorWidget(error: provider.error!);
        }
        
        return ListView.builder(
          itemCount: provider.articles.length,
          itemBuilder: (_, i) => NewsCard(provider.articles[i]),
        );
      },
    );
  }
}
```

## 🌍 Localization

### Supported Languages
- 🇬🇧 English (en)
- 🇪🇬 Arabic (ar)
- 🇪🇸 Spanish (es)
- 🇫🇷 French (fr)

### Add New Language

1. Create ARB file: `lib/l10n/app_de.arb`

```json
{
  "@@locale": "de",
  "appTitle": "Nachrichten",
  "home": "Startseite",
  "search": "Suchen"
}
```

2. Configure `l10n.yaml`:

```yaml
arb-dir: lib/l10n
template-arb-file: app_en.arb
output-localization-file: app_localizations.dart
```

3. Generate:

```bash
flutter gen-l10n
```

4. Use in code:

```dart
Text(AppLocalizations.of(context)!.appTitle)
```

## 🧪 Testing

### Run Tests

```bash
# All tests
flutter test

# With coverage
flutter test --coverage

# Specific file
flutter test test/unit/providers/news_provider_test.dart

# View coverage
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

### Test Example

```dart
void main() {
  group('NewsProvider', () {
    test('fetchNews updates articles', () async {
      final provider = NewsProvider();
      await provider.fetchNews();
      
      expect(provider.articles, isNotEmpty);
      expect(provider.isLoading, false);
    });
  });
}
```

## 📦 Building for Production

### Android

```bash
# APK
flutter build apk --release

# App Bundle (Play Store)
flutter build appbundle --release

# Split per ABI
flutter build apk --split-per-abi
```

### iOS

```bash
# iOS build
flutter build ios --release

# IPA file
flutter build ipa --release
```

### Web

```bash
# Web build
flutter build web --release

# With CanvasKit
flutter build web --web-renderer canvaskit
```

### Desktop

```bash
# Windows
flutter build windows --release

# macOS
flutter build macos --release

# Linux
flutter build linux --release
```

## ⚡ Performance Optimization

### Image Optimization

```dart
CachedNetworkImage(
  imageUrl: article.imageUrl,
  placeholder: (_, __) => ShimmerWidget(),
  errorWidget: (_, __, ___) => PlaceholderImage(),
  cacheManager: CustomCacheManager(),
  maxHeightDiskCache: 1000,
  maxWidthDiskCache: 1000,
)
```

### Lazy Loading

```dart
ListView.builder(
  itemCount: articles.length,
  cacheExtent: 500,
  itemBuilder: (context, index) {
    if (index == articles.length - 1) {
      provider.loadMore(); // Pagination
    }
    return NewsCard(articles[index]);
  },
)
```

### Code Splitting

```dart
// Lazy load screens
final detailScreen = await import('screens/detail_screen.dart');
```

## 🐛 Troubleshooting

### Common Issues

**Issue: API key not working**
```bash
# Check .env file exists
# Verify API key is valid
# Ensure flutter pub get was run
```

**Issue: Build fails**
```bash
flutter clean
flutter pub get
flutter pub upgrade
```

**Issue: Splash screen not showing**
```bash
dart run flutter_native_splash:create
flutter clean
flutter run
```

## 🤝 Contributing

We welcome contributions!

1. Fork the repository
2. Create feature branch (`git checkout -b feature/amazing`)
3. Commit changes (`git commit -m 'Add amazing feature'`)
4. Push to branch (`git push origin feature/amazing`)
5. Open Pull Request

### Code Style

- Follow official [Dart style guide](https://dart.dev/guides/language/effective-dart/style)
- Run `flutter analyze` before committing
- Add tests for new features
- Update documentation

## 📄 License

This project is licensed under the MIT License - see [LICENSE](LICENSE) file.

## 👨‍💻 Author

**Ahmed Shaltout**
- GitHub: [@AhmedShaltout85](https://github.com/AhmedShaltout85)
- Repository: [news_app_provider](https://github.com/AhmedShaltout85/news_app_provider)

## 🙏 Acknowledgments

- [Flutter Team](https://flutter.dev)
- [Provider Package](https://pub.dev/packages/provider)
- [NewsAPI](https://newsapi.org)
- [Dio HTTP Client](https://pub.dev/packages/dio)

## 📞 Support

- 📧 Email: Open an issue for support
- 🐛 Bugs: [GitHub Issues](https://github.com/AhmedShaltout85/news_app_provider/issues)
- 💬 Discussions: [GitHub Discussions](https://github.com/AhmedShaltout85/news_app_provider/discussions)

---

⭐ **Star this repo if you find it useful!**

Made with ❤️ using Flutter