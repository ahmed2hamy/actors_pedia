import 'package:actors_pedia/core/helpers/network/network_client.dart';
import 'package:actors_pedia/core/helpers/network/network_info.dart';
import 'package:actors_pedia/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:actors_pedia/features/home/data/repositories/home_repository_impl.dart';
import 'package:actors_pedia/features/home/domain/repositories/home_repository.dart';
import 'package:actors_pedia/features/home/domain/use_cases/get_people_use_case.dart';
import 'package:actors_pedia/features/home/presentation/manger/home_cubit.dart';
import 'package:get_it/get_it.dart';

Future<void> injectHomeFeature(GetIt sl) async {
  ///Bloc:
  sl.registerLazySingleton<HomeCubit>(
    () => HomeCubit(
      getPeopleUseCase: sl<GetPeopleUseCase>(),
    ),
  );

  ///UseCases:
  sl.registerFactory<GetPeopleUseCase>(
    () => GetPeopleUseCase(
      homeRepository: sl<HomeRepository>(),
    ),
  );

  ///Repository:
  sl.registerFactory<HomeRepository>(
    () => HomeRepositoryImpl(
      networkInfo: sl<NetworkInfo>(),
      remoteDataSource: sl<HomeRemoteDataSource>(),
    ),
  );

  ///DataSources:
  sl.registerFactory<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(
      networkClient: sl<NetworkClient>(),
    ),
  );
}
