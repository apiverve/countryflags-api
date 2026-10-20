Country Flags API
============

Country Flags is a country flag API that fetches direct download URLs for national flag images using two-letter ISO country codes. Responses return the country name, ISO code, and image link, while paid plans can select SVG or PNG formats and shapes.


[![NuGet version](https://img.shields.io/nuget/v/APIVerve.API.CountryFlags.svg)](https://www.nuget.org/packages/APIVerve.API.CountryFlags)

This is a .NET wrapper for the [Country Flags API](https://apiverve.com/marketplace/countryflags?utm_source=nuget&utm_medium=referral&utm_content=readme)

---

## Installation

Using the .NET CLI:
```
dotnet add package APIVerve.API.CountryFlags
```

Using the Package Manager:
```
nuget install APIVerve.API.CountryFlags
```

Using the Package Manager Console:
```
Install-Package APIVerve.API.CountryFlags
```

From within Visual Studio:

1. Open the Solution Explorer
2. Right-click on a project within your solution
3. Click on Manage NuGet Packages
4. Click on the Browse tab and search for "APIVerve.API.CountryFlags"
5. Click on the APIVerve.API.CountryFlags package, select the appropriate version in the right-tab and click Install

---

## Configuration

Before using the Country Flags API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=nuget&utm_medium=referral&utm_content=readme)

---

## Quick Start

Here's a simple example to get you started quickly:

```csharp
using System;
using APIVerve.API.CountryFlags;

class Program
{
    static async Task Main(string[] args)
    {
        // Initialize the API client
        var apiClient = new CountryFlagsAPIClient("[YOUR_API_KEY]");

        var queryOptions = new CountryFlagsQueryOptions {
            Country = "ZW",
            Format = "png",
            Shape = "circle"
        };

        // Make the API call
        try
        {
            var response = await apiClient.ExecuteAsync(queryOptions);

            if (response.Error != null)
            {
                Console.WriteLine($"API Error: {response.Error}");
            }
            else
            {
                Console.WriteLine("Success!");
                // Access response data using the strongly-typed ResponseObj properties
                Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Exception: {ex.Message}");
        }
    }
}
```

---

## Usage

The Country Flags API documentation is found here: [https://docs.apiverve.com/ref/countryflags](https://docs.apiverve.com/ref/countryflags?utm_source=nuget&utm_medium=referral&utm_content=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

###### Authentication
Country Flags API uses API Key-based authentication. When you create an instance of the API client, you can pass your API Key as a parameter.

```csharp
// Create an instance of the API client
var apiClient = new CountryFlagsAPIClient("[YOUR_API_KEY]");
```

---

## Usage Examples

### Basic Usage (Async/Await Pattern - Recommended)

The modern async/await pattern provides the best performance and code readability:

```csharp
using System;
using System.Threading.Tasks;
using APIVerve.API.CountryFlags;

public class Example
{
    public static async Task Main(string[] args)
    {
        var apiClient = new CountryFlagsAPIClient("[YOUR_API_KEY]");

        var queryOptions = new CountryFlagsQueryOptions {
            Country = "ZW",
            Format = "png",
            Shape = "circle"
        };

        var response = await apiClient.ExecuteAsync(queryOptions);

        if (response.Error != null)
        {
            Console.WriteLine($"Error: {response.Error}");
        }
        else
        {
            Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
        }
    }
}
```

### Synchronous Usage

If you need to use synchronous code, you can use the `Execute` method:

```csharp
using System;
using APIVerve.API.CountryFlags;

public class Example
{
    public static void Main(string[] args)
    {
        var apiClient = new CountryFlagsAPIClient("[YOUR_API_KEY]");

        var queryOptions = new CountryFlagsQueryOptions {
            Country = "ZW",
            Format = "png",
            Shape = "circle"
        };

        var response = apiClient.Execute(queryOptions);

        if (response.Error != null)
        {
            Console.WriteLine($"Error: {response.Error}");
        }
        else
        {
            Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
        }
    }
}
```

---

## Error Handling

The API client provides comprehensive error handling. Here are some examples:

### Handling API Errors

```csharp
using System;
using System.Threading.Tasks;
using APIVerve.API.CountryFlags;

public class Example
{
    public static async Task Main(string[] args)
    {
        var apiClient = new CountryFlagsAPIClient("[YOUR_API_KEY]");

        var queryOptions = new CountryFlagsQueryOptions {
            Country = "ZW",
            Format = "png",
            Shape = "circle"
        };

        try
        {
            var response = await apiClient.ExecuteAsync(queryOptions);

            // Check for API-level errors
            if (response.Error != null)
            {
                Console.WriteLine($"API Error: {response.Error}");
                Console.WriteLine($"Status: {response.Status}");
                return;
            }

            // Success - use the data
            Console.WriteLine("Request successful!");
            Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
        }
        catch (ArgumentException ex)
        {
            // Invalid API key or parameters
            Console.WriteLine($"Invalid argument: {ex.Message}");
        }
        catch (System.Net.Http.HttpRequestException ex)
        {
            // Network or HTTP errors
            Console.WriteLine($"Network error: {ex.Message}");
        }
        catch (Exception ex)
        {
            // Other errors
            Console.WriteLine($"Unexpected error: {ex.Message}");
        }
    }
}
```

### Comprehensive Error Handling with Retry Logic

```csharp
using System;
using System.Threading.Tasks;
using APIVerve.API.CountryFlags;

public class Example
{
    public static async Task Main(string[] args)
    {
        var apiClient = new CountryFlagsAPIClient("[YOUR_API_KEY]");

        // Configure retry behavior (max 3 retries)
        apiClient.SetMaxRetries(3);        // Retry up to 3 times (default: 0, max: 3)
        apiClient.SetRetryDelay(2000);     // Wait 2 seconds between retries

        var queryOptions = new CountryFlagsQueryOptions {
            Country = "ZW",
            Format = "png",
            Shape = "circle"
        };

        try
        {
            var response = await apiClient.ExecuteAsync(queryOptions);

            if (response.Error != null)
            {
                Console.WriteLine($"API Error: {response.Error}");
            }
            else
            {
                Console.WriteLine("Success!");
                Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Failed after retries: {ex.Message}");
        }
    }
}
```

---

## Advanced Features

### Custom Headers

Add custom headers to your requests:

```csharp
var apiClient = new CountryFlagsAPIClient("[YOUR_API_KEY]");

// Add custom headers
apiClient.AddCustomHeader("X-Custom-Header", "custom-value");
apiClient.AddCustomHeader("X-Request-ID", Guid.NewGuid().ToString());

var queryOptions = new CountryFlagsQueryOptions {
    Country = "ZW",
    Format = "png",
    Shape = "circle"
};

var response = await apiClient.ExecuteAsync(queryOptions);

// Remove a header
apiClient.RemoveCustomHeader("X-Custom-Header");

// Clear all custom headers
apiClient.ClearCustomHeaders();
```

### Request Logging

Enable logging for debugging:

```csharp
var apiClient = new CountryFlagsAPIClient("[YOUR_API_KEY]", isDebug: true);

// Or use a custom logger
apiClient.SetLogger(message =>
{
    Console.WriteLine($"[LOG] {DateTime.Now:yyyy-MM-dd HH:mm:ss} - {message}");
});

var queryOptions = new CountryFlagsQueryOptions {
    Country = "ZW",
    Format = "png",
    Shape = "circle"
};

var response = await apiClient.ExecuteAsync(queryOptions);
```

### Retry Configuration

Customize retry behavior for failed requests:

```csharp
var apiClient = new CountryFlagsAPIClient("[YOUR_API_KEY]");

// Set retry options
apiClient.SetMaxRetries(3);           // Retry up to 3 times (default: 0, max: 3)
apiClient.SetRetryDelay(1500);        // Wait 1.5 seconds between retries (default: 1000ms)

var queryOptions = new CountryFlagsQueryOptions {
    Country = "ZW",
    Format = "png",
    Shape = "circle"
};

var response = await apiClient.ExecuteAsync(queryOptions);
```

### Dispose Pattern

The API client implements `IDisposable` for proper resource cleanup:

```csharp
var queryOptions = new CountryFlagsQueryOptions {
    Country = "ZW",
    Format = "png",
    Shape = "circle"
};

using (var apiClient = new CountryFlagsAPIClient("[YOUR_API_KEY]"))
{
    var response = await apiClient.ExecuteAsync(queryOptions);
    Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
}
// HttpClient is automatically disposed here
```

---

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

---

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=nuget&utm_medium=referral&utm_content=readme).

---

## Updates
Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=nuget&utm_medium=referral&utm_content=readme) and all legal documents and agreements.

---

## License
Licensed under the MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
