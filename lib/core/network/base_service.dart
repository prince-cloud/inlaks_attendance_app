const hostUrl = 'http://192.168.1.99:8000';

Map<String, String> serviceHeaders = {
  "CONTENT-TYPE": "application/json",
};

Map<String, String> get headersNoContentType =>
    {...serviceHeaders}..remove("CONTENT-TYPE");