const hostUrl = 'http://172.20.10.2:8000';

Map<String, String> serviceHeaders = {
  "CONTENT-TYPE": "application/json",
};

Map<String, String> get headersNoContentType =>
    {...serviceHeaders}..remove("CONTENT-TYPE");
