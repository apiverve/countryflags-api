# Country Flags API - PHP Package

Country Flags is a country flag API that fetches direct download URLs for national flag images using two-letter ISO country codes. Responses return the country name, ISO code, and image link, while paid plans can select SVG or PNG formats and shapes.

## Installation

Install via Composer:

```bash
composer require apiverve/countryflags
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```php
<?php

require_once 'vendor/autoload.php';

use APIVerve\Countryflags\Client;

// Initialize the client
$client = new Client('YOUR_API_KEY');

// Make a request
$response = $client->execute([
    'country' => 'ZW',
    'format' => 'png',
    'shape' => 'circle'
]);

// Print the response
print_r($response);
```


### Error Handling

```php
use APIVerve\Countryflags\Client;
use APIVerve\Countryflags\Exceptions\APIException;
use APIVerve\Countryflags\Exceptions\ValidationException;

try {
    $response = $client->execute(['country' => 'ZW', 'format' => 'png', 'shape' => 'circle']);
    print_r($response['data']);
} catch (ValidationException $e) {
    echo "Validation error: " . implode(', ', $e->getErrors());
} catch (APIException $e) {
    echo "API error: " . $e->getMessage();
    echo "Status code: " . $e->getStatusCode();
}
```

### Debug Mode

```php
// Enable debug logging
$client = new Client(
    apiKey: 'YOUR_API_KEY',
    debug: true
);
```

## Example Response

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

## Requirements

- PHP 7.4 or higher
- Guzzle HTTP client

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/countryflags?utm_source=packagist&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/countryflags?utm_source=php&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/countryflags?utm_source=php&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This package is available under the [MIT License](LICENSE).
