echo 'Generating locales..⏳'
flutter pub run easy_localization:generate -S "assets/translations" -O "lib/common/translations" -o "locale_keys.g.dart" -f keys
echo 'Generating locales COMPLETE ✅'

  