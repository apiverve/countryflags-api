# Country Flags API - Dart/Flutter Client

Country Flags is a country flag API that fetches direct download URLs for national flag images using two-letter ISO country codes. Responses return the country name, ISO code, and image link, while paid plans can select SVG or PNG formats and shapes.

[![pub package](https://img.shields.io/pub/v/apiverve_countryflags.svg)](https://pub.dev/packages/apiverve_countryflags)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is the Dart/Flutter client for the [Country Flags API](https://apiverve.com/marketplace/countryflags?utm_source=dart&utm_medium=referral&utm_content=readme).

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  apiverve_countryflags: ^1.2.3
```

Then run:

```bash
dart pub get
# or for Flutter
flutter pub get
```

## Usage

```dart
import 'package:apiverve_countryflags/apiverve_countryflags.dart';

void main() async {
  final client = CountryflagsClient('YOUR_API_KEY');

  try {
    final response = await client.execute({
      'country': 'ZW',
      'format': 'png',
      'shape': 'circle'
    });

    print('Status: ${response.status}');
    print('Data: ${response.data}');
  } catch (e) {
    print('Error: $e');
  }
}
```

## Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "country": "Zimbabwe",
    "countryCode": "ZW",
    "shape": "circle",
    "format": "png",
    "downloadUrl": "https://storage.googleapis.com/apiverve/APIResources/countryflags/circle/png/zw.png?GoogleAccessId=635500398038-compute%40developer.gserviceaccount.com&Expires=1766096512&Signature=EfbtYmSr82YpFvV%2FYWRrlA66wKW4j2%2F2n6EDLGnpwhxd9pXvzBQm4xhNVnwRy3tHCvDTWNQTQUaP9kndqcqm5NBlsfzgJlHpBLPLNt3xRBgXwAm5vmPMfoQY%2B%2BHwmYkxBH1H%2BnIkoWeXEsDLoh1MdwUfvTKKP9PDlCyc2FQUJyZoqXxdshHE9l%2Fv019N9z3AipL7jpmeJQnMTDtos8aCa2I9dm%2FzgpMvi2fdMiRfMCNsjlbyug0h0w6wO1W3FLc3K477psnT4BcXARBmn3dYq4hSSLdmhPnKMpCrYXFnhdxZq0VHXNHid1FwLYuMcp%2FPHIJ1%2Fj2OvqMUPEpip%2Fq%2FpA%3D%3D"
  }
}
```

## API Reference

- **API Home:** [Country Flags API](https://apiverve.com/marketplace/countryflags?utm_source=dart&utm_medium=referral&utm_content=readme)
- **Documentation:** [docs.apiverve.com/ref/countryflags](https://docs.apiverve.com/ref/countryflags?utm_source=dart&utm_medium=referral&utm_content=readme)

## Authentication

All requests require an API key. Get yours at [apiverve.com](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme).

## License

MIT License - see [LICENSE](LICENSE) for details.

---

Built with Dart for [APIVerve](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme)
