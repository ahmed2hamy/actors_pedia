import 'package:actors_pedia/core/helpers/network/network_client.dart';
import 'package:actors_pedia/core/helpers/network/network_info.dart';
import 'package:actors_pedia/features/person_details/data/data_sources/person_details_remote_data_source.dart';
import 'package:actors_pedia/features/person_details/data/repositories/person_details_repository_impl.dart';
import 'package:actors_pedia/features/person_details/domain/repositories/person_details_repository.dart';
import 'package:actors_pedia/features/person_details/domain/use_cases/get_person_details_use_case.dart';
import 'package:actors_pedia/features/person_details/domain/use_cases/get_person_images_use_case.dart';
import 'package:actors_pedia/features/person_details/presentation/manager/person_details_cubit.dart';
import 'package:actors_pedia/features/person_details/presentation/manager/person_images_cubit/person_images_cubit.dart';
import 'package:get_it/get_it.dart';

Future<void> injectPersonDetailsFeature(GetIt sl) async {
  ///Bloc:
  sl.registerLazySingleton<PersonDetailsCubit>(
    () => PersonDetailsCubit(
      getPersonDetailsUseCase: sl<GetPersonDetailsUseCase>(),
    ),
  );
  sl.registerLazySingleton<PersonImagesCubit>(
    () => PersonImagesCubit(
      getPersonImagesUseCase: sl<GetPersonImagesUseCase>(),
    ),
  );

  ///UseCases:
  sl.registerFactory<GetPersonDetailsUseCase>(
    () => GetPersonDetailsUseCase(
      personDetailsRepository: sl<PersonDetailsRepository>(),
    ),
  );
  sl.registerFactory<GetPersonImagesUseCase>(
    () => GetPersonImagesUseCase(
      personDetailsRepository: sl<PersonDetailsRepository>(),
    ),
  );

  ///Repository:
  sl.registerFactory<PersonDetailsRepository>(
    () => PersonDetailsRepositoryImpl(
      networkInfo: sl<NetworkInfo>(),
      remoteDataSource: sl<PersonDetailsRemoteDataSource>(),
    ),
  );

  ///DataSources:
  sl.registerFactory<PersonDetailsRemoteDataSource>(
    () => PersonDetailsRemoteDataSourceImpl(
      networkClient: sl<NetworkClient>(),
    ),
  );
}
