import 'package:flutter/foundation.dart';

/// Utilitaire pour parser de manière sécurisée des listes JSON
///
/// Cette classe permet de parser des listes d'objets JSON sans qu'une erreur
/// sur un seul élément ne fasse échouer tout le parsing.
///
/// Usage:
/// ```dart
/// final result = SafeParsing.parseList<MyModel>(
///   jsonList,
///   (json) => MyModel.fromJson(json),
/// );
/// ```
class SafeParsing {
  /// Parse une liste JSON en filtrant les éléments qui échouent au parsing
  ///
  /// [data] : La liste de données JSON à parser
  /// [fromJson] : La fonction de parsing pour chaque élément
  /// [logErrors] : Si true, log les erreurs de parsing (défaut: true)
  ///
  /// Retourne une liste contenant uniquement les éléments qui ont été parsés avec succès
  static List<T> parseList<T>(
    List<dynamic> data,
    T Function(Map<String, dynamic>) fromJson, {
    bool logErrors = true,
  }) {
    final List<T> result = [];
    int errorCount = 0;

    for (int i = 0; i < data.length; i++) {
      try {
        final json = data[i] as Map<String, dynamic>;
        final item = fromJson(json);
        result.add(item);
      } catch (error, stackTrace) {
        errorCount++;
        if (logErrors && kDebugMode) {
          if (kDebugMode) {
            print(
              '❌ Erreur de parsing pour l\'élément $i/${data.length} : $error',
            );
            print('Stack trace: $stackTrace');
            print('Données problématiques: ${data[i]}');
          }
        }
      }
    }

    if (errorCount > 0 && logErrors && kDebugMode) {
      if (kDebugMode) {
        print(
          '⚠️ Parsing terminé : ${result.length} éléments parsés avec succès, $errorCount erreurs ignorées',
        );
      }
    }

    return result;
  }

  /// Parse une liste JSON de manière encore plus sécurisée
  /// Retourne un objet contenant la liste parsée ET les erreurs
  ///
  /// Utile pour un traitement plus fin des erreurs
  static SafeParsingResult<T> parseListWithErrors<T>(
    List<dynamic> data,
    T Function(Map<String, dynamic>) fromJson, {
    bool logErrors = true,
  }) {
    final List<T> successfulItems = [];
    final List<ParsingError> errors = [];

    for (int i = 0; i < data.length; i++) {
      try {
        final json = data[i] as Map<String, dynamic>;
        final item = fromJson(json);
        successfulItems.add(item);
      } catch (error, stackTrace) {
        final parsingError = ParsingError(
          index: i,
          data: data[i],
          error: error,
          stackTrace: stackTrace,
        );
        errors.add(parsingError);

        if (logErrors && kDebugMode) {
          if (kDebugMode) {
            print(
              '❌ Erreur de parsing pour l\'élément $i/${data.length} : $error',
            );
          }
        }
      }
    }

    if (errors.isNotEmpty && logErrors && kDebugMode) {
      if (kDebugMode) {
        print(
          '⚠️ Parsing terminé : ${successfulItems.length} succès, ${errors.length} erreurs',
        );
      }
    }

    return SafeParsingResult(
      items: successfulItems,
      errors: errors,
      totalCount: data.length,
    );
  }

  /// Parse un seul objet JSON de manière sécurisée
  /// Retourne null en cas d'erreur au lieu de lever une exception
  static T? parseObject<T>(
    Map<String, dynamic>? json,
    T Function(Map<String, dynamic>) fromJson, {
    bool logErrors = true,
  }) {
    if (json == null) return null;

    try {
      return fromJson(json);
    } catch (error, stackTrace) {
      if (logErrors && kDebugMode) {
        if (kDebugMode) {
          print('❌ Erreur de parsing de l\'objet : $error');
          print('Stack trace: $stackTrace');
          print('Données problématiques: $json');
        }
      }
      return null;
    }
  }
}

/// Résultat du parsing sécurisé contenant les éléments parsés et les erreurs
class SafeParsingResult<T> {
  final List<T> items;
  final List<ParsingError> errors;
  final int totalCount;

  SafeParsingResult({
    required this.items,
    required this.errors,
    required this.totalCount,
  });

  /// Indique si tous les éléments ont été parsés avec succès
  bool get hasNoErrors => errors.isEmpty;

  /// Indique si au moins un élément a échoué au parsing
  bool get hasErrors => errors.isNotEmpty;

  /// Taux de succès du parsing (0.0 à 1.0)
  double get successRate => totalCount > 0 ? items.length / totalCount : 0.0;

  /// Taux de succès en pourcentage (0 à 100)
  double get successPercentage => successRate * 100;
}

/// Représente une erreur de parsing individuelle
class ParsingError {
  final int index;
  final dynamic data;
  final Object error;
  final StackTrace stackTrace;

  ParsingError({
    required this.index,
    required this.data,
    required this.error,
    required this.stackTrace,
  });

  @override
  String toString() {
    return 'ParsingError(index: $index, error: $error)';
  }
}
