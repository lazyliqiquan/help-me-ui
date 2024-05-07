import 'dart:html' as html;

void setHash(String key, String value) {
  html.window.localStorage[key] = value;
}

String getHash(String key) {
  return html.window.localStorage[key] ?? '';
}
