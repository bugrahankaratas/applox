import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/enums/country_codes.dart';

part 'country_model.freezed.dart';
part 'country_model.g.dart';

@freezed
class CountryModel with _$CountryModel {
  const factory CountryModel({
    final String? code,
    final String? name,
    final List<String>? locations,
  }) = _CountryModel;

  factory CountryModel.fromJson(Map<String, Object?> json) =>
      _$CountryModelFromJson(json);

  static List<CountryModel> get mockList => [
        CountryModel(
          code: CountriesInfo.de.code,
          name: CountriesInfo.de.name,
          locations: ['Berlin', 'Munich', 'Frankfurt'],
        ),
        CountryModel(
          code: CountriesInfo.en.code,
          name: CountriesInfo.en.name,
          locations: [
            'London',
            'Manchester',
            'Liverpool',
            'Birmingham',
            'Bristol'
          ],
        ),
        CountryModel(
          code: CountriesInfo.es.code,
          name: CountriesInfo.es.name,
          locations: ['Madrid', 'Barcelona', 'Seville', 'Valencia'],
        ),
        CountryModel(
          code: CountriesInfo.fr.code,
          name: CountriesInfo.fr.name,
          locations: ['Paris', 'Lyon'],
        ),
        CountryModel(
          code: CountriesInfo.it.code,
          name: CountriesInfo.it.name,
          locations: ['Rome', 'Milan', 'Naples'],
        ),
        CountryModel(
          code: CountriesInfo.tr.code,
          name: CountriesInfo.tr.name,
          locations: ['Istanbul', 'Ankara', 'Izmir', 'Bursa', 'Antalya'],
        ),
        CountryModel(
          code: CountriesInfo.us.code,
          name: CountriesInfo.us.name,
          locations: ['New York', 'Los Angeles', 'Chicago', 'Houston'],
        ),
        CountryModel(
          code: CountriesInfo.ru.code,
          name: CountriesInfo.ru.name,
          locations: ['Moscow', 'Saint Petersburg', 'Sochi'],
        ),
      ];
}
