# Faire tourner le projet en local

```bash
# Récupère les dépendances
flutter pub get
```

```bash
# Compile et lance le projet
flutter run
```

# Création d'un fichier de modèle

Pour créer correctement un fichier de modèle :

1. Créez un fichier Dart dans le dossier approprié (ex : `lib/models/nom_du_modele/nom_du_modele.dart`).
2. Utilisez les annotations nécessaires pour générer du code, comme `@freezed` pour les modèles immuables ou `@JsonSerializable` si besoin.
3. Ajoutez les parties nécessaires en haut du fichier :
   ```dart
   part 'nom_du_modele.freezed.dart';
   part 'nom_du_modele.g.dart';
   ```
4. Décrivez votre modèle en respectant la syntaxe attendue des packages utilisés (par exemple, pour `freezed`, voir exemple ci-dessous).
5. Exécutez la commande suivante pour générer les fichiers associés automatiquement à chaque modification :
   ```
   dart run build_runner watch -d
   ```
   Ou pour générer une seule fois :
   ```
   dart run build_runner build
   ```
   Un exemple de fichier modèle avec `freezed` :

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'person_model.freezed.dart';
part 'person_model.g.dart';

@freezed
class Person with _$Person {
  const factory Person({
    required String firstName,
    required String lastName,
    required int age,
  }) = _Person;

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
}
```

N'oubliez pas d'ajouter les dépendances nécessaires dans votre `pubspec.yaml` et d'importer les bibliothèques adéquates en fonction de vos besoins.
