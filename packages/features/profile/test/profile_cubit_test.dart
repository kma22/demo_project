import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:logger_manager/logger_manager.dart';

import 'package:profile/src/domain/repository/base_profile_repository.dart';

import 'package:profile/src/presentation/cubit/profile_cubit.dart';

import 'profile_cubit_test.mocks.dart';

@GenerateMocks([BaseProfileRepository, AppLogger])
void main() {
  late ProfileCubit cubit;
  late MockBaseProfileRepository mockRepository;
  late MockAppLogger mockLogger;

  setUp(() {
    mockRepository = MockBaseProfileRepository();
    mockLogger = MockAppLogger();
    cubit = ProfileCubit(mockRepository, mockLogger);
  });

  tearDown(() => cubit.close());

  test('initial state is ProfileInitialState', () {
    expect(cubit.state, isA<ProfileInitialState>());
  });
}
