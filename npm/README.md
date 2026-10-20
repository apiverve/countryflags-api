# Country Flags API

Country Flags is a country flag API that fetches direct download URLs for national flag images using two-letter ISO country codes. Responses return the country name, ISO code, and image link, while paid plans can select SVG or PNG formats and shapes.

[![npm version](https://img.shields.io/npm/v/@apiverve/countryflags.svg)](https://www.npmjs.com/package/@apiverve/countryflags)

This is a JavaScript wrapper for the [Country Flags API](https://apiverve.com/marketplace/countryflags?utm_source=npm&utm_medium=referral&utm_content=readme)

---

## Installation

Using npm:
```shell
npm install @apiverve/countryflags
```

Using yarn:
```shell
yarn add @apiverve/countryflags
```

---

## Configuration

Before using the Country Flags API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=npm&utm_medium=referral&utm_content=readme)

---

## Quick Start

[Get started with the Quick Start Guide](https://docs.apiverve.com/quickstart?utm_source=npm&utm_medium=referral&utm_content=readme)

The Country Flags API documentation is found here: [https://docs.apiverve.com/ref/countryflags](https://docs.apiverve.com/ref/countryflags?utm_source=npm&utm_medium=referral&utm_content=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

```javascript
const countryflagsAPI = require('@apiverve/countryflags');
const api = new countryflagsAPI({
    api_key: '[YOUR_API_KEY]'
});
```

---

## Usage

---

### Perform Request

Using the API is simple. All you have to do is make a request. The API will return a response with the data you requested.

```javascript
var query = {
  country: "ZW",
  format: "png",
  shape: "circle"
};

api.execute(query, function (error, data) {
    if (error) {
        return console.error(error);
    } else {
        console.log(data);
    }
});
```

---

### Using Promises

You can also use promises to make requests. The API returns a promise that you can use to handle the response.

```javascript
var query = {
  country: "ZW",
  format: "png",
  shape: "circle"
};

api.execute(query)
    .then(data => {
        console.log(data);
    })
    .catch(error => {
        console.error(error);
    });
```

---

### Using Async/Await

You can also use async/await to make requests. The API returns a promise that you can use to handle the response.

```javascript
async function makeRequest() {
    var query = {
  country: "ZW",
  format: "png",
  shape: "circle"
};

    try {
        const data = await api.execute(query);
        console.log(data);
    } catch (error) {
        console.error(error);
    }
}
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

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=npm&utm_medium=referral&utm_content=readme).

---

## Updates

Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=npm&utm_medium=referral&utm_content=readme) and [Privacy Policy](https://apiverve.com/privacy?utm_source=npm&utm_medium=referral&utm_content=readme).

---

## License
Licensed under the MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
