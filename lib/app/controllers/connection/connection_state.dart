import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:testcase/app/models/country_model.dart';

part 'connection_state.freezed.dart';

@freezed
class ConnectionState with _$ConnectionState {
  const factory ConnectionState({
    @Default(null) final CountryModel? selectedCountry,
    @Default(null) final DateTime? connectionTime,
    @Default(0) final double downloadSize,
    @Default(0) final double uploadSize,
    final List<CountryModel?>? filteredList,
  }) = _ConnectionState;
}
