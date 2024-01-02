## About components
### 1. mock-server
We can modify data in `./data`

#### For example:
- URL: cvservices/v2/contdowncompletion
- Method: POST
- Return headers:
```
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8
```
- Return data:
```json
    {
        "resultCode": "200S00",
        "AppRequestNo": "0E49CA70EA1C2BA9BE8C951D417A3B564C1D21FE",
        "ReturnCode": "000000"
    }
```

We can make the file `mock-server/data/cvservices/v2/contdowncompletion/POST.mock` for respective data

#### Detail:
https://www.npmjs.com/package/mockserver