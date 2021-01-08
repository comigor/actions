# dart-test action

Test, analyze and lint a Dart/Flutter package.

## Variables

| Required? | Variable             | Description                                                               |
|-----------|----------------------|---------------------------------------------------------------------------|
| No        | **repo_token**       | Access token for sending errors as a PR message                           |
| No        | **is_flutter**       | Run everything on Flutter context instead of Dart's                       |
| No        | **disable_linter**   | Disable dry-run `dartfmt` linter check                                    |
| No        | **disable_analyzer** | Disable `dartanalyzer`                                                    |
| No        | **disable_tests**    | Disable `pub run test`                                                    |
| No        | **exclude_regex**    | Regex to be used to exclude folders when looking for `pubspec.yaml` files |
