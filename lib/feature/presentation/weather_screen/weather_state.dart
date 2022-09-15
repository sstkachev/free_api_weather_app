import 'package:equatable/equatable.dart';

import '../../../core/models/weather_dto.dart';

class WeatherState extends Equatable {
  final String? city;
  final bool isRemoteLoading;
  final bool isLocalLoading;
  final WeatherDto? remoteResponse;
  final WeatherDto? localResponse;

  const WeatherState._({
    this.city,
    this.isRemoteLoading = false,
    this.isLocalLoading = false,
    this.remoteResponse,
    this.localResponse,
  });

  const WeatherState.initial() : this._(isRemoteLoading: false);

  WeatherState copyWith({
    String? city,
    bool? isRemoteLoading,
    bool? isLocalLoading,
    WeatherDto? remoteResponse,
    WeatherDto? localResponse,
  }) {
    return WeatherState._(
      city: city ?? this.city,
      isRemoteLoading: isRemoteLoading ?? this.isRemoteLoading,
      isLocalLoading: isLocalLoading ?? this.isLocalLoading,
      remoteResponse: remoteResponse ?? this.remoteResponse,
      localResponse: localResponse ?? this.localResponse,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        city,
        isRemoteLoading,
        isLocalLoading,
        remoteResponse,
        localResponse,
      ];
}
