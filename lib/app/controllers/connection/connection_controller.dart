// ignore_for_file: non_constant_identifier_names

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:testcase/app/controllers/connection/connection_state.dart';
import 'package:testcase/app/models/country_model.dart';
import 'package:testcase/core/cache_service/cache_service.dart';
import 'package:testcase/core/enums/cache_paths.dart';

import '../../../core/cache_service/cache_repository.dart';

/// ConnectionController provider.
final connectionControllerProvider =
    StateNotifierProvider<ConnectionController, ConnectionState>(
  (final ref) => ConnectionController(
    cacheRepo: CacheService.instance,
  ),
);

/// ConnectionController
class ConnectionController extends StateNotifier<ConnectionState> {
  /// ConnectionController constructor.

  ConnectionController({
    required CacheRepository cacheRepo,
  })  : _cacheRepo = cacheRepo,
        super(const ConnectionState()) {
    Future.microtask(() async {});
  }

  final CacheRepository _cacheRepo;

  Future<void> init() async {
    getDownloadAndUploadSize();
    getSelectedCountry();
    getConnectionTime();
  }

  void toggleVPN(CountryModel? selectedCountry) {
    state.selectedCountry == selectedCountry
        ? disconnectVPN()
        : _connectVPN(selectedCountry);
  }

  void _connectVPN(CountryModel? selectedCountry) {
    saveSelectedCountry(selectedCountry);
    saveConnectionTime();
    setDownloadAndUploadSize();
  }

  void disconnectVPN() {
    state = state.copyWith(
      selectedCountry: null,
      connectionTime: null,
      downloadSize: 0,
      uploadSize: 0,
    );
    _cacheRepo.clearAll();
  }

  saveSelectedCountry(CountryModel? selectedCountry) {
    state = state.copyWith(selectedCountry: selectedCountry);

    _cacheRepo.saveObject<CountryModel?>(
        key: CachePaths.selectedCountry,
        object: selectedCountry,
        toJson: (country) => country?.toJson() ?? {});
  }

  saveConnectionTime() {
    state = state.copyWith(connectionTime: DateTime.now());

    _cacheRepo.saveDateTime(
        key: CachePaths.connectionTime, dateTime: DateTime.now());
  }

  _saveDownloadAndUploadSize(String? downloadSize, String? uploadSize) {
    _cacheRepo.saveString(
        key: CachePaths.downloadSize, value: downloadSize ?? '0');
    _cacheRepo.saveString(key: CachePaths.uploadSize, value: uploadSize ?? '0');
  }

  Future<void> setDownloadAndUploadSize() async {
    getDownloadAndUploadSize();

    final updatedDownloadSize = state.downloadSize + 0.5;
    final updatedUploadSize = state.uploadSize + 0.2;

    state = state.copyWith(
      downloadSize: updatedDownloadSize,
      uploadSize: updatedUploadSize,
    );
    _saveDownloadAndUploadSize(
        updatedDownloadSize.toString(), updatedUploadSize.toString());
  }

  getDownloadAndUploadSize() async {
    final downloadSize =
        await _cacheRepo.getString(key: CachePaths.downloadSize);
    final uploadSize = await _cacheRepo.getString(key: CachePaths.uploadSize);

    state = state.copyWith(
      downloadSize: double.parse(downloadSize ?? '0'),
      uploadSize: double.parse(uploadSize ?? '0'),
    );
  }

  getSelectedCountry() async {
    final selectedCountry = await _cacheRepo.getObject<CountryModel?>(
        key: CachePaths.selectedCountry,
        fromJson: (json) => CountryModel.fromJson(json));

    state = state.copyWith(selectedCountry: selectedCountry);
  }

  getConnectionTime() async {
    final connectionTime = await _cacheRepo.getDateTime(
      key: CachePaths.connectionTime,
    );

    state = state.copyWith(connectionTime: connectionTime);
  }

  filteredCountryList(String? query) {
    final result = CountryModel.mockList.where((country) {
      return (country.name ?? "").toLowerCase().contains(
            (query ?? "").toLowerCase(),
          );
    }).toList();
    state = state.copyWith(filteredList: result);
  }
}
