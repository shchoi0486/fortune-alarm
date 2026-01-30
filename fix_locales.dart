import 'dart:convert';
import 'dart:io';

void main() {
  final dir = Directory('c:/Snap Alarm/lib/l10n');
  final files = dir.listSync().where((f) => f.path.endsWith('.arb'));
  
  for (var file in files) {
    if (file is File) {
      final fileName = file.path.split(Platform.pathSeparator).last;
      final localeMatch = RegExp(r'app_(.*)\.arb').firstMatch(fileName);
      if (localeMatch != null) {
        final locale = localeMatch.group(1);
        final content = file.readAsStringSync();
        var data = json.decode(content);
        data['@@locale'] = locale;
        final encoder = JsonEncoder.withIndent('  ');
        file.writeAsStringSync(encoder.convert(data));
        print('Fixed locale for $fileName: $locale');
      }
    }
  }
}
