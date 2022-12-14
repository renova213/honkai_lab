import 'package:honkai_lab/common/errors/exception.dart';
import 'package:honkai_lab/data/datasources/honkai_lab_remote_data_sources.dart';
import 'package:honkai_lab/domain/entities/active_code.dart';
import 'package:honkai_lab/common/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:honkai_lab/domain/entities/banner_character.dart';
import 'package:honkai_lab/domain/entities/changelog.dart';
import 'package:honkai_lab/domain/entities/elf_banner.dart';
import 'package:honkai_lab/domain/entities/event_honkai.dart';
import 'package:honkai_lab/domain/entities/latest_update.dart';
import 'package:honkai_lab/domain/entities/character.dart';
import 'package:honkai_lab/domain/entities/weapon_stigmata_banner.dart';
import 'package:honkai_lab/domain/repositories/honkai_lab_repositories.dart';

class HonkaiLabRepositoriesImpl implements HonkaiLabRepositories {
  final HonkaiLabRemoteDataSource remoteDataSource;

  HonkaiLabRepositoriesImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<ActiveCode>>> getActiveCodes(
      String collectionName) async {
    try {
      final activeCodes = await remoteDataSource.getActiveCodes(collectionName);

      return Right(activeCodes);
    } on ServerException {
      return const Left(
        ServerFailure(message: "can't connect to server"),
      );
    }
  }

  @override
  Future<Either<Failure, List<EventHonkai>>> getEventHonkai(
      String collectionName) async {
    try {
      final listEvent = await remoteDataSource.getEventHonkai(collectionName);

      return Right(listEvent);
    } on ServerException {
      return const Left(
        ServerFailure(message: "can't connect to server"),
      );
    }
  }

  @override
  Future<Either<Failure, List<LatestUpdate>>> getLatestUpdate(
      String collectionName) async {
    try {
      final listLatestUpdate =
          await remoteDataSource.getLastUpdate(collectionName);

      return Right(listLatestUpdate);
    } on ServerException {
      return const Left(
        ServerFailure(message: "can't connect to server"),
      );
    }
  }

  @override
  Future<Either<Failure, List<BannerCharacter>>> getBannerCharacter(
      String collectionName) async {
    try {
      final listBannercharacter =
          await remoteDataSource.getBannerCharacter(collectionName);

      return Right(listBannercharacter);
    } on ServerException {
      return const Left(
        ServerFailure(message: "can't connect to server"),
      );
    }
  }

  @override
  Future<Either<Failure, List<ElfBanner>>> getElfBanner(
      String collectionName) async {
    try {
      final listElfBanner = await remoteDataSource.getElfBanner(collectionName);

      return Right(listElfBanner);
    } on ServerException {
      return const Left(
        ServerFailure(message: "can't connect to server"),
      );
    }
  }

  @override
  Future<Either<Failure, List<WeaponStigmataBanner>>> getWeaponStigmaBanner(
      String collectionName) async {
    try {
      final listWeaponStigmaBanner =
          await remoteDataSource.getWeaponStigmaBanner(collectionName);

      return Right(listWeaponStigmaBanner);
    } on ServerException {
      return const Left(
        ServerFailure(message: "can't connect to server"),
      );
    }
  }

  @override
  Future<Either<Failure, List<Character>>> getCharacter(
      String collectionName, String value) async {
    try {
      final characters = await remoteDataSource.getCharacter(collectionName);
      final filterByValue = characters
          .where(
            (e) =>
                e.element.toLowerCase().contains(
                      value.toLowerCase(),
                    ) ||
                e.role.toLowerCase().contains(
                      value.toLowerCase(),
                    ) ||
                e.nameCharacter.toLowerCase().contains(
                      value.toLowerCase(),
                    ),
          )
          .toList();

      return Right(value.isEmpty ? characters : filterByValue);
    } on ServerException {
      return const Left(
        ServerFailure(message: "can't connect to server"),
      );
    }
  }

  @override
  Future<Either<Failure, Changelog>> getChangelog(String collectionName) async {
    try {
      final changelog = await remoteDataSource.getChangelog(collectionName);

      return Right(changelog);
    } on ServerException {
      return const Left(
        ServerFailure(message: "can't connect to server"),
      );
    }
  }
}
