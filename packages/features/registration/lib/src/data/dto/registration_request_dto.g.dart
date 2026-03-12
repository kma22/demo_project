// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegistrationRequestDto _$RegistrationRequestDtoFromJson(
  Map<String, dynamic> json,
) => RegistrationRequestDto(
  email: json['email'] as String,
  password: json['password'] as String,
);

Map<String, dynamic> _$RegistrationRequestDtoToJson(
  RegistrationRequestDto instance,
) => <String, dynamic>{'email': instance.email, 'password': instance.password};
