Country Flags API
============

Country Flags is a country flag API that fetches direct download URLs for national flag images using two-letter ISO country codes. Responses return the country name, ISO code, and image link, while paid plans can select SVG or PNG formats and shapes.


[![PyPI version](https://img.shields.io/pypi/v/apiverve-countryflags.svg)](https://pypi.org/project/apiverve-countryflags/)

This is a Python wrapper for the [Country Flags API](https://apiverve.com/marketplace/countryflags?utm_source=pypi&utm_medium=referral&utm_content=readme)

---

## Installation

Using `pip`:

```bash
pip install apiverve-countryflags
```

Using `pip3`:

```bash
pip3 install apiverve-countryflags
```

---

## Configuration

Before using the Country Flags API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=pypi&utm_medium=referral&utm_content=readme)

---

## Quick Start

Here's a simple example to get you started quickly:

```python
from apiverve_countryflags.apiClient import CountryflagsAPIClient

# Initialize the client with your APIVerve API key
api = CountryflagsAPIClient("[YOUR_API_KEY]")

query = {
    "country": "ZW",
    "format": "png",
    "shape": "circle"
}

try:
    # Make the API call
    result = api.execute(query)

    # Print the result
    print(result)
except Exception as e:
    print(f"Error: {e}")
```

---

## Usage

The Country Flags API documentation is found here: [https://docs.apiverve.com/ref/countryflags](https://docs.apiverve.com/ref/countryflags?utm_source=pypi&utm_medium=referral&utm_content=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

```python
# Import the client module
from apiverve_countryflags.apiClient import CountryflagsAPIClient

# Initialize the client with your APIVerve API key
api = CountryflagsAPIClient("[YOUR_API_KEY]")
```

---

## Perform Request

Using the API client, you can perform requests to the API.

###### Define Query

```python
query = {
    "country": "ZW",
    "format": "png",
    "shape": "circle"
}
```

###### Simple Request

```python
# Make a request to the API
result = api.execute(query)

# Print the result
print(result)
```

###### Example Response

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

## Error Handling

The API client provides comprehensive error handling through the `CountryflagsAPIClientError` exception. Here are some examples:

### Basic Error Handling

```python
from apiverve_countryflags.apiClient import CountryflagsAPIClient, CountryflagsAPIClientError

api = CountryflagsAPIClient("[YOUR_API_KEY]")

query = {
    "country": "ZW",
    "format": "png",
    "shape": "circle"
}

try:
    result = api.execute(query)
    print("Success!")
    print(result)
except CountryflagsAPIClientError as e:
    print(f"API Error: {e.message}")
    if e.status_code:
        print(f"Status Code: {e.status_code}")
    if e.response:
        print(f"Response: {e.response}")
```

### Handling Specific Error Types

```python
from apiverve_countryflags.apiClient import CountryflagsAPIClient, CountryflagsAPIClientError

api = CountryflagsAPIClient("[YOUR_API_KEY]")

query = {
    "country": "ZW",
    "format": "png",
    "shape": "circle"
}

try:
    result = api.execute(query)

    # Check for successful response
    if result.get('status') == 'success':
        print("Request successful!")
        print(result.get('data'))
    else:
        print(f"API returned an error: {result.get('error')}")

except CountryflagsAPIClientError as e:
    # Handle API client errors
    if e.status_code == 401:
        print("Unauthorized: Invalid API key")
    elif e.status_code == 429:
        print("Rate limit exceeded")
    elif e.status_code >= 500:
        print("Server error - please try again later")
    else:
        print(f"API error: {e.message}")
except Exception as e:
    # Handle unexpected errors
    print(f"Unexpected error: {str(e)}")
```

### Using Context Manager (Recommended)

The client supports the context manager protocol for automatic resource cleanup:

```python
from apiverve_countryflags.apiClient import CountryflagsAPIClient, CountryflagsAPIClientError

query = {
    "country": "ZW",
    "format": "png",
    "shape": "circle"
}

# Using context manager ensures proper cleanup
with CountryflagsAPIClient("[YOUR_API_KEY]") as api:
    try:
        result = api.execute(query)
        print(result)
    except CountryflagsAPIClientError as e:
        print(f"Error: {e.message}")
# Session is automatically closed here
```

---

## Advanced Features

### Debug Mode

Enable debug logging to see detailed request and response information:

```python
from apiverve_countryflags.apiClient import CountryflagsAPIClient

# Enable debug mode
api = CountryflagsAPIClient("[YOUR_API_KEY]", debug=True)

query = {
    "country": "ZW",
    "format": "png",
    "shape": "circle"
}

# Debug information will be printed to console
result = api.execute(query)
```

### Manual Session Management

If you need to manually manage the session lifecycle:

```python
from apiverve_countryflags.apiClient import CountryflagsAPIClient

api = CountryflagsAPIClient("[YOUR_API_KEY]")

query = {
    "country": "ZW",
    "format": "png",
    "shape": "circle"
}

try:
    result = api.execute(query)
    print(result)
finally:
    # Manually close the session when done
    api.close()
```

---

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=pypi&utm_medium=referral&utm_content=readme).

---

## Updates
Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=pypi&utm_medium=referral&utm_content=readme) and all legal documents and agreements.

---

## License
Licensed under the MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
